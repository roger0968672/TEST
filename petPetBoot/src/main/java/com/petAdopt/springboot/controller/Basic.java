package com.petAdopt.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Basic {
    
	@GetMapping("/Test")
	public String testajax() {
		return"TestAjax";
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
