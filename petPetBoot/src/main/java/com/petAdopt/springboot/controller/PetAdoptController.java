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
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.petAdopt.springboot.model.PetAdoptBean;
import com.petAdopt.springboot.model.TestMember;
import com.petAdopt.springboot.service.ITestMemberService;
import com.petAdopt.springboot.service.IpetAdoptService;
import com.petAdopt.springboot.service.IpetAdoptServiceNom;




@Controller
//@RequestMapping(value= {"","petAdopt"})
public class PetAdoptController {
	public  String img1="img1";//??????img1
	public  String img2="img2";//??????img2
	public  String img3="img3";//??????img3
	public static final String CPath="C:/Users/Student/git/TEST/";
	public static final String PROPath="petPetBoot/src/main/webapp/";
	
  @Value("${uploadDir}") //???application??????uploadDir,??????????????????
  private String uploadFolder;
	
  @Value("${shareurl}")
  private String shareurl;
	@Autowired
	private  IpetAdoptService pas; //??????DATA JPA?????? ??????IpetAdoptService
	
	@Autowired
	private ITestMemberService ITMS; //??????memberService
	

//	@Autowired
//	private IpetAdoptServiceNom pasn;   //????????????pasn
	
//	@Autowired
//	private ITestMemberService IMS;
	
	
	@GetMapping("/")  //?????????(????????????)
	public String mainFace(){
		return "MainFace";
	}
	
	@GetMapping("/seachpetadopt")
	public String seachPet(@RequestParam("seachpet") String seachpet,Model m) {
		List<PetAdoptBean> pab = pas.seachPetAdopt(seachpet);
		if(pab.isEmpty()) {
			System.out.println("????????????");
			return "PetSelectNull";
		}
		else {
			m.addAttribute("PetAdopts",pab);
			m.addAttribute("shareurl", shareurl);
			return "PetSelect";	
		}
	}
	
	@GetMapping("/selectpetspecies") //????????????????????????
	public String selectPetSpecies(String  petSpecies,Model m) {
		List<PetAdoptBean> pab = pas.selectPetSpecies(petSpecies);
		if(pab.isEmpty()) {
			System.out.println("????????????");
			return "PetSelectNull";
		}
		else{
			m.addAttribute("PetAdopts", pab);
			m.addAttribute("shareurl", shareurl);
		}return "PetSelect";	
	}
	
	@GetMapping("/selectpetarea")//????????????????????????
	public String selectPetArea(String petArea,Model m) {
		List<PetAdoptBean> pab = pas.selectPetArea(petArea);
		if(pab.isEmpty()) {
			return  "PetSelectNull";
		}
		else {
			m.addAttribute("PetAdopts",pab);
			m.addAttribute("shareurl", shareurl);
			return "PetSelect";
		}
	}
	@GetMapping("/selectpetareaandpetarea")
	public String selectPetAteaAndPetSpecies(String petArea,String petSpecies,Model m){
		List<PetAdoptBean> pab = pas.selectPetAreaAndPetSpecies(petArea, petSpecies);
		if(pab.isEmpty()) {
			return "PetSelectNull";
		}else {
			m.addAttribute("PetAdopts",pab);
			m.addAttribute("shareurl", shareurl);
			return "PetSelect";
		}
	}
	
	@RequestMapping(path={"/petAdoptselectAll/page/{pageNum}"},method = {RequestMethod.POST,RequestMethod.GET})
	public String petSelectPage(Model m,@PathVariable("pageNum")int pageNum,
			                    @Param("sortField")String sortField,
			                    @Param("sortDir")String sortDir) {
		Page<PetAdoptBean> page = pas.QueryAllPage(pageNum, sortField, sortDir);
	
		List<PetAdoptBean> listPetAdopt = page.getContent();
		m.addAttribute("currentPage", pageNum); //????????????
		m.addAttribute("totalPages", page.getTotalPages());//?????????
		m.addAttribute("totalItems", page.getTotalElements());//???????????????
		
		m.addAttribute("sortField", sortField);
	    m.addAttribute("sortDir", sortDir);
		m.addAttribute("PetAdopts", listPetAdopt);
		m.addAttribute("shareurl", shareurl);
		return "PetSelect2";
	}
	@RequestMapping(path={"/petAdoptselectAll"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String memberviewHomepage(Model m,String sortField, String sortDir) {
		return  petSelectPage(m,1, "petID", "desc");
	}//?????????????????????
	
	
	@GetMapping("/petInsert")  //????????????
	public String  petInsert(Model m) {
	   //return "PetInsertAjax";
		m.addAttribute("shareurl", shareurl);
	   return "PetInsert"; 
	}
	
	@GetMapping("/backstagePetAdopt") //????????????
    public String backagePet(Model m) {
		//List<PetAdoptBean> pas1 = pasn.petSelectAll();
		Iterable<PetAdoptBean> pas1 = pas.selectAll(); //DataJpa??????
		m.addAttribute("PetAdopts", pas1);
		m.addAttribute("shareurl", shareurl);
    	return "BackstagePetSelect";
    }
	
	@GetMapping("/memberSelectpet")  //??????member???????????????
	public String memberpetSelect(Model m ) {
		Integer memberid=2;
		List<PetAdoptBean> pas1 = pas.memberSelectPet(memberid);
		m.addAttribute("shareurl", shareurl);
		m.addAttribute("PetAdopts", pas1);
		return "PetSelect";
	}
	
	
	@GetMapping("/petSelectAll") //?????????????????????
    public String petSelectAlltest(Model m) {
		//List<PetAdoptBean> pas1 = pasn.petSelectAll();
		Iterable<PetAdoptBean> pas1 = pas.selectAll(); //DataJpa??????
		m.addAttribute("shareurl", shareurl);
		m.addAttribute("PetAdopts", pas1);
    	return "PetSelect";
    }
//	@GetMapping("/petSelectAll")
//	public @ResponseBody List<PetAdoptBean> petSelectAllNom(){
//		return  pasn.petSelectAll();
//	}
	 
	@GetMapping("/select/pet")   //????????????????????????
	public String selectBypetID(@RequestParam("petID") Integer petID,Model m) {
//		PetAdoptBean pabS = pasn.petSelectPetId(petID);
		PetAdoptBean pabS = pas.selectOne(petID); //DataJpa??????
	    
		m.addAttribute("pab", pabS);
		m.addAttribute("shareurl", shareurl);
		System.out.println(shareurl);
		return "PetSelectOne";
	}
	
	@PostMapping("/petInsert.controller") //????????????????????????????????????
	public String petInsert(HttpServletRequest request ,Model m
			                 ,@RequestParam("petPic1")MultipartFile file1
			                 ,@RequestParam("petPic2")MultipartFile file2
			                 ,@RequestParam("petPic3")MultipartFile file3
			                 ) {
		 Integer memberid=2;
		 //System.out.println(memberid);
		 TestMember member=ITMS.selectmemberid(memberid);//
		 //Integer id = member.getMemberid();
		 //System.out.println(id);
         PetAdoptBean pab = new PetAdoptBean();
         pab.setTestmember(member);
         pab.setPetArea(request.getParameter("petArea").trim());
         pab.setPetBreeds(request.getParameter("petBreeds").trim()); //1
         pab.setPetColor(request.getParameter("petColor").trim()); //2
         pab.setPetGender(request.getParameter("petGender").trim()); //3
         pab.setPetInsertDay(request.getParameter("petInsertDay").trim()); 
         pab.setPetLigation(request.getParameter("petLigation").trim()); //5
         pab.setPetName(request.getParameter("petName").trim());  //6
         pab.setPetNarrate(request.getParameter("petNarrate").trim()); //7
         pab.setPetSpecies(request.getParameter("petSpecies").trim()); //8
         
         
         String fileName1=file1.getOriginalFilename();  //??????????????????
       //System.out.println("??????????????????"+fileName1);
         String fileName2=file2.getOriginalFilename();
         String fileName3=file3.getOriginalFilename();
         
         
         int filenum1= fileName1.lastIndexOf(".");//??????????????????.???????????????.
         int filenum2=fileName2.lastIndexOf(".");
         int filenum3=fileName3.lastIndexOf(".");
         String pictest1=fileName1.substring(0,filenum1);//??????????????????
         //System.out.println("???????????????"+pictest1);

         String picName1=fileName1.substring(filenum1);//?????????????????????
         //System.out.println("???????????????"+picName1);
         String picName2=fileName2.substring(filenum2);
         String picName3=fileName3.substring(filenum3);
         
         String imgName1=img1+picName1; // img1+?????????
         String imgName2=img2+picName2;
         String imgName3=img3+picName3;
         
          
        
         
         
          String[][] picn=new String[3][2];
          picn[0][0]=img1;
          picn[0][1]=picName1;
          picn[1][0]=img2;
          picn[1][1]=picName2;
          picn[2][0]=img3;
          picn[2][1]=picName3;		  
          pab.setPicName(picn);
         //pasn.petInsert(pab);
          pas.Insert(pab); //DataJpa??????
         
         m.addAttribute("pab",pab);
         m.addAttribute("shareurl", shareurl);
         try {
               String savePathDir = request.getServletContext().getRealPath(uploadFolder);//????????????
               savePathDir+="\\"+pab.getPetID();
               //System.out.println(savePathDir);//??????????????????
               File  savefile1Dir = new File(savePathDir); //???????????????
               savefile1Dir.mkdirs(); //?????????????????????????????????
               File saveFile1Path=new File(savefile1Dir,imgName1);//?????????????????????
               file1.transferTo(saveFile1Path);
			   //System.out.println("????????????:"+saveFile1Path);
               
               File saveFile2path = new File(savefile1Dir,imgName2);
               File saveFile3path = new File(savefile1Dir,imgName3);
               file2.transferTo(saveFile2path);//???????????????
               file3.transferTo(saveFile3path);//???????????????
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
			 PetAdoptBean pab = pas.selectOne(petID);  //DataJpa??????
			 //PetAdoptBean pab = pasn.petSelectPetId(petID);
			String[][] pic = pab.getPicName();
			String imgName1 = pic[0][0]; //????????????img1
			String imgN1 = pic[0][1];   //?????????????????????
			String path1=uploadFolder+"/"+petID+"/"+imgName1+imgN1;//??????
			//System.out.println("??????:"+path1);
			// ex:  http://localhost:8081/petpet/responseImage1.controller?petID=1008	
			InputStream in1 = request.getServletContext().getResourceAsStream(path1);
			//System.out.println(in1);
			IOUtils.copy(in1, response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("??????????????????1");
		}
	}//??????????????????????????????
	   
	 
	   @GetMapping(path="/responseImage2.controller",produces = "text/plain;charset=UTF-8")
	   @ResponseBody
	   public void  img2View(HttpServletRequest request
			                 ,HttpServletResponse response
			                 ,@RequestParam("petID")Integer petID) {
		   try {  
			      PetAdoptBean pab = pas.selectOne(petID);  //DataJpa??????
			    //PetAdoptBean pab = pasn.petSelectPetId(petID);
			    String[][] pic = pab.getPicName();
			    String imgName2 = pic[1][0];
				String imgN2 = pic[1][1];
				String path2=uploadFolder+"/"+petID+"/"+imgName2+imgN2;
				InputStream in2 = request.getServletContext().getResourceAsStream(path2);
				IOUtils.copy(in2, response.getOutputStream());
		        } catch (Exception e) {
			         e.printStackTrace();
			         System.out.println("??????????????????2");
		           }
	     }  //??????????????????????????????
	
	   
	   @GetMapping(path = "/responseImage3.controller",produces = "text/plain;charset=UTF-8")
	   @ResponseBody
	   public void img3View(HttpServletRequest request
			                ,HttpServletResponse response
			                ,@RequestParam("petID")Integer petID) {
		    PetAdoptBean pab = pas.selectOne(petID);  //DataJpa??????
		    //PetAdoptBean pab = pasn.petSelectPetId(petID);
		    String[][] pic = pab.getPicName();
		    String imgName3 = pic[2][0];
		    String imgN3 = pic[2][1];
		    String path3 = uploadFolder+"/"+petID+"/"+imgName3+imgN3;
		    InputStream in3 = request.getServletContext().getResourceAsStream(path3);
		    try {
		    	IOUtils.copy(in3,response.getOutputStream());
		    } catch (Exception e) {
			     e.printStackTrace();
			     System.out.println("??????????????????3");
		      }
	   }//??????????????????????????????
	
	
	@PostMapping("/petDelete.controller")  //????????????
     public String petDelete(HttpServletRequest request
    		                ,@RequestParam("petID") int petID ) {
		//PetAdoptBean pab = pasn.petSelectPetId(petID);
		PetAdoptBean pab = pas.selectOne(petID);  //DataJpa??????
		String[][] picPath = pab.getPicName();
		String imgName1 =picPath[0][0];
		String imgName2 =picPath[1][0];
		String imgName3 =picPath[2][0];//?????????????????????,???img1  img2  img3
		String picN1=picPath[0][1]; 
		String picN2=picPath[1][1];
		String picN3=picPath[2][1];//???????????? 
		
		 String petPath = uploadFolder+"/"+petID;
		 File imgPath1 = new File(petPath+"/"+imgName1+picN1);//????????????????????????
		 File imgPath2 = new File(petPath+"/"+imgName2+picN2);//????????????????????????
		 File imgPath3 = new File(petPath+"/"+imgName3+picN3);//????????????????????????
		 File file=new File(petPath);//???????????????
		//"C:/Users/Student/git/TEST/petPetBoot/src/main/webapp"+

		   try {
			   Path pathD1 = Paths.get(CPath+PROPath+imgPath1);
			   Path pathD2 = Paths.get(CPath+PROPath+imgPath2);
			   Path pathD3 = Paths.get(CPath+PROPath+imgPath3);
//			   System.out.println(pathD1);//??????img1??????
//			   System.out.println(pathD2);
//			   System.out.println(pathD3);
			   
			   Files.delete(pathD1);//????????????1
			   Files.delete(pathD2);//????????????2
			   Files.delete(pathD3);////????????????3
			  
			   Path filen = Paths.get(CPath+PROPath+file);
			   //System.out.println(filen);//?????????
			   Files.delete(filen);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("????????????");
		}
		  
		pas.delete(petID); //DataJpa??????
		//pasn.petDelete(petID);
    	 return "MainFace";
     }

    @PostMapping("/petUpdataView") //???????????????JSP
    public String petSelectOne(int petID,Model m) {
    	PetAdoptBean pasl = pas.selectOne(petID);  //DataJpa??????
    	//PetAdoptBean pasl = pasn.petSelectPetId(petID);
    	m.addAttribute("pas",pasl);
    	return "PetUpdata";
    }
    
    @PostMapping("/petUpdate.controller")     //??????????????????????????? ??????????????????????????? 
    public String petUpdate(Model m ,HttpServletRequest request
    		                 ,@RequestParam("petPic1")MultipartFile file1
    		                 ,@RequestParam("petPic2")MultipartFile file2
    		                 ,@RequestParam("petPic3")MultipartFile file3
    		                ) {
    	 
    	 int petid=Integer.parseInt(request.getParameter("petID")); 
    	 PetAdoptBean pab = pas.selectOne(petid);  //DataJpa??????
    	 //PetAdoptBean pab = pasn.petSelectPetId(petid);
    	
    	 String[][] picn = pab.getPicName();
    	 String savePathDir = request.getServletContext().getRealPath(uploadFolder);
			savePathDir+="\\"+pab.getPetID();
	     File saveFileDir = new File(savePathDir);
	     saveFileDir.mkdirs();	
	     //System.out.println("????????????"+file1.isEmpty());
	     String petDPath = uploadFolder+"/"+petid;//????????????????????????????????????
    	 if(file1.isEmpty()) {
             System.out.println("??????1?????????");
    	 }else {
    		 String picD1=picn[0][0];//??????????????????
    		 String picDn1=picn[0][1];//?????????????????????
    		 File petPicPathD1 = new File(petDPath+"/"+picD1+picDn1);//???????????????????????????
    		 System.out.println(petPicPathD1);
    		 Path pathD1 = Paths.get(CPath+PROPath+petPicPathD1);//????????????
    		 
    		 String fileName1 = file1.getOriginalFilename();//????????????1????????????
    		 System.out.println("??????1??????"+fileName1);
    		 int file1num = fileName1.lastIndexOf(".");//???????????????.???????????????
    		 String picNa1 = fileName1.substring(file1num); //??????img1????????????
    		 //System.out.println("?????????="+picNa1);
    		 String imgName1=img1+picNa1; // img1+?????????
    		 picn[0][0]=img1;
             picn[0][1]=picNa1;
             try {
            	Files.delete(pathD1);//????????????????????????
            	File saveFilePath1 = new File(savePathDir,imgName1);//??????1???????????????
     			file1.transferTo(saveFilePath1);//???????????????
     			System.out.println("??????1????????????");
			} catch (Exception e) {
				System.out.println("??????1?????????");
			}
    	 }
    	 
    	 if(file2.isEmpty()) {
    		 System.out.println("??????2?????????");
    	 }
    	 else {
    		 String picD2=picn[1][0];//??????????????????
    		 String picDn2=picn[1][1];//?????????????????????
    		 File petPicPathD2 = new File(petDPath+"/"+picD2+picDn2);//???????????????????????????
    		 Path pathD2 = Paths.get(CPath+PROPath+petPicPathD2);//????????????
    		 
    		 String fileName2 = file2.getOriginalFilename();
    		// System.out.println("??????2??????"+fileName2);
    		 int file2num = fileName2.lastIndexOf(".");
    		 String picNa2 = fileName2.substring(file2num);
    		 //System.out.println("??????2?????????"+picNa2);
    		 String imgName2=img2+picNa2;
    		  picn[1][0]=img2;
    	      picn[1][1]=picNa2;
    	      try {
    	    	Files.delete(pathD2);
    	    	File saveFilePath2 = new File(savePathDir,imgName2);//??????2???????????????
    	    	file2.transferTo(saveFilePath2);
    	    	System.out.println("??????2????????????");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("??????2??????");
			}
    	 }
    	 
    	 if(file3.isEmpty()) {
    		 System.out.println("??????3?????????");
    	 }
    	 else {
    		 String picD3=picn[2][0];//??????????????????
    		 String picDn3=picn[2][1];//?????????????????????
    		 File petPicPathD3 = new File(petDPath+"/"+picD3+picDn3);//???????????????????????????
    		 Path pathD3 = Paths.get(CPath+PROPath+petPicPathD3);//????????????
    		 
    		 String fileName3 = file3.getOriginalFilename();
    		 System.out.println("??????3??????"+fileName3);
    		 int file3num = fileName3.lastIndexOf(".");
    		 String picNa3 = fileName3.substring(file3num);
    		 String imgName3=img3+picNa3;
    		 picn[2][0]=img3;
             picn[2][1]=picNa3;
             try {
            	 Files.delete(pathD3);
            	 File saveFilePath3 = new File(savePathDir,imgName3);//??????3???????????????
            	 file3.transferTo(saveFilePath3);
			} catch (Exception e) {
				System.out.println("???????????????");
			}
    	 }        
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
         
         pas.save(pab);  
         //pasn.petUpdata(pab);
         
         m.addAttribute("pab",pab);
         m.addAttribute("shareurl", shareurl);
         return "PetSelectOne";
    }
     
    @GetMapping("/adopt/addbird")
     public String  seachPetbird(Model m) {
    	String cat="???";    String dog="???";
    	String bird="???";   String mouse="???";
    	String rabbit="???"; String turtle="???";     
    	String snake="???";  String pig="???";     
    	 
    	 Integer catnum = pas.seachPetCat(cat);
    	 Integer dognum = pas.seachPetDog(dog);
    	 Integer birdnum = pas.seachPetbird(bird);
    	 Integer mousenum = pas.seachPetMouse(mouse);
    	 Integer rabbitnum=pas.seachPetRabbit(rabbit);
    	 Integer turtlenum = pas.seachPetTurtle(turtle);
    	 Integer snakenum=pas.seachPetsnake(snake);
    	 Integer pignum = pas.seachPetPig(pig);
    	 
         LinkedHashMap <String,Integer> petmap = new LinkedHashMap<>();
      
         petmap.put(cat,catnum);
         petmap.put(dog,dognum);
         petmap.put(bird,birdnum);
         petmap.put(mouse,mousenum);
         petmap.put(rabbit,rabbitnum);
         petmap.put(turtle,turtlenum);
         petmap.put(snake,snakenum);
         petmap.put(pig,pignum);
         //System.out.println(petmap);
         try {
        	 String petjson = new ObjectMapper().writeValueAsString(petmap);
        	// System.out.println(petjson);
        	 m.addAttribute("pets", petjson);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
    	 return "Test";
     }
         
	 
}
