package com.petAdopt.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Basic {
    
	@GetMapping("/")
	public String mainFace(){
		return "mainFace";
	}
	
	@GetMapping("/hello")
	 public String  hello(
			 @RequestParam(value="name",required=false) String vis
			 ,Model m) {
		 String mes=vis !=null ? vis+"您好" : "訪客,您好";
		 m.addAttribute("hellomsg", mes);
		 return "greeting";
	 }
}
