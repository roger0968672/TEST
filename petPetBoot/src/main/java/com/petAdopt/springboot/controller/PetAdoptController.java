package com.petAdopt.springboot.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petAdopt.springboot.model.PetAdoptBean;
import com.petAdopt.springboot.service.IpetAdoptService;

@Controller
//@RequestMapping(value= {"","petAdopt"})
public class PetAdoptController {
      
	
	@Autowired
	private  IpetAdoptService pas;
	
	@GetMapping("/")
	public String mainFace(){
		return "MainFace";
	}
	@GetMapping("/petInsert")
	public String  petInsert() {
		return "PetInsert";
	}
	
	@PostMapping("/update")
	public String SelectOne() {
		return "PetUpdata";
	}
		
	
	
	@GetMapping("/petSelectAll")
	public String selectAll(ModelMap m) {
		m.put("PetAdopts",pas.selectAll());
		return "PetSelect";
	}
	
	@PostMapping("/petInsert.controller")
	public String petInsert(HttpServletRequest request ,Model m) {
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
         System.out.println("123");
         pas.Insert(pab);
         m.addAttribute("pab",pab);
		return "PetSelectOne";
	}
	@PostMapping("/petDelete.controller")
     public String petDelete(HttpServletRequest request) {
		int petid=Integer.parseInt(request.getParameter("petID")); 
		pas.delete(petid);
    	 return "MainFace";
     }

    @PostMapping("/petUpdataView")
    public String petSelectOne(int petID,Model m) {
    	PetAdoptBean pasl = pas.selectOne(petID);
    	m.addAttribute("pas",pasl);
    	return "PetUpdata";
    }
    
//    @PutMapping("/petUpdate/{petID}")
//    public @ResponseBody Map<String,String> petUpdatasys(@RequestBody PetAdoptBean pab,
//    		                                              @PathVariable Integer petID){
//    	HashMap pasm = new HashMap<>();
//    	String result=null;
//    	try {
//			pas.updata(pab);
//			result="修改成功";
//		} catch (Exception e) {
//			result=e.getMessage();
//		}
//    	
//    	return pasm;
//    }
    @PostMapping("/petUpdate.controller")
    public String petUpdate(Model m ,HttpServletRequest request) {
    	 
    	 int petid=Integer.parseInt(request.getParameter("petID")); 
    	 PetAdoptBean pab = pas.selectOne(petid);
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
         return "PetSelectOne";
    }
    
//    public Map<String,String> petUpdataT(@RequestBody PetAdoptBean pab,
//    		                             @PathVariable Integer petID
//    		                             ){
//    	HashMap map = new HashMap<>();
//    	String result="";
//    	try {
//    		pas.updata(pab);
//    		result="修改成功";
//    		map.put("succes",result);
//    	}
//    	catch(Exception e) {
//    		result=e.getMessage();
//    		map.put("fail",result);
//    	}
//    	
//    	return map;
//    }
	
}
