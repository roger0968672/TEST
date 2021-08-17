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
	public  String img1="img1";//新增img1
	public  String img2="img2";//新增img2
	public  String img3="img3";//新增img3
	public static final String CPath="C:/Users/Student/git/TEST/";
	public static final String PROPath="petPetBoot/src/main/webapp/";
	
  @Value("${uploadDir}") //抓application內的uploadDir,指定儲存路徑
  private String uploadFolder;
	
  @Value("${shareurl}")
  private String shareurl;
	@Autowired
	private  IpetAdoptService pas; //此為DATA JPA作法 連接IpetAdoptService
	
	@Autowired
	private ITestMemberService ITMS; //連接memberService
	
//	@Autowired
//	private IpetAdoptServiceNom pasn;   //自行定義pasn
	
//	@Autowired
//	private ITestMemberService IMS;
	
	
	@GetMapping("/")  //主頁面(搜尋頁面)
	public String mainFace(){
		return "MainFace";
	}
	
	@GetMapping("/seachpetadopt")
	public String seachPet(@RequestParam("seachpet") String seachpet,Model m) {
		List<PetAdoptBean> pab = pas.seachPetAdopt(seachpet);
		if(pab.isEmpty()) {
			System.out.println("沒有資料");
			return "PetSelectNull";
		}
		else {
			m.addAttribute("PetAdopts",pab);
			m.addAttribute("shareurl", shareurl);
			return "PetSelect";	
		}
	}
	
	@GetMapping("/selectpetspecies") //單一搜尋寵物類別
	public String selectPetSpecies(String  petSpecies,Model m) {
		List<PetAdoptBean> pab = pas.selectPetSpecies(petSpecies);
		if(pab.isEmpty()) {
			System.out.println("沒有資料");
			return "PetSelectNull";
		}
		else{
			m.addAttribute("PetAdopts", pab);
			m.addAttribute("shareurl", shareurl);
		}return "PetSelect";	
	}
	
	@GetMapping("/selectpetarea")//單一搜尋所在地區
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
		m.addAttribute("currentPage", pageNum); //當前頁面
		m.addAttribute("totalPages", page.getTotalPages());//總頁數
		m.addAttribute("totalItems", page.getTotalElements());//資料總筆數
		
		m.addAttribute("sortField", sortField);
	    m.addAttribute("sortDir", sortDir);
		m.addAttribute("PetAdopts", listPetAdopt);
		m.addAttribute("shareurl", shareurl);
		return "PetSelect2";
	}
	@RequestMapping(path={"/petAdoptselectAll"}, method = {RequestMethod.POST,RequestMethod.GET})
	public String memberviewHomepage(Model m,String sortField, String sortDir) {
		return  petSelectPage(m,1, "petID", "desc");
	}//預設排序跟順序
	
	
	@GetMapping("/petInsert")  //新增頁面
	public String  petInsert(Model m) {
	   //return "PetInsertAjax";
		m.addAttribute("shareurl", shareurl);
	   return "PetInsert"; 
	}
	
	@GetMapping("/backstagePetAdopt") //後臺頁面
    public String backagePet(Model m) {
		//List<PetAdoptBean> pas1 = pasn.petSelectAll();
		Iterable<PetAdoptBean> pas1 = pas.selectAll(); //DataJpa寫法
		m.addAttribute("PetAdopts", pas1);
		m.addAttribute("shareurl", shareurl);
    	return "BackstagePetSelect";
    }
	
	@GetMapping("/memberSelectpet")  //找尋member自己的寵物
	public String memberpetSelect(Model m ) {
		Integer memberid=2;
		List<PetAdoptBean> pas1 = pas.memberSelectPet(memberid);
		m.addAttribute("shareurl", shareurl);
		m.addAttribute("PetAdopts", pas1);
		return "PetSelect";
	}
	
	
	@GetMapping("/petSelectAll") //找尋所有的寵物
    public String petSelectAlltest(Model m) {
		//List<PetAdoptBean> pas1 = pasn.petSelectAll();
		Iterable<PetAdoptBean> pas1 = pas.selectAll(); //DataJpa寫法
		m.addAttribute("shareurl", shareurl);
		m.addAttribute("PetAdopts", pas1);
    	return "PetSelect";
    }
//	@GetMapping("/petSelectAll")
//	public @ResponseBody List<PetAdoptBean> petSelectAllNom(){
//		return  pasn.petSelectAll();
//	}
	 
	@GetMapping("/select/pet")   //單一檢索寵物頁面
	public String selectBypetID(@RequestParam("petID") Integer petID,Model m) {
//		PetAdoptBean pabS = pasn.petSelectPetId(petID);
		PetAdoptBean pabS = pas.selectOne(petID); //DataJpa寫法
	    
		m.addAttribute("pab", pabS);
		m.addAttribute("shareurl", shareurl);
		System.out.println(shareurl);
		return "PetSelectOne";
	}
	
	@PostMapping("/petInsert.controller") //新增寵物回傳到單一搜尋上
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
         
         m.addAttribute("pab",pab);
         m.addAttribute("shareurl", shareurl);
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
			 PetAdoptBean pab = pas.selectOne(petID);  //DataJpa寫法
			 //PetAdoptBean pab = pasn.petSelectPetId(petID);
			String[][] pic = pab.getPicName();
			String imgName1 = pic[0][0]; //圖檔名為img1
			String imgN1 = pic[0][1];   //此為圖片副檔名
			String path1=uploadFolder+"/"+petID+"/"+imgName1+imgN1;//網址
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
	   
	 
	   @GetMapping(path="/responseImage2.controller",produces = "text/plain;charset=UTF-8")
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
		    PetAdoptBean pab = pas.selectOne(petID);  //DataJpa寫法
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
			     System.out.println("無法顯示圖片3");
		      }
	   }//此為圖片三的顯示方式
	
	
	@PostMapping("/petDelete.controller")  //我是刪除
     public String petDelete(HttpServletRequest request
    		                ,@RequestParam("petID") int petID ) {
		//PetAdoptBean pab = pasn.petSelectPetId(petID);
		PetAdoptBean pab = pas.selectOne(petID);  //DataJpa寫法
		String[][] picPath = pab.getPicName();
		String imgName1 =picPath[0][0];
		String imgName2 =picPath[1][0];
		String imgName3 =picPath[2][0];//三個圖片的檔名,為img1  img2  img3
		String picN1=picPath[0][1]; 
		String picN2=picPath[1][1];
		String picN3=picPath[2][1];//圖片格式 
		
		 String petPath = uploadFolder+"/"+petID;
		 File imgPath1 = new File(petPath+"/"+imgName1+picN1);//圖片一的路徑位置
		 File imgPath2 = new File(petPath+"/"+imgName2+picN2);//圖片二的路徑位置
		 File imgPath3 = new File(petPath+"/"+imgName3+picN3);//圖片三的路徑位置
		 File file=new File(petPath);//資料夾路徑
		//"C:/Users/Student/git/TEST/petPetBoot/src/main/webapp"+

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
			   //System.out.println(filen);//資料夾
			   Files.delete(filen);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("刪除失敗");
		}
		  
		pas.delete(petID); //DataJpa寫法
		//pasn.petDelete(petID);
    	 return "MainFace";
     }

    @PostMapping("/petUpdataView") //移轉到修改JSP
    public String petSelectOne(int petID,Model m) {
    	PetAdoptBean pasl = pas.selectOne(petID);  //DataJpa寫法
    	//PetAdoptBean pasl = pasn.petSelectPetId(petID);
    	m.addAttribute("pas",pasl);
    	return "PetUpdata";
    }
    
    @PostMapping("/petUpdate.controller")     //這邊是執行修改動作 然後回傳給單一檢索 
    public String petUpdate(Model m ,HttpServletRequest request
    		                 ,@RequestParam("petPic1")MultipartFile file1
    		                 ,@RequestParam("petPic2")MultipartFile file2
    		                 ,@RequestParam("petPic3")MultipartFile file3
    		                ) {
    	 
    	 int petid=Integer.parseInt(request.getParameter("petID")); 
    	 PetAdoptBean pab = pas.selectOne(petid);  //DataJpa寫法
    	 //PetAdoptBean pab = pasn.petSelectPetId(petid);
    	
    	 String[][] picn = pab.getPicName();
    	 String savePathDir = request.getServletContext().getRealPath(uploadFolder);
			savePathDir+="\\"+pab.getPetID();
	     File saveFileDir = new File(savePathDir);
	     saveFileDir.mkdirs();	
	     //System.out.println("判斷布林"+file1.isEmpty());
	     String petDPath = uploadFolder+"/"+petid;//取得當前資料的資料夾位置
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
         
         m.addAttribute("pab",pab);
         m.addAttribute("shareurl", shareurl);
         return "PetSelectOne";
    }
     
    @GetMapping("/adopt/addbird")
     public String  seachPetbird(Model m) {
    	String cat="貓";    String dog="狗";
    	String bird="鳥";   String mouse="鼠";
    	String rabbit="兔"; String turtle="龜";     
    	String snake="蛇";  String pig="豬";     
    	 
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
