package com.petAdopt.springboot.repository;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.petAdopt.springboot.model.PetAdoptBean;

@Repository("IpetAdoptDao")
public interface IpetAdoptDao extends JpaRepository<PetAdoptBean, Integer>
                                       {
 
    @Query(value="FROM PetAdoptBean  Where memberId = :memberId") //HQL語法
	 List<PetAdoptBean> findByMemberId(Integer memberId);
    
    @Query(value="FROM PetAdoptBean Where petArea = :petArea") //HQL語法
    List<PetAdoptBean> findByPetArea(String petArea);
   
    @Query(value="Select * from adoptTableTEST Where petSpecies = :petSpecies",nativeQuery = true)
    List<PetAdoptBean>  findByPetSpecies(String petSpecies);
   
    @Query(value="Select * from adoptTableTEST adt Where adt.petName LIKE %?1% OR"
                                                    +" adt.petGender LIKE %?1% OR"
                                                    +" adt.petSpecies LIKE %?1% OR"
                                                    +" adt.petColor LIKE %?1% OR"
                                                    +" adt.petBreeds LIKE %?1% OR"
                                                    +" adt.petLigation LIKE %?1% OR"
                                                    +" adt.petArea LIKE %?1% OR"
                                                    +" adt.petInsertday LIKE %?1% OR"
                                                    +" adt.petNarrate LIKE %?1%",nativeQuery = true)
    List<PetAdoptBean> seachPetAdopt(String seachpet);    //模糊比對
    
    List<PetAdoptBean> findByPetAreaOrPetSpecies(String petArea,String petSpecies);//DataJpa的  Or語法
    List<PetAdoptBean> findByPetAreaAndPetSpecies(String petArea,String petSpecies);//DataJpa  And語法
    
}
