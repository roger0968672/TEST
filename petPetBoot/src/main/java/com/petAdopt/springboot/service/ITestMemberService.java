package com.petAdopt.springboot.service;

import java.util.List;

import com.petAdopt.springboot.model.TestMember;

public interface ITestMemberService {
    public List<TestMember> selectAll();
    public TestMember selectmemberid(Integer memberId);
   
	
}
