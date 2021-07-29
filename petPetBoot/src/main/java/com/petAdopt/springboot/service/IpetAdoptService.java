package com.petAdopt.springboot.service;

import com.petAdopt.springboot.model.PetAdoptBean;

public interface IpetAdoptService {
     
	 Iterable<PetAdoptBean> selectAll();
	
	 PetAdoptBean selectOne(int petID);
	
	 PetAdoptBean Insert(PetAdoptBean pab);
	
	 void delete(int petID);
	
	 PetAdoptBean save(PetAdoptBean pab);

	//void updata(PetAdoptBean pab);

	
	
//	 void updata(PetAdoptBean Bean);
}
