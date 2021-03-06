package com.petAdopt.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;

import com.petAdopt.springboot.model.PetAdoptBean;

public interface IpetAdoptService {
     
	 Iterable<PetAdoptBean> selectAll();
	 
	 List<PetAdoptBean> memberSelectPet(Integer id);
	 
	 List<PetAdoptBean> selectPetSpecies(String petSpecies);
	 List<PetAdoptBean> selectPetArea(String petArea);
//	 List<PetAdoptBean> selectPetAreaOrPetSpecies(String petArea,String petSpecies); //測試Or語法
	 List<PetAdoptBean> selectPetAreaAndPetSpecies(String petArea,String petSpecies);
	 
	 PetAdoptBean selectOne(int petID);
	
	 PetAdoptBean Insert(PetAdoptBean pab);
	
	 void delete(int petID);
	
	 PetAdoptBean save(PetAdoptBean pab);

	//void updata(PetAdoptBean pab);
	 public Page<PetAdoptBean> QueryAllPage(int pageNum,String sortField,String sortDir);

	 List<PetAdoptBean> seachPetAdopt(String seachpet);
	
	 
	 //圓餅圖
	 Integer seachPetbird(String bird);
	 Integer seachPetCat(String cat);
	 Integer seachPetDog(String dog);
	 Integer seachPetMouse(String mouse);
	 Integer seachPetRabbit(String rabbit);
	 Integer seachPetTurtle(String turtle);
	 Integer seachPetsnake(String snake);
	 Integer seachPetPig(String pig);
}
