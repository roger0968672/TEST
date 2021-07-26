package com.petAdopt.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petAdopt.springboot.model.PetAdoptBean;
import com.petAdopt.springboot.repository.IpetAdoptDao;

@Service("petAdoptService")
@Transactional
public class PetAdoptService implements IpetAdoptService {
   
	@Autowired
	private IpetAdoptDao dao;
	
	@Override
	public Iterable<PetAdoptBean> selectAll() {
		
		return dao.findAll();
	}

	@Override
	public PetAdoptBean selectOne(int petID) {
		
		return dao.findById(petID).get();
	}

	@Override
	public PetAdoptBean Insert(PetAdoptBean pab) {
		return dao.save(pab);
	}

	@Override
	public void delete(int petID) {
		dao.deleteById(petID);
	}

	@Override
	public PetAdoptBean save(PetAdoptBean pab) {
	
		return dao.save(pab);
	}

//	@Override
//	public void updata(PetAdoptBean pab) {
//		dao.updata(pab);
//		
//	}
    
	
}
