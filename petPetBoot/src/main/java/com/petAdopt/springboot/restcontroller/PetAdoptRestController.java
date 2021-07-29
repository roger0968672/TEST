package com.petAdopt.springboot.restcontroller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.petAdopt.springboot.model.PetAdoptBean;
import com.petAdopt.springboot.service.IpetAdoptService;

@RestController
//@RequestMapping(value= "/api/employee")
public class PetAdoptRestController {
      
	
	@Autowired
	private  IpetAdoptService pas;
	
	@RequestMapping(method = RequestMethod.GET,value="/find/{petID}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)//
	public ResponseEntity<PetAdoptBean> petSelectOne(@PathVariable("petID")int petID) {
		try {
			
			return new ResponseEntity<PetAdoptBean>(pas.selectOne(petID),HttpStatus.OK);
		}
		catch(Exception e) {
			return new ResponseEntity<PetAdoptBean>(HttpStatus.BAD_REQUEST);
		}
		
		
		
	}
	
}
