package com.petAdopt.springboot.service;

import com.petAdopt.springboot.model.PetAdoptBean;

public interface IpetAdoptService {
     
	public Iterable<PetAdoptBean> selectAll();
	
	public PetAdoptBean selectOne(int petID);
	
	public PetAdoptBean Insert(PetAdoptBean pab);
	
	public void delete(int petID);
}
