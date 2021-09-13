package com.petpet.PetAdopt.controller;



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
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
import com.petpet.PetAdopt.model.PetAdoptBean;
import com.petpet.PetAdopt.service.IpetAdoptService;

import com.petpet.member.model.Member;
import com.petpet.member.service.IMemberService;



//error處理應該要統一寫一個方法才對，重複寫了很多程式

@Controller
//@RequestMapping(value= {"","petAdopt"})
public class PetAdoptController {
	public  String img1="img1";//新增img1
	public  String img2="img2";//新增img2
	public  String img3="img3";//新增img3
	//public static final String CPath="C:\\Users/Student/Documents/GitHub/LoveLiveGaoGaiGarYuGiOhPekoWingGundamPrettyDerby";
	public static final String CPath="C:\\javaee\\tomcat";
	public static final String PROPath="\\webapps\\petpet";
	//public static final String PROPath="/src/main/webapp/";
	
	
	public static final String Errora="目前暫無資料";
	public static final String Errorlogin="尚未登入，請先登入";
	public static final String BasicFilePet="此為預覽資料";
	public static final String ErrorpetAdopted="已被領養，無法修改資料";
  @Value("${petadoptuploadDir}") //抓application內的uploadDir,指定儲存路徑
  private String petadoptuploadFolder;
	
  @Value("${shareurl}")
  private String shareurl;
	@Autowired
	private  IpetAdoptService pas; 
	
	@Autowired
	private IMemberService IMS;
	
	@Autowired
	private IMemberService mbs;
	
	
	
	
	@GetMapping("/petadopt/")  //主頁面(搜尋頁面)
	public String mainFace(Model m){
		List<PetAdoptBean> petsHit = pas.selectPetHitsTop5();
		m.addAttribute("Hits", petsHit);
		return "PetAdopt/MainFace";
	}
	                       
	@GetMapping("/petadopt/seachpetadopt/page/{pageNum}")
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
			m.addAttribute("shareurl", shareurl);
			m.addAttribute("PetAdopts",petlist);
			m.addAttribute("seachpet", seachpet);
			return "PetAdopt/PetSelect";	
		}
	}
	
	@RequestMapping(path={"/petadopt/seachpetadopt"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String seachpetput(@RequestParam("seachpet")String seach,
			                  Model m,
			                  String sortField,
			                  String sortDir
			                  ) {
		System.out.println(seach);
		m.addAttribute("shareurl", shareurl);
		return  seachPet(seach,m,1,"petID", "desc");
	}//預設排序跟順序
	
	
	
	
	
	@GetMapping("/petadopt/selectpetspecies/page/{pageNum}") //單一搜尋寵物類別
	public String selectPetSpecies( @Param("petSpecies") String  petSpecies,
			                        Model m,			                       
			                       @PathVariable(name = "pageNum") int pageNum,
			                       @Param("sortField") String sortField,
			                       @Param("sortDir") String sortDir) {
		
		Page<PetAdoptBean> pab = pas.selectPetSpeciesPage(petSpecies,pageNum,sortField,sortDir);
		System.out.println(pab);
		if(pab.isEmpty()) {
			m.addAttribute("error", Errora);
			List<PetAdoptBean> petsHit = pas.selectPetHitsTop5();
			m.addAttribute("Hits", petsHit);
			return "PetAdopt/MainFace";
		}
		else{
			Page<PetAdoptBean> page = pas.selectPetSpeciesPage(petSpecies, pageNum, sortField, sortDir);
			List<PetAdoptBean> pets = page.getContent();
			m.addAttribute("currentPage", pageNum); //當前頁面
			m.addAttribute("totalPages", page.getTotalPages());//總頁數
			m.addAttribute("totalItems", page.getTotalElements());//資料總筆數
			m.addAttribute("sortField", sortField);
		    m.addAttribute("sortDir", sortDir); 
			
			m.addAttribute("PetAdopts", pets);
			m.addAttribute("shareurl", shareurl);
			m.addAttribute("petSpecies", petSpecies);
			System.out.println(petSpecies);
		}return "PetAdopt/PetSelect";	
	}
	
	@RequestMapping(path={"/petadopt/selectpetspecies"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String petSpeciesPage(@RequestParam("petSpecies")String Species,
			                  Model m,
			                  String sortField,
			                  String sortDir
			                  ) {
		System.out.println(Species);
		m.addAttribute("shareurl", shareurl);
		return  selectPetSpecies(Species,m,1,"petID","desc");
	}//預設排序跟順序
	

	
	@GetMapping("/petadopt/selectpetarea/page/{pageNum}")//單一搜尋所在地區
	public String selectPetArea(@Param("petArea") String petArea,
			                      Model m ,
			                     @PathVariable(name = "pageNum") int pageNum,
			                     @Param("sortField") String sortField,
			                     @Param("sortDir") String sortDir) {
		Page<PetAdoptBean> pab = pas.selectPetArea(petArea,pageNum,sortField,sortDir);
		System.out.println("我是單一搜尋地區");
		if(pab.isEmpty()) {
			m.addAttribute("error", Errora);
			List<PetAdoptBean> petsHit = pas.selectPetHitsTop5();
			m.addAttribute("Hits", petsHit);
			return "PetAdopt/MainFace";
		}
		else {
			Page<PetAdoptBean> page = pas.selectPetArea(petArea,pageNum,sortField,sortDir);
			List<PetAdoptBean> pet = page.getContent();
			m.addAttribute("currentPage", pageNum); //當前頁面
			m.addAttribute("totalPages", page.getTotalPages());//總頁數
			m.addAttribute("totalItems", page.getTotalElements());//資料總筆數
			m.addAttribute("sortField", sortField);
		    m.addAttribute("sortDir", sortDir); 
			
			m.addAttribute("petArea",petArea);
			m.addAttribute("PetAdopts",pet);
			m.addAttribute("shareurl", shareurl);
			return "PetAdopt/PetSelect";
		}
	}
	
	@RequestMapping(path={"/petadopt/selectpetarea"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String petAreaPage(@RequestParam("petArea")String petArea,
			                  Model m,
			                  String sortField,
			                  String sortDir
			                  ) {
		m.addAttribute("shareurl", shareurl);
		return  selectPetArea(petArea,m,1,"petID","desc");
	}//預設排序跟順序
	
	
	
	@GetMapping("/petadopt/selectpetareaandpetarea/page/{pageNum}")
	public String selectPetAteaAndPetSpecies(@Param("petArea") String petArea,
			                                 @Param("petSpecis") String petSpecies,
			                                 Model m,
			                                 @PathVariable(name = "pageNum") int pageNum,
			                                 String sortField,
			   			                     String sortDir
			                                 ){
		Page<PetAdoptBean> pab = pas.selectPetAreaAndPetSpecies(petArea, petSpecies,pageNum,sortField,sortDir);
		if(pab.isEmpty()) {
			m.addAttribute("error", Errora);
			List<PetAdoptBean> petsHit = pas.selectPetHitsTop5();
			m.addAttribute("Hits", petsHit);
			return "PetAdopt/MainFace";
		}else {
			List<PetAdoptBean> pets = pab.getContent();
			m.addAttribute("currentPage", pageNum); //當前頁面
			m.addAttribute("totalPages", pab.getTotalPages());//總頁數
			m.addAttribute("totalItems", pab.getTotalElements());//資料總筆數
			m.addAttribute("sortField", sortField);
		    m.addAttribute("sortDir", sortDir);
			
			m.addAttribute("petArea", petArea);
			m.addAttribute("petSpecies", petSpecies);
			m.addAttribute("PetAdopts",pets);
			m.addAttribute("shareurl", shareurl);
			return "PetAdopt/PetSelect";
		}
	}
	@RequestMapping(path={"/petadopt/selectpetareaandpetarea"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String petAreaAndpetSpeciesPage(@RequestParam("petArea")String petArea,
			                               @RequestParam("petSpecies")String petSpecies,
			                                Model m,
			                                String sortField,
			                                String sortDir) {
		return  selectPetAteaAndPetSpecies(petArea,petSpecies,m,1,"petID","desc");
	}
	
	
	
	@RequestMapping(path={"/petadopt/petAdoptselectAll/page/{pageNum}"},method = {RequestMethod.POST,RequestMethod.GET})
	public String petSelectPage(Model m,@PathVariable("pageNum")int pageNum,
			                    @Param("sortField")String sortField,
			                    @Param("sortDir")String sortDir) {
		Page<PetAdoptBean> pab = pas.petSelectAllforpetAction(0, pageNum, sortField, sortDir);
		//Page<PetAdoptBean> page = pas.QueryAllPage(pageNum, sortField, sortDir);
		if(pab.isEmpty()) {
			m.addAttribute("error", Errora);
			List<PetAdoptBean> petsHit = pas.selectPetHitsTop5();
			m.addAttribute("Hits", petsHit);
			return "PetAdopt/MainFace";
		}
		List<PetAdoptBean> pets = pab.getContent();
		m.addAttribute("currentPage", pageNum); //當前頁面
		m.addAttribute("totalPages", pab.getTotalPages());//總頁數
		m.addAttribute("totalItems", pab.getTotalElements());//資料總筆數
		m.addAttribute("sortField", sortField);
	    m.addAttribute("sortDir", sortDir);
		
		m.addAttribute("PetAdopts",pets);
		m.addAttribute("shareurl", shareurl);
		return "PetAdopt/PetSelect";
	}
	@RequestMapping(path={"/petadopt/petAdoptselectAll"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String memberviewHomepage(Model m,String sortField, String sortDir) {
		m.addAttribute("shareurl", shareurl);
		return  petSelectPage(m,1, "petID", "desc");
	}//預設排序跟順序
	

	 
	 @GetMapping(path="/petadopt/petadopted")
	 public String petadopted(Model m,HttpServletRequest request) {
		 Integer memberid =(Integer) request.getSession().getAttribute("memberid");
		 List<PetAdoptBean> petsHit = pas.selectPetHitsTop5();
		 if(memberid==null) {
			 m.addAttribute("Hits", petsHit);
		     m.addAttribute("error",Errorlogin);
		    	return "PetAdopt/MainFace";
		 }
		 //List<PetAdoptBean> pets = pas.petSelectMemberforpetAccept(memberid);
		 int petaction=1;
		 List<PetAdoptBean> pets = pas.petSelectMemberforpetAccept(memberid, petaction);
		 if(pets.isEmpty()) {
				m.addAttribute("error", Errora);
				m.addAttribute("Hits", petsHit);
				return "PetAdopt/MainFace";
		 }
		 String mylike="mylike";
		 m.addAttribute("mylike", mylike);
		 m.addAttribute("PetAdopts", pets);
		 return "PetAdopt/PetSelect";
	 }
	
	
	
	
	
	@GetMapping("/petadopt/petInsert")  //新增頁面
	public String  petInsert(Model m,HttpServletRequest request) {
	   Integer memberid=(Integer)request.getSession().getAttribute("memberid");
	   if(memberid ==null) {
		  List<PetAdoptBean> petsHit = pas.selectPetHitsTop5();	
		  m.addAttribute("Hits", petsHit);
		  m.addAttribute("error", Errorlogin);
		  return "PetAdopt/MainFace";
	   }
		m.addAttribute("shareurl", shareurl);
	   return "PetAdopt/PetInsert"; 
	} 
	
	@GetMapping("/petadopt/backstagePetAdopt") //會員修改頁面
    public String backagePet(Model m,HttpServletRequest request) {
		//List<PetAdoptBean> pas1 = pasn.petSelectAll();
		Integer memberid=(Integer)request.getSession().getAttribute("memberid");
		
		if(memberid==null) {
			 List<PetAdoptBean> petsHit = pas.selectPetHitsTop5();	
			 m.addAttribute("Hits", petsHit);	
			 m.addAttribute("error", Errorlogin);
			  return "PetAdopt/MainFace";
		}
		//List<PetAdoptBean> pets = pas.memberSelectPet(memberid);
		List<PetAdoptBean> pets = pas.findByMemberId1(memberid, 2);
		if(pets.isEmpty()) {
			List<PetAdoptBean> petsHit = pas.selectPetHitsTop5();
			m.addAttribute("error", Errora);
			m.addAttribute("Hits", petsHit);
			return "PetAdopt/MainFace";
		}
		m.addAttribute("PetAdopts", pets);
		m.addAttribute("shareurl", shareurl);
    	return "PetAdopt/MemberPetSelect";  
    }
	
	@GetMapping("/memberSelectpet")  //找尋member自己的寵物
	public String memberpetSelect(Model m ,HttpServletRequest request) {
		Integer memberid=(Integer)request.getSession().getAttribute("memberid");
		List<PetAdoptBean> pas1 = pas.memberSelectPet(memberid);
		m.addAttribute("shareurl", shareurl);
		m.addAttribute("PetAdopts", pas1);
		return "PetAdopt/PetSelect";
	}
	
	
//	@GetMapping("/petAdopt/petSelectAll") //找尋所有的寵物
//    public String petSelectAlltest(Model m) {
//		//List<PetAdoptBean> pas1 = pasn.petSelectAll();
//		Iterable<PetAdoptBean> pas1 = pas.selectAll(); //DataJpa寫法
//		m.addAttribute("shareurl", shareurl);
//		m.addAttribute("PetAdopts", pas1);
//    	return "PetAdopt/PetSelect";
//    }
	
    
	
	@GetMapping("/petadopt/select/pet")   //單一檢索寵物頁面
	public String selectBypetID(@RequestParam("petID") Integer petID,
			                                  Model m
			                                  ,HttpServletRequest request) {
//		PetAdoptBean pabS = pasn.petSelectPetId(petID);
		PetAdoptBean pabS = pas.selectOne(petID); //DataJpa寫法
		
	    Integer PetHit=pabS.getPetHits();
	    Integer petsnum = pabS.getPetAction();
	    if (petsnum ==0) {
	    	pabS.setPetHits(PetHit+1);
			pas.save(pabS);
	    }else {}
		m.addAttribute("pab", pabS);
		m.addAttribute("shareurl", shareurl);
		
		Integer memberid = (Integer) (request.getSession().getAttribute("memberid"));
		Integer accept = pabS.getPetAccept();
		Integer mid = pabS.getTestmember().getMemberid();
		if(accept !=null) {
			if(accept.equals(memberid)) {
				String checkaccept="正確";
				m.addAttribute("checkaccept", checkaccept);}
			else if(memberid.equals(mid)) {
				Member member = mbs.findById(accept);
				m.addAttribute("petAdoptMember", member);
				String petadopted="領收";
				m.addAttribute("checkaccept",petadopted);
			}
		}
		    
	    if(memberid!=null) {
			Member member = mbs.findById(memberid);
			List<PetAdoptBean> pets = member.getListPAB();
			String likepet="likepet";
			for(int i=0;i<pets.size();i++) {
				if(pets.get(i).getPetID() == pabS.getPetID()) {
					m.addAttribute("likepet", likepet);
					return "PetAdopt/PetSelectOne";
				}
			}
		}else {}
		
		return "PetAdopt/PetSelectOne";
	}
	               
	@PostMapping("/petadopt/petInsert.controller") //新增寵物回傳到單一搜尋上
	public String petInsert(HttpServletRequest request ,Model m
			                 ,@RequestParam("petPic1")MultipartFile file1
			                 ,@RequestParam("petPic2")MultipartFile file2
			                 ,@RequestParam("petPic3")MultipartFile file3
			                 ) {	
		  Integer memberid=(Integer)request.getSession().getAttribute("memberid");
		  Member member = IMS.findById(memberid); 
		 //Integer id = member.getMemberid();
		 //System.out.println(id);
         PetAdoptBean pab = new PetAdoptBean();
         pab.setPetAction(0); //0為未被領養 1為領養中 2為領養完成
         pab.setTestmember(member);  //把這寵物指定為member塞進去
         pab.setPetHits(0); //點擊數初始值為0
         pab.setPetArea(request.getParameter("petArea").trim());   //地區    
         pab.setPetBreeds(request.getParameter("petBreeds").trim()); // 品種   
         pab.setPetColor(request.getParameter("petColor").trim()); //顏色       
         pab.setPetGender(request.getParameter("petGender").trim()); //性別
         pab.setPetInsertDay(request.getParameter("petInsertDay").trim()); //日期
         pab.setPetLigation(request.getParameter("petLigation").trim()); //結紮      
         pab.setPetName(request.getParameter("petName").trim());  //名稱
         pab.setPetNarrate(request.getParameter("petNarrate").trim()); //其他補充
         pab.setPetSpecies(request.getParameter("petSpecies").trim()); //種類
         
         String fileName1=file1.getOriginalFilename();  //抓取上傳檔名
       //System.out.println("上傳的全檔名"+fileName1);
         String fileName2=file2.getOriginalFilename();
         String fileName3=file3.getOriginalFilename();
         
  
         int filenum1= fileName1.lastIndexOf(".");//抓取最後一個.為多少數字.
         int filenum2=fileName2.lastIndexOf(".");
         int filenum3=fileName3.lastIndexOf(".");
         String pictest1=fileName1.substring(0,filenum1);//只有圖片名稱
         //System.out.println("檔案名為："+pictest1);

			String picName1 = fileName1.substring(filenum1);// 只有副檔名
         //System.out.println("副檔名為："+picName1);
         String picName2=fileName2.substring(filenum2);
         String picName3=fileName3.substring(filenum3);
         
         String imgName1=img1+picName1; // img1+副檔名
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
          pas.Insert(pab); //DataJpa寫法
        
  	     m.addAttribute("checkpet", BasicFilePet); 
         m.addAttribute("pab",pab);
         m.addAttribute("shareurl", shareurl);
         try {
               String savePathDir = request.getServletContext().getRealPath(petadoptuploadFolder);//儲存路徑
               savePathDir+="\\"+pab.getPetID();
               //System.out.println(savePathDir);//印出上船路徑
               File  savefile1Dir = new File(savePathDir); //資料夾路徑
               savefile1Dir.mkdirs(); //路徑不存在的話會自己建
               File saveFile1Path = new File(savefile1Dir,imgName1);//指定路徑跟名稱
               File saveFile2path = new File(savefile1Dir,imgName2);
               File saveFile3path = new File(savefile1Dir,imgName3);
               
               
               file1.transferTo(saveFile1Path);
			   //System.out.println("儲存路徑:"+saveFile1Path);
               file2.transferTo(saveFile2path);//圖片二儲存
               file3.transferTo(saveFile3path);//圖片三儲存
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return  "PetAdopt/PetSelectOne";
	}  
	
	
	@GetMapping(path = "/petadopt/responseImage1.controller",produces = "text/plain;charset=UTF-8")
	@ResponseBody          
	public void img1View(HttpServletRequest request
			, HttpServletResponse response
			,@RequestParam("petID") Integer petID
			) {
		try {
			 PetAdoptBean pab = pas.selectOne(petID);  //DataJpa寫法
			 //PetAdoptBean pab = pasn.petSelectPetId(petID);
			String[][] pic = pab.getPicName();
			String imgName1 = pic[0][0]; //圖檔名為img1
			String imgN1 = pic[0][1];   //此為圖片副檔名
			String path1=petadoptuploadFolder+"/"+petID+"/"+imgName1+imgN1;//網址
			//System.out.println("路徑:"+path1);
			// ex:  http://localhost:8081/petpet/responseImage1.controller?petID=1008	
			InputStream in1 = request.getServletContext().getResourceAsStream(path1);
			//System.out.println(in1);
			IOUtils.copy(in1, response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("無法顯示圖片1");
		}
	}//此為圖片一的顯示方式
	   
	 
	   @GetMapping(path="/petadopt/responseImage2.controller",produces = "text/plain;charset=UTF-8")
	   @ResponseBody
	   public void  img2View(HttpServletRequest request
			                 ,HttpServletResponse response
			                 ,@RequestParam("petID")Integer petID) {
		   try {  
			      PetAdoptBean pab = pas.selectOne(petID);  //DataJpa寫法
			    //PetAdoptBean pab = pasn.petSelectPetId(petID);
			    String[][] pic = pab.getPicName();
			    String imgName2 = pic[1][0];
				String imgN2 = pic[1][1];
				String path2=petadoptuploadFolder+"/"+petID+"/"+imgName2+imgN2;
				InputStream in2 = request.getServletContext().getResourceAsStream(path2);
				IOUtils.copy(in2, response.getOutputStream());
		        } catch (Exception e) {
			         e.printStackTrace();
			         System.out.println("無法顯示圖片2");
		           }
	     }  //此為圖片二的顯示方式
	
	   
	   @GetMapping(path = "/petadopt/responseImage3.controller",produces = "text/plain;charset=UTF-8")
	   @ResponseBody
	   public void img3View(HttpServletRequest request
			                ,HttpServletResponse response
			                ,@RequestParam("petID")Integer petID) {
		    PetAdoptBean pab = pas.selectOne(petID);  //DataJpa寫法
		    //PetAdoptBean pab = pasn.petSelectPetId(petID);
		    String[][] pic = pab.getPicName();
		    String imgName3 = pic[2][0];
		    String imgN3 = pic[2][1];
		    String path3 = petadoptuploadFolder+"/"+petID+"/"+imgName3+imgN3;
		    InputStream in3 = request.getServletContext().getResourceAsStream(path3);
		    try {
		    	IOUtils.copy(in3,response.getOutputStream());
		    } catch (Exception e) {
			     e.printStackTrace();
			     System.out.println("無法顯示圖片3");
		      }
	   }//此為圖片三的顯示方式
	
	
	@PostMapping("/petadopt/petDelete.controller")  //我是刪除
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
//			   System.out.println(pathD1);//圖片img1路徑
//			   System.out.println(pathD2);
//			   System.out.println(pathD3);
			   
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
		List<PetAdoptBean> petsHit = pas.selectPetHitsTop5();
		m.addAttribute("Hits", petsHit);
		//pasn.petDelete(petID);
    	 return "PetAdopt/MainFace";
     }

    @PostMapping("/petadopt/petUpdataView") //移轉到修改JSP
    public String petSelectOne( Integer petID,Model m) { //@Param("petID")
    	PetAdoptBean pasl = pas.selectOne(petID);  //DataJpa寫法
    	Integer action = pasl.getPetAction();
    	if(action !=0) {
    		Integer memberid = pasl.getTestmember().getMemberid();
    		List<PetAdoptBean> pets = pas.memberSelectPet(memberid);
    		String petname= pasl.getPetName();
    		m.addAttribute("PetAdopts", pets);
    		m.addAttribute("petupdataerror","名稱為"+petname+"的寵物"+ ErrorpetAdopted);
    		return "PetAdopt/MemberPetSelect";
    	}
    	//PetAdoptBean pasl = pasn.petSelectPetId(petID);
    	m.addAttribute("pas",pasl);
    	return "PetAdopt/PetUpdata";
    }
    
    @PostMapping("/petadopt/petUpdate.controller")     //這邊是執行修改動作 然後回傳給單一檢索 
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
         
     
         return selectBypetID(petid,m,request);
    }
     
    @GetMapping("/petadopt/sc")
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
        
    	 return "PetAdopt/PetSelectSc";
     }
         
	 // 多對多  
	 @ResponseBody
   @PostMapping(path="/petadopt/likepet/{petID}" ,produces = "text/plain;charset=UTF-8")
   public  String  petadoptlike(HttpServletRequest request,
   		                   Model m,@PathVariable("petID") int petID
   		                ) {
   	PetAdoptBean pet = pas.selectOne(petID);
   	if(pet !=null) {
   		
     Integer memberid=(Integer)(request.getSession().getAttribute("memberid"));
     if(memberid == null) {
    	 return "nologin";
     }
     Member member = mbs.findById(memberid);
     List<PetAdoptBean> pets = member.getListPAB();
      
     for(int i =0;i<pets.size();i++) {
    	 if((pets.get(i).getPetID())==pet.getPetID()) {
    		 System.out.println("移除");
    		 member.getListPAB().remove(pet);
             pet.getMembers().remove(member);
             mbs.save(member);
    		 return "false";
    	     }
    	 }
     pet.getMembers().add(member);
     member.getListPAB().add((pet));
     mbs.save(member);
    	 
     if(pets.isEmpty()) {
		 pet.getMembers().add(member);
         member.getListPAB().add((pet));
         mbs.save(member);
         return "true";
	 }else {}
   	} 
       return "true"; }
	 
	 
	 @GetMapping(path = "/petadopt/mylike") 
		public String selectMemberLike(HttpServletRequest request ,Model m) {
		    Integer memberid =(Integer) (request.getSession().getAttribute("memberid"));
			List<PetAdoptBean> petsHit = pas.selectPetHitsTop5();
		    if(memberid==null) {
		    
				m.addAttribute("Hits", petsHit);
		    	m.addAttribute("error",Errorlogin);
		    	return "PetAdopt/MainFace";
		    }
		    Member member = mbs.findById(memberid);
		    List<PetAdoptBean> pets = member.getListPAB();
		    if(pets.size()==0) {
				m.addAttribute("Hits", petsHit);
		    	m.addAttribute("error",Errora);
		    	return "PetAdopt/MainFace";
		    }
		    String mylike="mylike";
		   m.addAttribute("mylike", mylike);
		   m.addAttribute("PetAdopts",pets);
			return "PetAdopt/PetSelect";		
		}
	 @ResponseBody
	 @PostMapping(path="petadopt/actionchange/{petID}",produces = "text/plain;charset=UTF-8")
	 public  String petAdoptActionChange(Model m,HttpServletRequest request,
		                                          @PathVariable(name="petID") int petid) {
		 
		 Integer memberid = (Integer)request.getSession().getAttribute("memberid");
		 if(memberid==null) {
			 return "nologin";
		 }
		 PetAdoptBean pet = pas.selectOne(petid);
		 Integer petadoptmemberid=pet.getTestmember().getMemberid();	
		 
		 if(memberid.equals(petadoptmemberid)) {
			 return "errorsame";
		 }
		 else {
			 Integer petaction = pet.getPetAction(); 
			 if(petaction==1) {
				 return "actionsame";
			 }
			 pet.setPetAction(1);
			 pet.setPetAccept(memberid);
			 pas.save(pet);
			 String success="success";
			 m.addAttribute("petadoptsuccess", success);
			 return "true";
		 } 
	 }
	 @PostMapping(path="/petadopt/petadoptfinish")
	 public String petAdoptFinish(@RequestParam Integer petID,Model m) {
		 PetAdoptBean pet = pas.selectOne(petID);
		 pet.setPetAction(2);
		 pas.save(pet);
		 String fin="完成";
		 m.addAttribute("checkaccept",fin);
		 return mainFace(m);
	 }
	
	
	 
}
