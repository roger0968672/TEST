package com.petpet.member.service;

import com.petpet.member.model.Admin;

public interface IAdminService {

	public Admin findByAccountAndPassword(String account, String password);
	
}
