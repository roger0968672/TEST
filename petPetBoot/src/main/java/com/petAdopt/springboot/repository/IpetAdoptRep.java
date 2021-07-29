package com.petAdopt.springboot.repository;

import java.util.List;

import com.petAdopt.springboot.model.PetAdoptBean;

public interface IpetAdoptRep {

	PetAdoptBean petInsert(PetAdoptBean pab);

	List<PetAdoptBean> petSelectAll();

	void petDelet(int petID);

	PetAdoptBean petSelectPetId(int petID);

	PetAdoptBean petUpdata(PetAdoptBean pab);

	

	
    
	
}
