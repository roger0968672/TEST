package com.petAdopt.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petAdopt.springboot.model.PetAdoptBean;
import com.petAdopt.springboot.repository.IpetAdoptRep;

@Service("petAdoptServiceNom")
@Transactional   
public class PetAdoptServiceNom implements IpetAdoptServiceNom {
    
	@Autowired
     IpetAdoptRep par;
	
	@Override
	public PetAdoptBean petInsert(PetAdoptBean pab) {
		return par.petInsert(pab);
	}

	@Override
	public void petDelete(int petID) {
		 par.petDelete(petID);
	}

	@Override
	public PetAdoptBean petSelectPetId(int petID) {
		
		return par.petSelectPetId(petID);
	}

	@Override
	public List<PetAdoptBean> petSelectAll() {
		
		return par.petSelectAll();
	}

	@Override
	public PetAdoptBean petUpdata(PetAdoptBean pab) {
		
		return par.petUpdata(pab);
	}
  
}
