package com.petAdopt.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.petAdopt.springboot.model.TestMember;

@Repository
public interface ITestMemberRep extends  JpaRepository<TestMember,Integer>{
            
	   
}
