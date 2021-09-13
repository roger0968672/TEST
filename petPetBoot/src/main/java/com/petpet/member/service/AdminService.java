package com.petpet.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petpet.member.model.Admin;
import com.petpet.member.repository.AdminRepository;

@Service("AdminService")
@Transactional
public class AdminService implements IAdminService {
	
	@Autowired @Qualifier("adminDAO")
	private AdminRepository adminRepository;
	
	@Override
	public Admin findByAccountAndPassword(String account, String password) {
		return adminRepository.findByAccountAndPassword(account, password);
	}
	
}
