package com.petpet.PetAdopt.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.petpet.PetAdopt.model.PetAdoptBean;
import com.petpet.PetAdopt.service.PetAdoptService;
import com.petpet.member.model.Member;
import com.petpet.member.service.IMemberService;


  
@Controller
public class BackStagePetAdoptController {
    @Autowired
	PetAdoptService pas;
    
    @Autowired
	private IMemberService mbs;
    
    public static final String Errora="目前暫無資料";
    public  String img1="img1";//新增img1
	public  String img2="img2";//新增img2
	public  String img3="img3";//新增img3
	public static final String CPath="C:\\Users/Student/Documents/GitHub/LoveLiveGaoGaiGarYuGiOhPekoWingGundamPrettyDerby";
	public static final String PROPath="/src/main/webapp/";
	 @Value("${petadoptuploadDir}") //抓application內的uploadDir,指定儲存路徑
	  private String petadoptuploadFolder;
    
	
	@GetMapping(path="/petadoptbackstagepetselect")
	public String petSelectAll(Model m) {
		Iterable<PetAdoptBean> pets = pas.selectAll();
		m.addAttribute("PetAdopts", pets);
		return"PetAdopt/Admin/BackstagePetSelect";
	}
	
	
	  @PostMapping("/petadoptbackstagepetUpdataView") //移轉到修改JSP
	    public String petSelectOneUpdata( Integer petID,Model m) { //@Param("petID")
	    	PetAdoptBean pasl = pas.selectOne(petID); 
	    	m.addAttribute("pas",pasl);
	    	return "PetAdopt/Admin/BackStagePetUpdata";
	    }
	  
	  @PostMapping("/petadoptbackstagepetUpdata.controller")     //這邊是執行修改動作 然後回傳給單一檢索 
	    public String petUpdate(Model m ,HttpServletRequest request
	    		                 ,@RequestParam("petPic1")MultipartFile file1
	    		                 ,@RequestParam("petPic2")MultipartFile file2
	    		                 ,@RequestParam("petPic3")MultipartFile file3
	    		                ) {
	    	
	    	 int petid=Integer.parseInt(request.getParameter("petID")); 
	    	 PetAdoptBean pab = pas.selectOne(petid);  //DataJpa寫法
	    	 //PetAdoptBean pab = pasn.petSelectPetId(petid);
	    	
	    	 String[][] picn = pab.getPicName();
	    	 String savePathDir = request.getServletContext().getRealPath(petadoptuploadFolder);
				savePathDir+="\\"+pab.getPetID();
		     File saveFileDir = new File(savePathDir);
		     saveFileDir.mkdirs();	
		     //System.out.println("判斷布林"+file1.isEmpty());
		     String petDPath = petadoptuploadFolder+"/"+petid;//取得當前資料的資料夾位置
	    	 if(file1.isEmpty()) {
	             System.out.println("圖片1未修改");
	    	 }else {
	    		 String picD1=picn[0][0];//抓取舊的檔名
	    		 String picDn1=picn[0][1];//抓取舊的副檔名
	    		 File petPicPathD1 = new File(petDPath+"/"+picD1+picDn1);//要被修改的圖片檔案
	    		 System.out.println(petPicPathD1);
	    		 Path pathD1 = Paths.get(CPath+PROPath+petPicPathD1);//取得路徑
	    		 
	    		 String fileName1 = file1.getOriginalFilename();//上傳圖片1檔名名稱
	    		 System.out.println("圖片1名稱"+fileName1);
	    		 int file1num = fileName1.lastIndexOf(".");//抓最後一個.為多少數字
	    		 String picNa1 = fileName1.substring(file1num); //此為img1的副檔名
	    		 //System.out.println("副檔名="+picNa1);
	    		 String imgName1=img1+picNa1; // img1+副檔名
	    		 picn[0][0]=img1;
	             picn[0][1]=picNa1;
	             try {
	            	Files.delete(pathD1);//刪除被更新的圖片
	            	File saveFilePath1 = new File(savePathDir,imgName1);//圖片1的路徑存取
	     			file1.transferTo(saveFilePath1);//儲存新圖片
	     			System.out.println("圖片1修改成功");
				} catch (Exception e) {
					System.out.println("圖片1有問題");
				}
	    	 }
	    	 
	    	 if(file2.isEmpty()) {
	    		 System.out.println("圖片2未修改");
	    	 }
	    	 else {
	    		 String picD2=picn[1][0];//抓取舊的檔名
	    		 String picDn2=picn[1][1];//抓取舊的副檔名
	    		 File petPicPathD2 = new File(petDPath+"/"+picD2+picDn2);//要被修改的圖片檔案
	    		 Path pathD2 = Paths.get(CPath+PROPath+petPicPathD2);//取得路徑
	    		 
	    		 String fileName2 = file2.getOriginalFilename();
	    		// System.out.println("圖片2名稱"+fileName2);
	    		 int file2num = fileName2.lastIndexOf(".");
	    		 String picNa2 = fileName2.substring(file2num);
	    		 //System.out.println("圖片2附檔名"+picNa2);
	    		 String imgName2=img2+picNa2;
	    		  picn[1][0]=img2;
	    	      picn[1][1]=picNa2;
	    	      try {
	    	    	Files.delete(pathD2);
	    	    	File saveFilePath2 = new File(savePathDir,imgName2);//圖片2的路徑存取
	    	    	file2.transferTo(saveFilePath2);
	    	    	System.out.println("圖片2修改成功");
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("圖片2錯誤");
				}
	    	 }
	    	 
	    	 if(file3.isEmpty()) {
	    		 System.out.println("圖片3未修改");
	    	 }
	    	 else {
	    		 String picD3=picn[2][0];//抓取舊的檔名
	    		 String picDn3=picn[2][1];//抓取舊的副檔名
	    		 File petPicPathD3 = new File(petDPath+"/"+picD3+picDn3);//要被修改的圖片檔案
	    		 Path pathD3 = Paths.get(CPath+PROPath+petPicPathD3);//取得路徑
	    		 
	    		 String fileName3 = file3.getOriginalFilename();
	    		 System.out.println("圖片3名稱"+fileName3);
	    		 int file3num = fileName3.lastIndexOf(".");
	    		 String picNa3 = fileName3.substring(file3num);
	    		 String imgName3=img3+picNa3;
	    		 picn[2][0]=img3;
	             picn[2][1]=picNa3;
	             try {
	            	 Files.delete(pathD3);
	            	 File saveFilePath3 = new File(savePathDir,imgName3);//圖片3的路徑存取
	            	 file3.transferTo(saveFilePath3);
				} catch (Exception e) {
					System.out.println("圖片三錯誤");
				}
	    	 }       
	    	 String  action = (request.getParameter("petAction"));
	    	 int actionNum = Integer.parseInt(action);
	    	 if(actionNum==0) {
	    		 pab.setPetAccept(null);
	    	 }
	         pab.setPetAction(actionNum);  
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
	       
	         
	         m.addAttribute("pab",pab);
	         return "PetAdopt/Admin/BackStagePetSelectOne";
	    }
	    @GetMapping(path="/petadoptbackstagepetselectone")
	  public String petSelectOne(Integer petID,Model m) {
		  PetAdoptBean pet = pas.selectOne(petID);
		  m.addAttribute("pab", pet);
		  return "PetAdopt/Admin/BackStagePetSelectOne";
	  }
	    
	    @PostMapping("/petadoptpetDeletebackstage")  //我是刪除
	     public String petDelete(HttpServletRequest request
	    		                ,@RequestParam("petID") int petID,Model m ) {
			
			Integer memberid=(Integer)(request.getSession().getAttribute("memberid")); 
			PetAdoptBean pab = pas.selectOne(petID);  //DataJpa寫法
			String[][] picPath = pab.getPicName();
			String imgName1 =picPath[0][0];
			String imgName2 =picPath[1][0];
			String imgName3 =picPath[2][0];//三個圖片的檔名,為img1  img2  img3
			String picN1=picPath[0][1]; 
			String picN2=picPath[1][1];
			String picN3=picPath[2][1];//圖片格式 
			
			 String petPath = petadoptuploadFolder+"/"+petID;
			 File imgPath1 = new File(petPath+"/"+imgName1+picN1);//圖片一的路徑位置
			 File imgPath2 = new File(petPath+"/"+imgName2+picN2);//圖片二的路徑位置
			 File imgPath3 = new File(petPath+"/"+imgName3+picN3);//圖片三的路徑位置
			 File file=new File(petPath);//資料夾路徑
			//"C:/Users/Student/git/TEST/petPetBoot/src/main/webapp"+
	System.out.println(petPath);
			   try {
				   Path pathD1 = Paths.get(CPath+PROPath+imgPath1);
				   Path pathD2 = Paths.get(CPath+PROPath+imgPath2);
				   Path pathD3 = Paths.get(CPath+PROPath+imgPath3);
//				   System.out.println(pathD1);//圖片img1路徑
//				   System.out.println(pathD2);
//				   System.out.println(pathD3);
				   
				   Files.delete(pathD1);//刪除圖片1
				   Files.delete(pathD2);//刪除圖片2
				   Files.delete(pathD3);////刪除圖片3
				  
				   Path filen = Paths.get(CPath+PROPath+file);
				   //System.out.println("資料夾位置"+filen);//資料夾
				   Files.delete(filen);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("刪除失敗");
			}
		    List<Member> members = pab.getMembers();
			 int num = members.size();
			System.out.println("當前喜愛數="+num);
			for(int i=0; i<members.size();i++) {			
				boolean B1 = members.get(i).getListPAB().remove(pab);
				//boolean B2 = pab.getMembers().remove(members.get(i));
				System.out.println("b1="+B1);
				//pas.save(pab);
			}	
			
			for(int i=0; i<members.size();i++) {
				boolean B2 = pab.getMembers().remove(members.get(i));
				//boolean B1 = members.get(i).getListPAB().remove(pab);
				System.out.println("B2="+B2);
			}
			pas.delete(petID); //DataJpa寫法
			Iterable<PetAdoptBean> pets = pas.selectAll();
			m.addAttribute("PetAdopts", pets);			
	    	 return "PetAdopt/Admin/BackstagePetSelect";
	     }
	
	    @GetMapping("/backpetadoptseachpetadopt/page/{pageNum}")
		public String seachPet(@Param("seachpet") String seachpet,
				               Model m, 
				              @PathVariable(name = "pageNum") int pageNum,
				              @Param("sortField") String sortField,
			                  @Param("sortDir") String sortDir) {
			Page<PetAdoptBean> pab = pas.seachPetAdopt(seachpet,pageNum,sortField,sortDir);
			if(pab.isEmpty()) {
				m.addAttribute("error", Errora);
				List<PetAdoptBean> petsHit = pas.selectPetHitsTop5();
				m.addAttribute("Hits", petsHit);
				return "PetAdopt/MainFace";
			}
			else {
				Page<PetAdoptBean> page = pas.seachPetAdopt(seachpet,pageNum,sortField,sortDir);
				List<PetAdoptBean> petlist = page.getContent();
				m.addAttribute("currentPage", pageNum); //當前頁面
				m.addAttribute("totalPages", page.getTotalPages());//總頁數
				m.addAttribute("totalItems", page.getTotalElements());//資料總筆數
				m.addAttribute("sortField", sortField);
			    m.addAttribute("sortDir", sortDir);
			    System.out.println("總頁="+page.getTotalPages());
			    System.out.println("頁數="+pageNum);
				
				m.addAttribute("PetAdopts",petlist);
				m.addAttribute("seachpet", seachpet);
				return "PetAdopt/Admin/BackStagePetSelect";	
			}
		}
		
	    
		@RequestMapping(path={"/backstagepetadoptlikeselect/seachpetadopt"}, method = {RequestMethod.POST,RequestMethod.GET})
		public String seachpetput(@RequestParam("searchpet")String seach,
				                  Model m,
				                  String sortField,
				                  String sortDir
				                  ) {
			System.out.println(seach);
			return  seachPet(seach,m,1,"petID", "desc");
		}//預設排序跟順序
		@GetMapping("/petadoptbackstage/sc")
	     public String  seachPetbird(Model m) {
	    	String cat="貓";    String dog="狗";
	    	String bird="鳥";   String mouse="鼠";
	    	String rabbit="兔"; String turtle="龜";     
	    	String snake="蛇";  String pig="豬";     
	    	 
	    	 Integer catnum = pas.seachPetSpecies(cat);
	    	 Integer dognum = pas.seachPetSpecies(dog);
	    	 Integer birdnum = pas.seachPetSpecies(bird);
	    	 Integer mousenum = pas.seachPetSpecies(mouse);
	    	 Integer rabbitnum=pas.seachPetSpecies(rabbit);
	    	 Integer turtlenum = pas.seachPetSpecies(turtle);
	    	 Integer snakenum=pas.seachPetSpecies(snake);
	    	 Integer pignum = pas.seachPetSpecies(pig);
	    	 
	    	 
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
	        
	    	 return "PetAdopt/Admin/BackstagePetSc";
	     }
}
