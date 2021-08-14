package com.petAdopt.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petAdopt.springboot.model.TestMember;
import com.petAdopt.springboot.repository.ITestMemberRep;

@Service
@Transactional
public class TestMemberService implements ITestMemberService {

	 @Autowired
	 ITestMemberRep  ITMR;
	
	 @Override
	public List<TestMember> selectAll() {
	  return  ITMR.findAll();
		
	}

	@Override
	public TestMember selectmemberid(Integer memberid) {
		System.out.println("這邊是一開始的service");
		  TestMember mb = ITMR.findById(memberid).orElse(null);
		System.out.println("service的結束");
		  return mb;
		
	}

}
