package com.petpet.PetAdopt.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petpet.PetAdopt.model.PetAdoptBean;
import com.petpet.PetAdopt.repository.IpetAdoptDao;





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
	public PetAdoptBean selectOne(Integer petID) {
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

	@Override
	public List<PetAdoptBean> memberSelectPet(Integer memberId) {
		
		return dao.findByMemberId(memberId);
		
	}

//	@Override
//	public List<PetAdoptBean> selectPetSpecies(String petSpecies) {
//		return dao.findByPetSpecies(petSpecies);
//	}

	@Override
	public Page<PetAdoptBean> selectPetArea(String petArea,int pageNum, String sortField, String sortDir) {
		int pageSize=9;
		int action=0;
		Pageable pageable = PageRequest.of(pageNum - 1, pageSize,
				  sortDir.equals("desc") ? Sort.by(sortField).descending()
						  : Sort.by(sortField).ascending()
                        );
		return dao.PetAreaPage(petArea ,pageable,action);
		//return dao.findByPetAreaOrPetSpecies(petArea, petSpecies);//此為測試DataJpa的Or語法
	}

	@Override
	public Page<PetAdoptBean> selectPetAreaAndPetSpecies(String petArea, String petSpecies,int pageNum, String sortField, String sortDir) {
		int pageSize=9;
		int action=0;
		Pageable pageable=PageRequest.of(pageNum - 1, pageSize,
				  sortDir.equals("desc") ? Sort.by(sortField).descending()
						  : Sort.by(sortField).ascending()
                        );
		return dao.findByPetAreaAndPetSpeciesAndPetAction(petArea, petSpecies,pageable,action);
	}

	@Override
	public Page<PetAdoptBean> QueryAllPage(int pageNum, String sortField, String sortDir) {
		int pageSize = 9;//一頁能塞幾份資料
		Pageable pageable = PageRequest.of(pageNum - 1, pageSize,
				  sortDir.equals("desc") ? Sort.by(sortField).descending()
						  : Sort.by(sortField).ascending()
                          );
		return dao.findAll(pageable);
	}

	@Override
	public Page<PetAdoptBean> seachPetAdopt(String seachpet,int pageNum,String sortField,String sortDir) {
		int pageSize = 9;//一頁能塞幾份資料
		int action=0;
		Pageable pageable = PageRequest.of(pageNum - 1, pageSize,
				  sortDir.equals("desc") ? Sort.by(sortField).descending()
						  : Sort.by(sortField).ascending()
                          );
		return dao.seachPetAdopt(seachpet,pageable);
	}


	@Override   //圓餅圖
	public Integer seachPetSpecies(String species) {
		int action=0;
		return dao.seachSpeciesandaction(species,action);
	}

	@Override
	public Page<PetAdoptBean> selectPetSpeciesPage(String species, int pageNum, String sortField, String sortDir) {
		int pageSize = 9;//一頁能塞幾份資料
		int action=0;
		Pageable pageable = PageRequest.of(pageNum - 1, pageSize,
				  sortDir.equals("desc") ? Sort.by(sortField).descending()
						  : Sort.by(sortField).ascending()
                          );
		return  dao.PetSpeciesPage(species, pageable,action);
	}

	@Override
	public List<PetAdoptBean> selectPetHitsTop5() {
		int petaction=0;
		return dao.selectPetHitsTop5(petaction);
	}
	@Override
	public List<PetAdoptBean> selectPetInsertDayTop5() {
		return dao.selectPetInsertDayTop5();
	}
	@Override  //找自己所領養的寵物
	public List<PetAdoptBean> petSelectMemberforpetAccept(int petaccept) {
      
		return dao.petSelectMemberforpetAccept(petaccept);
	}

	@Override //找未領養寵物
	public Page<PetAdoptBean> petSelectAllforpetAction(int petAction, int pageNum, String sortField, String sortDir) {
		int pageSize=9;
		Pageable pageable=PageRequest.of(pageNum-1,pageSize,sortDir.equals("desc")? 
				Sort.by(sortField).descending():Sort.by(sortField).ascending()  
				);
	return dao.petSelectAllforpetAction(petAction, pageable);
	}

	@Override
	public List<PetAdoptBean> petSelectMemberforpetAccept(int petaccept, int petaction) {
		return dao.petSelectMemberforpetAccept1(petaccept, petaction);
	}

	@Override
	public List<PetAdoptBean> findByMemberId1(Integer memberId, int action) {
		return dao.findByMemberId1(memberId, action);
	}


    
//	@Override
//	public List<PetAdoptBean> selectPetAreaOrPetSpecies(String petArea ,String petSpecies) {
//		return dao.findByPetAreaOrPetSpecies(petArea, petSpecies);//此為測試DataJpa的Or語法
//	}



    
	
}
