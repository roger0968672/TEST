package com.petpet.PetAdopt.repository;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.petpet.PetAdopt.model.PetAdoptBean;



@Repository("IpetAdoptDao")
public interface IpetAdoptDao extends JpaRepository<PetAdoptBean, Integer>
                                       {
 
    @Query(value="FROM PetAdoptBean  Where memberId = :memberId") //HQL語法 找Memberid
	 List<PetAdoptBean> findByMemberId(Integer memberId);
    
    @Query(value="FROM PetAdoptBean pab WHERE pab.petArea = :petArea and petAction=:action") //HQL語法 找所在地區
    Page<PetAdoptBean> PetAreaPage(String petArea,Pageable pageable,Integer action);
   
    @Query(value="Select * from adoptTableTEST Where petSpecies = :species and petAction=:action",nativeQuery = true) //找寵物種類
    Page<PetAdoptBean>  PetSpeciesPage(String species ,Pageable pageable,Integer action);
   
    
    @Query(value="Select * from adoptTableTEST adt Where  adt.petAction ='0' and  adt.petName LIKE %?1% OR"
                                                    +" adt.petAction ='0' and adt.petGender LIKE %?1% OR"
                                                    +" adt.petAction ='0' and adt.petSpecies LIKE %?1% OR"
                                                    +" adt.petAction ='0' and adt.petColor LIKE %?1% OR"
                                                    +" adt.petAction ='0' and adt.petBreeds LIKE %?1% OR"
                                                    +" adt.petAction ='0' and adt.petLigation LIKE %?1% OR"
                                                    +" adt.petAction ='0' and adt.petArea LIKE %?1% OR"
                                                    +" adt.petAction ='0' and adt.petInsertday LIKE %?1% OR"                                      
                                                    +" adt.petAction ='0' and adt.petNarrate LIKE %?1%",nativeQuery = true)
    Page<PetAdoptBean> seachPetAdopt(String seachpet,Pageable pageable);    //模糊比對
    
    
   
    @Query(value="SELECT COUNT(*)  FROM  adoptTableTEST WHere petSpecies=:species ",nativeQuery = true)
    Integer seachSpecies(String species);  //圓餅圖
    
    @Query(value="SELECT COUNT(*)  FROM  adoptTableTEST WHere petSpecies=:species and petAction=:action",nativeQuery = true)
    Integer seachSpeciesandaction(String species,Integer action);  //圓餅圖
    
    List<PetAdoptBean> findByPetAreaOrPetSpecies(String petArea,String petSpecies);//DataJpa的  Or語法
    
    Page<PetAdoptBean> findByPetAreaAndPetSpeciesAndPetAction(String petArea,String petSpecies,Pageable pageable,Integer petaction);//DataJpa  And語法
    
    
    @Query(value="Select Top 5 * From adoptTableTEST Where petaction=:petAction Order By pethits Desc",nativeQuery = true)
    List<PetAdoptBean> selectPetHitsTop5 (int petAction);
    @Query(value="Select Top 5 * From adoptTableTEST Order By petinsertday Desc",nativeQuery = true)
    List<PetAdoptBean> selectPetInsertDayTop5();
    
    @Query(value="select * from  adoptTableTEST where petaccept =:petaccept",nativeQuery = true)
    List<PetAdoptBean> petSelectMemberforpetAccept(int petaccept);//找尋自己領養的寵物
    @Query(value="select * from  adoptTableTEST where petaction =:petAction",nativeQuery = true)
    Page<PetAdoptBean> petSelectAllforpetAction(int petAction,Pageable pageable);//認領寵物
    
    
    @Query(value="select * from  adoptTableTEST where petaccept =:petaccept  and petaction=:action",nativeQuery = true)
    List<PetAdoptBean> petSelectMemberforpetAccept1(int petaccept,int action);//找尋自己領養的寵物
    
    @Query(value="FROM PetAdoptBean  Where memberId = :memberId and petAction !=:action") //HQL語法 找Memberid
  	 List<PetAdoptBean> findByMemberId1(Integer memberId,int action );
}
