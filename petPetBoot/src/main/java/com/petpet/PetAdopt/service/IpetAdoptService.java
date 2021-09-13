package com.petpet.PetAdopt.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.petpet.PetAdopt.model.PetAdoptBean;



public interface IpetAdoptService {
     
	 Iterable<PetAdoptBean> selectAll();
	 
	 List<PetAdoptBean> memberSelectPet(Integer id);
	 
   //List<PetAdoptBean> selectPetSpecies(String petSpecies);
	 
	 Page<PetAdoptBean> selectPetSpeciesPage(String petSpecies,int pageNum,String sortField,String sortDir);
	 
	 Page<PetAdoptBean> selectPetArea(String petArea,int pageNum,String sortField,String sortDir);
//	 List<PetAdoptBean> selectPetAreaOrPetSpecies(String petArea,String petSpecies); //測試Or語法
	 
	 Page<PetAdoptBean> selectPetAreaAndPetSpecies(String petArea,String petSpecies,int pageNum,String sortField,String sortDir);
	 
	 PetAdoptBean selectOne(Integer petID);
	
	 PetAdoptBean Insert(PetAdoptBean pab);
	
	 void delete(int petID);
	
	 PetAdoptBean save(PetAdoptBean pab);

	//void updata(PetAdoptBean pab);
	 public Page<PetAdoptBean> QueryAllPage(int pageNum,String sortField,String sortDir);

	 Page<PetAdoptBean> seachPetAdopt(String seachpet,int pageNum,String sortField,String sortDir);
	
	 
	 //圓餅圖
	 Integer seachPetSpecies(String species);
	 //top6
	 List<PetAdoptBean>selectPetHitsTop5();
	 List<PetAdoptBean>selectPetInsertDayTop5();
	 //找自己所領養的寵物
	 List<PetAdoptBean>petSelectMemberforpetAccept(int petaccept);
	//搜尋未被領養的寵物
	 Page<PetAdoptBean>petSelectAllforpetAction(int petAction,int pageNum, String sortField, String sortDir);
	 
	 
	 List<PetAdoptBean>petSelectMemberforpetAccept(int petaccept,int petaction);//找自己領養中的寵物
	 
	 List<PetAdoptBean> findByMemberId1(Integer memberId,int action );//找會員且還沒領養完成的寵物
}
