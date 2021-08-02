package com.petAdopt.springboot.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.annotation.Repeatable;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
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
	String img1="img1";//新增img1
	String img2="img2";//新增img2
	String img3="img3";//新增img3
	
	
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
			                 ,@RequestParam("petPic2")MultipartFile file2
			                 ,@RequestParam("petPic3")MultipartFile file3
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
         
         
         String fileName1=file1.getOriginalFilename();  //抓取上傳檔名
       //System.out.println("上傳的全檔名"+fileName1);
         String fileName2=file2.getOriginalFilename();
         String fileName3=file3.getOriginalFilename();
         
         
         int filenum1= fileName1.lastIndexOf(".");//抓取最後一個.為多少數字.
         int filenum2=fileName2.lastIndexOf(".");
         int filenum3=fileName3.lastIndexOf(".");
         String pictest1=fileName1.substring(0,filenum1);//只有圖片名稱
         //System.out.println("檔案名為："+pictest1);

         String picName1=fileName1.substring(filenum1);//只有副檔名名稱
         System.out.println("副檔名為："+picName1);
         String picName2=fileName2.substring(filenum2);
         String picName3=fileName3.substring(filenum3);
         
         String imgName1=img1+picName1; // img1+副檔名
         String imgName2=img2+picName2;
         String imgName3=img3+picName3;
         
          
         // pasn.petInsert(pab); //DataJpa寫法
         
         
          String[][] picn=new String[3][2];
          picn[0][0]=img1;
          picn[0][1]=picName1;
          picn[1][0]=img2;
          picn[1][1]=picName2;
          picn[2][0]=img3;
          picn[2][1]=picName3;		  
          pab.setPicName(picn);
         pasn.petInsert(pab);
         m.addAttribute("pab",pab);
         
         try {
               String savePathDir = request.getServletContext().getRealPath(uploadFolder);//儲存路徑
               savePathDir+="\\"+pab.getPetID();
               //System.out.println(savePathDir);//印出上船路徑
               File  savefile1Dir = new File(savePathDir); //資料夾路徑
               savefile1Dir.mkdirs(); //路徑不存在的話會自己建
               File saveFile1Path=new File(savefile1Dir,imgName1);//指定路徑跟名稱
               file1.transferTo(saveFile1Path);
			   //System.out.println("儲存路徑:"+saveFile1Path);
               
               File saveFile2path = new File(savefile1Dir,imgName2);
               File saveFile3path = new File(savefile1Dir,imgName3);
               file2.transferTo(saveFile2path);//圖片二儲存
               file3.transferTo(saveFile3path);//圖片三儲存
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "PetSelectOne";
	}
	
	
	@GetMapping(path = "/responseImage1.controller",produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public void img1View(HttpServletRequest request
			, HttpServletResponse response
			,@RequestParam("petID") Integer petID
			) {
		try {
			 PetAdoptBean pab = pasn.petSelectPetId(petID);
			String[][] pic = pab.getPicName();
			String imgName1 = pic[0][0]; //圖檔名為img1
			String imgN1 = pic[0][1];   //此為圖片副檔名
			String path1=uploadFolder+"/"+petID+"/"+imgName1+imgN1;//網址
			System.out.println("路徑:"+path1);
			// ex:  http://localhost:8081/petpet/responseImage1.controller?petID=1008	
			InputStream in1 = request.getServletContext().getResourceAsStream(path1);
			System.out.println(in1);
			IOUtils.copy(in1, response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("無法顯示圖片1");
		}
	}//此為圖片一的顯示方式
	   
	 
	   @GetMapping(path="/responseImage2.controller",produces = "text/plain;charset=UTF-8")
	   @ResponseBody
	   public void  img2View(HttpServletRequest request
			                 ,HttpServletResponse response
			                 ,@RequestParam("petID")Integer petID) {
		   try {  
			    PetAdoptBean pab = pasn.petSelectPetId(petID);
			    String[][] pic = pab.getPicName();
			    String imgName2 = pic[1][0];
				String imgN2 = pic[1][1];
				String path2=uploadFolder+"/"+petID+"/"+imgName2+imgN2;
				InputStream in2 = request.getServletContext().getResourceAsStream(path2);
				IOUtils.copy(in2, response.getOutputStream());
		        } catch (Exception e) {
			         e.printStackTrace();
			         System.out.println("無法顯示圖片2");
		           }
	     }  //此為圖片二的顯示方式
	
	   
	   @GetMapping(path = "/responseImage3.controller",produces = "text/plain;charset=UTF-8")
	   @ResponseBody
	   public void img3View(HttpServletRequest request
			                ,HttpServletResponse response
			                ,@RequestParam("petID")Integer petID) {
		    PetAdoptBean pab = pasn.petSelectPetId(petID);
		    String[][] pic = pab.getPicName();
		    String imgName3 = pic[2][0];
		    String imgN3 = pic[2][1];
		    String path3 = uploadFolder+"/"+petID+"/"+imgName3+imgN3;
		    InputStream in3 = request.getServletContext().getResourceAsStream(path3);
		    try {
		    	IOUtils.copy(in3,response.getOutputStream());
		    } catch (Exception e) {
			     e.printStackTrace();
			     System.out.println("無法顯示圖片3");
		      }
	   }//此為圖片三的顯示方式
	
	
	@PostMapping("/petDelete.controller")
     public String petDelete(HttpServletRequest request
    		                ,@RequestParam("petID") int petID ) {
		PetAdoptBean pab = pasn.petSelectPetId(petID);
		
		String[][] picPath1 = pab.getPicName();
		String imgName1 =picPath1[0][0];
		String picN=picPath1[0][1];
		 String path1 = uploadFolder+"/"+petID;
		 File img1 = new File(path1+"/"+imgName1+picN);
		 File file=new File(path1);
		//"C:/Users/Student/git/TEST/petPetBoot/src/main/webapp"+
		  
		   try {
			   Path path = Paths.get("C:/Users/Student/git/TEST/"+"petPetBoot/src/main/webapp/"+img1);
			   System.out.println(path);//圖片img1路徑
			   Files.delete(path);
			   
			   Path filen = Paths.get("C:/Users/Student/git/TEST/"+"petPetBoot/src/main/webapp/"+file);
			   System.out.println(filen);//資料夾
			   Files.delete(filen);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("刪除失敗");
		}
		  
		//pas.delete(petID);
		pasn.petDelete(petID);
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
    public String petUpdate(Model m ,HttpServletRequest request
    		                 ,@RequestParam("petPic1")MultipartFile file1
    		                ) {
    	 
    	 int petid=Integer.parseInt(request.getParameter("petID")); 
    	 //PetAdoptBean pab = pas.selectOne(petid);
    	 PetAdoptBean pab = pasn.petSelectPetId(petid);
    	 String fileName1 = file1.getOriginalFilename();//上傳檔名名稱
    	 int file1num = fileName1.lastIndexOf(".");//抓最後一個.為多少數字
    	 String picNa1 = fileName1.substring(file1num); //只有副檔名
         String img1="img1";//新增img1
         String imgName1=img1+picNa1; // img1+副檔名
         String[][] picn=new String[1][2];
         picn[0][0]=img1;
         picn[0][1]=picNa1;
         
         pab.setPicName(picn);
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
         
         try {
			String savePathDir = request.getServletContext().getRealPath(uploadFolder);
			savePathDir+="\\"+pab.getPetID();
			File saveFileDir = new File(savePathDir);
			saveFileDir.mkdirs();
			File saveFilePath1 = new File(savePathDir,imgName1);
			file1.transferTo(saveFilePath1);
		} catch (Exception e) {
			e.printStackTrace();
		}
         
         
         m.addAttribute("pab",pab);
         return "PetSelectOne";
    }
    
    

	
}
