package com.petAdopt.springboot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petAdopt.springboot.model.PetAdoptBean;
import com.petAdopt.springboot.service.IpetAdoptService;
import com.petAdopt.springboot.service.PetAdoptService;

@Controller
//@RequestMapping(value= {"","petAdopt"})
public class petAdoptController {
      
	
	@Autowired
	private  IpetAdoptService pas;
	
	@GetMapping("/")
	public String mainFace(){
		return "mainFace";
	}
	@GetMapping("/petInsert")
	public String  petInsert() {
		return "petInsert";
	}
//	@GetMapping("/petResultview.controller")
//	public String  petResultview() {
//		return "petResultview";
//	}
//	@GetMapping("/petSelect.controller")
//	public String  petSelect() {
//		return "petSelect";
//	}
//	@GetMapping("/petSelectOne.controller")
//	public String  petSelectOne() {
//		return "petSelectOne";
//	}
//	@GetMapping("petUpdata.controller")
//	public String petUpdata() {
//		return "petUpdata";
//	}
	
	@GetMapping("/petSelectAll")
	public String selectAll(ModelMap m) {
		m.put("PetAdopts",pas.selectAll());
		return "petSelect";
	}
	
	@PostMapping("/petInsert.controller")
	public String petInsert(HttpServletRequest request) {
         PetAdoptBean pab = new PetAdoptBean();
         pab.setPetArea(request.getParameter("petArea").trim());
         pab.setPetBreeds(request.getParameter("petBreeds").trim()); //1
         pab.setPetColor(request.getParameter("petColor").trim()); //2
         pab.setPetGender(request.getParameter("petGender").trim()); //3
         //pab.setPetInsertDay(request.getParameter("petInsertDay").trim()); //4
         pab.setPetLigation(request.getParameter("petLigation").trim()); //5
         pab.setPetName(request.getParameter("petName").trim());  //6
         pab.setPetNarrate(request.getParameter("petNarrate").trim()); //7
         pab.setPetSpecies(request.getParameter("petSpecies").trim()); //8
         
		return "mainFace";
	}
	
 
	
}
