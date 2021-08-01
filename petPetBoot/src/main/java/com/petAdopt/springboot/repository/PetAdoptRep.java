package com.petAdopt.springboot.repository;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petAdopt.springboot.model.PetAdoptBean;

@Repository
public class PetAdoptRep implements IpetAdoptRep {
	
    @Autowired
	EntityManager em;
	
	@Override
	public PetAdoptBean petInsert(PetAdoptBean pab) {
		
		em.persist(pab);
     return pab;
	}

	
	@Override
	public List<PetAdoptBean> petSelectAll() {
		String hql="FROM PetAdoptBean";
		return  em.createQuery(hql,PetAdoptBean.class)
				.getResultList();
	}

	@Override
	public void petDelete(int petID) {
		PetAdoptBean pabem = em.find(PetAdoptBean.class, petID);
	 	em.remove(pabem);
	 
	}

	@Override
	public PetAdoptBean petSelectPetId(int petID) {
		 PetAdoptBean pabem = em.find(PetAdoptBean.class, petID);
		return pabem;
	}

	@Override
	public PetAdoptBean petUpdata(PetAdoptBean pab) {
	     PetAdoptBean pab0 = petSelectPetId(pab.getPetID());
	     pab0.setPetArea(pab.getPetArea().trim());
	     pab0.setPetBreeds(pab.getPetBreeds().trim());
	     pab0.setPetColor(pab.getPetColor().trim());
	     pab0.setPetGender(pab.getPetGender().trim());
	     pab0.setPetInsertDay(pab.getPetInsertDay().trim());
	     pab0.setPetLigation(pab.getPetLigation().trim());
	     pab0.setPetName(pab.getPetName().trim());
	     pab0.setPetNarrate(pab.getPetNarrate());
	     pab0.setPetSpecies(pab.getPetSpecies());
	     em.detach(pab0);
	     PetAdoptBean pab1= em.merge(pab);
		return pab1;
	}

}
