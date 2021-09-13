package com.petpet.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.petpet.member.model.Admin;
import com.petpet.member.model.Member;

@Repository("adminDAO")
@Transactional
public interface AdminRepository extends JpaRepository<Admin, Integer>{
	
	public Admin findByAccountAndPassword(String account, String password);
}
