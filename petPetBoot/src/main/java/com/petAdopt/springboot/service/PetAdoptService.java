package com.petAdopt.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

	@Override
	public List<PetAdoptBean> memberSelectPet(Integer memberId) {
		
		return dao.findByMemberId(memberId);
		
	}

	@Override
	public List<PetAdoptBean> selectPetSpecies(String petSpecies) {
		System.out.println(123);
		return dao.findByPetSpecies(petSpecies);
	}

	@Override
	public List<PetAdoptBean> selectPetArea(String petArea) {
		return dao.findByPetArea(petArea);
		//return dao.findByPetAreaOrPetSpecies(petArea, petSpecies);//此為測試DataJpa的Or語法
	}

	@Override
	public List<PetAdoptBean> selectPetAreaAndPetSpecies(String petArea, String petSpecies) {
		return dao.findByPetAreaAndPetSpecies(petArea, petSpecies);
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
	public List<PetAdoptBean> seachPetAdopt(String seachpet) {
		return dao.seachPetAdopt(seachpet);
	}

	
	
	@Override
	public Integer seachPetbird(String bird) {
		return dao.seachPetBird(bird);
	}
	@Override
	public Integer seachPetCat(String cat) {
		return dao.seachPetCat(cat);
	}
	@Override
	public Integer seachPetDog(String dog) {
		return dao.seachPetDog(dog);
	}
	@Override
	public Integer seachPetMouse(String mouse) {
		return dao.seachPetMouse(mouse);
	}
	@Override
	public Integer seachPetRabbit(String rabbit) {
		return dao.seachPetRabbit(rabbit);
	}
	@Override
	public Integer seachPetTurtle(String turtle) {
		return dao.seachPetTurtle(turtle);
	}
	@Override
	public Integer seachPetsnake(String snake) {
		return dao.seachPetsnake(snake);
	}
	@Override
	public Integer seachPetPig(String pig) {
		return dao.seachPetPig(pig);
	}
    
//	@Override
//	public List<PetAdoptBean> selectPetAreaOrPetSpecies(String petArea ,String petSpecies) {
//		return dao.findByPetAreaOrPetSpecies(petArea, petSpecies);//此為測試DataJpa的Or語法
//	}




	



	

	

//	@Override
//	public void updata(PetAdoptBean pab) {
//		dao.updata(pab);
//		
//	}
    
	
}
