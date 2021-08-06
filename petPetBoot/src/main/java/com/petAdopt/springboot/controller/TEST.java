package com.petAdopt.springboot.controller;

import java.util.HashSet;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

import com.petAdopt.springboot.model.TestMember;
import com.petAdopt.springboot.model.TestPetAdoptBean;

public class TEST {

	@Autowired
	EntityManager em;
	
	@GetMapping("/Testmember")
	public  String testMember() {
		TestMember member1 = new TestMember("阿宏","0968-167-999");
		member1.setMembername("阿宏");
		member1.setMemberphone("0968-167-999");
		
		
		
		 em.persist(member1);
		return "MainFace";
	}

}
