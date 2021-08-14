package com.petAdopt.springboot.model;

import java.util.Arrays;
import java.util.Date;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name="adoptTableTEST") 
public class PetAdoptBean {
    @Id  @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="petid")
	private Integer petID;
    
    @Column(name="petname")
	private String petName;
    
    @Column(name="petgender")
	private String petGender;
    
    @Column(name="petspecies")
	private String petSpecies;
    
    @Column(name="petcolor")
	private String petColor;
    
    @Column(name="petbreeds")
	private String petBreeds;
    
    @Column(name="petligation")
	private String petLigation;
    
    @Column(name="petarea")
	private String petArea;
    
    @Column(name="petnarrate")
	private String petNarrate;
	
    @Column(name="petinsertday")
	private String petInsertDay;
	
    @Transient  @Column(name="MEMBERID")//這邊修改會員
    private Integer memberId;
    
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="MEMBERID") 
    @JsonBackReference
    private TestMember testmember;//這邊結束
    
    
    
    
    @Column(name="picname")
	private String[][] picName;
    
    
	public String[][] getPicName() {
		return picName;
	}
	public void setPicName(String[][] picName) {
		this.picName = picName;
	}



	public PetAdoptBean() {
	}



	
	public PetAdoptBean(Integer petID, String petName, String petGender, String petSpecies, String petColor,
			String petBreeds, String petLigation, String petArea, String petNarrate, String petInsertDay,
			Integer memberid, TestMember testmember, String[][] picName) {
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
		this.memberId = memberid;
		this.testmember = testmember;
		this.picName = picName;
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
	
	
	//這邊修改會員
	public Integer getMemberid() {
		return memberId;
	}
	public void setMemberid(Integer memberid) {
		this.memberId = memberid;
	}
	public TestMember getTestmember() {
		return testmember;
	}
	public void setTestmember(TestMember testmember) {
		this.testmember = testmember;
	}//這邊結束
	@Override
	public String toString() {
		return "PetAdoptBean [petID=" + petID + 
				", petName=" + petName + 
				", petGender=" + petGender +
				", petSpecies="+ petSpecies +
				", petColor=" + petColor + 
				", petBreeds=" + petBreeds +
				", petLigation=" + petLigation+ 
				", petArea=" + petArea +
				", petNarrate=" + petNarrate +
				", petInsertDay=" + petInsertDay+
				", picname=" + Arrays.toString(picName) + "]";
	}



     

    
	
	
	
	
	
	
	
	
	
}
