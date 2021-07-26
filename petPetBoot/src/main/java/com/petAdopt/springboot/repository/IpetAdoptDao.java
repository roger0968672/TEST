package com.petAdopt.springboot.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.petAdopt.springboot.model.PetAdoptBean;

@Repository("IpetAdoptDao")
public interface IpetAdoptDao extends CrudRepository<PetAdoptBean, Integer>{

}
