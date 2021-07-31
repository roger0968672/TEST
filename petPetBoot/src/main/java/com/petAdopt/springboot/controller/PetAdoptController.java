package com.petAdopt.springboot.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.annotation.Repeatable;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.petAdopt.springboot.model.PetAdoptBean;
import com.petAdopt.springboot.service.IpetAdoptService;
import com.petAdopt.springboot.service.IpetAdoptServiceNom;




@Controller
//@RequestMapping(value= {"","petAdopt"})
public class PetAdoptController {
      
  @Value("${uploadDir}") //抓application內的uploadDir,指定儲存路徑
  private String uploadFolder;
	
//	@Autowired
//	private  IpetAdoptService pas; //此為DATA JPA作法
	
	@Autowired
	private IpetAdoptServiceNom pasn;   //自行定義pasn
	
	@GetMapping("/")
	public String mainFace(){
		return "MainFace";
	}
	@GetMapping("/petInsert")
	public String  petInsert() {
	   //return "PetInsertAjax";	
	   return "PetInsert"; 
	}
	
	@PostMapping("/update")
	public String SelectOne() {
		return "PetUpdata";
	}
	
	
	
	
	@GetMapping("/petSelectAll")
    public String petSelectAlltest(Model m) {
		List<PetAdoptBean> pas = pasn.petSelectAll();
		m.addAttribute("PetAdopts", pas);
    	return "PetSelect";
    }
//	@GetMapping("/petSelectAll")
//	public @ResponseBody List<PetAdoptBean> petSelectAllNom(){
//		return  pasn.petSelectAll();
//	}
	@GetMapping("/select/pet")  
	public String selectBypetID(@RequestParam("petID") Integer petID,Model m) {
		PetAdoptBean pabS = pasn.petSelectPetId(petID);
		m.addAttribute("pab", pabS);
		return "PetSelectOne";
	}
	
	@PostMapping("/petInsert.controller")
	public String petInsert(HttpServletRequest request ,Model m
			                 ,@RequestParam("petPic1")MultipartFile file1
			                 ) {
         PetAdoptBean pab = new PetAdoptBean();
         pab.setPetArea(request.getParameter("petArea").trim());
         pab.setPetBreeds(request.getParameter("petBreeds").trim()); //1
         pab.setPetColor(request.getParameter("petColor").trim()); //2
         pab.setPetGender(request.getParameter("petGender").trim()); //3
         pab.setPetInsertDay(request.getParameter("petInsertDay").trim()); 
         pab.setPetLigation(request.getParameter("petLigation").trim()); //5
         pab.setPetName(request.getParameter("petName").trim());  //6
         pab.setPetNarrate(request.getParameter("petNarrate").trim()); //7
         pab.setPetSpecies(request.getParameter("petSpecies").trim()); //8
         
         
         String fileName=file1.getOriginalFilename();  //抓取檔名
         int filenum= fileName.indexOf(".");
         String fileName1=fileName.substring(filenum);
         String fileName2=fileName.substring(0,filenum);
         // pasn.petInsert(pab); //DataJpa寫法
         pasn.petInsert(pab);
         m.addAttribute("pab",pab);
         
         try {
        	   
               String savePathDir = request.getServletContext().getRealPath(uploadFolder);//儲存路徑
               savePathDir+="\\"+pab.getPetID()+"\\1";
               System.out.println(fileName);
               
               System.out.println("檔案名為："+fileName2);
               System.out.println("副檔名為："+fileName1);

               //System.out.println(savePathDir);
               File  savefile1Dir = new File(savePathDir); //資料夾路徑
               savefile1Dir.mkdirs(); //路徑不存在的話會自己建
               File saveFile1Path=new File(savefile1Dir,fileName);//指定路徑跟名稱
               file1.transferTo(saveFile1Path);
			   //System.out.println("儲存路徑:"+saveFile1Path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "PetSelectOne";
	}
	
	
	@RequestMapping(path = "/responseImage.controller", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public void imgview(HttpServletRequest request
			, HttpServletResponse response
			,@RequestParam("petID") Integer petID
			) {
		try {
			String path1=uploadFolder+"/"+petID+"/1/write.jpg";
			System.out.println(path1);
			InputStream in = request.getServletContext().getResourceAsStream(path1);
			System.out.println(in);
			IOUtils.copy(in, response.getOutputStream());
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@PostMapping("/petDelete.controller")
     public String petDelete(HttpServletRequest request) {
		int petid=Integer.parseInt(request.getParameter("petID")); 
		//pas.delete(petid);
		pasn.petDelet(petid);
    	 return "MainFace";
     }

    @PostMapping("/petUpdataView")
    public String petSelectOne(int petID,Model m) {
    	//PetAdoptBean pasl = pas.selectOne(petID);
    	PetAdoptBean pasl = pasn.petSelectPetId(petID);
    	m.addAttribute("pas",pasl);
    	return "PetUpdata";
    }
    
    @PostMapping("/petUpdate.controller")
    public String petUpdate(Model m ,HttpServletRequest request) {
    	 
    	 int petid=Integer.parseInt(request.getParameter("petID")); 
    	 //PetAdoptBean pab = pas.selectOne(petid);
    	 PetAdoptBean pab = pasn.petSelectPetId(petid);
         pab.setPetArea(request.getParameter("petArea").trim());
         pab.setPetBreeds(request.getParameter("petBreeds").trim()); //1
         pab.setPetColor(request.getParameter("petColor").trim()); //2
         pab.setPetGender(request.getParameter("petGender").trim()); //3
         pab.setPetInsertDay(request.getParameter("petInsertDay").trim()); 
         pab.setPetLigation(request.getParameter("petLigation").trim()); //5
         pab.setPetName(request.getParameter("petName").trim());  //6
         pab.setPetNarrate(request.getParameter("petNarrate").trim()); //7
         pab.setPetSpecies(request.getParameter("petSpecies").trim()); //8
         
         //pas.save(pab);  
         pasn.petUpdata(pab);
         m.addAttribute("pab",pab);
         return "PetSelectOne";
    }
    
    

	
}
