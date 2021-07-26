package com.petAdopt.springboot.model;

import java.util.Date;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name="adoptTable") 
public class PetAdoptBean {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer petID;
	private String petName;
	private String petGender;
	private String petSpecies;
	private String petColor;
	private String petBreeds;
	private String petLigation;
	private String petArea;
	private String petNarrate;
	
	private String petInsertDay;
	
	
	
	
	
	public PetAdoptBean() {
	}



	public PetAdoptBean(Integer petID, String petName, String petGender, String petSpecies, String petColor,
			String petBreeds, String petLigation, String petArea, String petNarrate, String petInsertDay) {
		super();
		this.petID = petID;
		this.petName = petName;
		this.petGender = petGender;
		this.petSpecies = petSpecies;
		this.petColor = petColor;
		this.petBreeds = petBreeds;
		this.petLigation = petLigation;
		this.petArea = petArea;
		this.petNarrate = petNarrate;
		this.petInsertDay = petInsertDay;
	}
	
	
	
	public Integer getPetID() {
		return petID;
	}
	public void setPetID(Integer petID) {
		this.petID = petID;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getPetGender() {
		return petGender;
	}
	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}
	public String getPetSpecies() {
		return petSpecies;
	}
	public void setPetSpecies(String petSpecies) {
		this.petSpecies = petSpecies;
	}
	public String getPetColor() {
		return petColor;
	}
	public void setPetColor(String petColor) {
		this.petColor = petColor;
	}
	public String getPetBreeds() {
		return petBreeds;
	}
	public void setPetBreeds(String petBreeds) {
		this.petBreeds = petBreeds;
	}
	public String getPetLigation() {
		return petLigation;
	}
	public void setPetLigation(String petLigation) {
		this.petLigation = petLigation;
	}
	public String getPetArea() {
		return petArea;
	}
	public void setPetArea(String petArea) {
		this.petArea = petArea;
	}
	public String getPetNarrate() {
		return petNarrate;
	}
	public void setPetNarrate(String petNarrate) {
		this.petNarrate = petNarrate;
	}
	
     
	public String getPetInsertDay() {
		return petInsertDay;
	}



	public void setPetInsertDay(String petInsertDay) {
		this.petInsertDay = petInsertDay;
	}



	@Override
	public String toString() {
		return "PetAdoptBean "
				+ "[petID=" + petID 
				+ ", petName=" + petName + 
				", petGender=" + petGender +
				", petSpecies="+ petSpecies +
				", petColor=" + petColor + 
				", petBreeds=" + petBreeds + 
				", petLigation=" + petLigation
				+ ", petArea=" + petArea +
				", petNarrate=" + petNarrate
				+ ", petInsertDay=" + petInsertDay + "]";
	}

    
	
	
	
	
	
	
	
	
	
}
