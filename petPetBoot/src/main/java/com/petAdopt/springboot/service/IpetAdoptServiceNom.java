package com.petAdopt.springboot.service;

import java.util.List;

import com.petAdopt.springboot.model.PetAdoptBean;

public interface IpetAdoptServiceNom {
   
	 PetAdoptBean petInsert(PetAdoptBean pab); 
	 void petDelet(int petID);
	 PetAdoptBean petSelectPetId(int petID);
	 List<PetAdoptBean> petSelectAll();
	 PetAdoptBean petUpdata(PetAdoptBean pab);
}
