package com.petAdopt.springboot.model;

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



@Entity
@Table(name="testpetadoptbean")
public class TestPetAdoptBean {

	@Id   @Column(name="PETID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer petid;
	
	@Column(name="PETNAME")
	private String petname;
	
	@Column(name="PETGENDER")
	private String petgender;
	
	@Transient  @Column(name="MEMBERID") //@Transient是指忽略欄位,值是別人給的
	private String memberid;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="MEMBERID")
	private  TestMember testmember;

	
	
	
	public TestPetAdoptBean(String petName,String petGender) {
	  this.petgender=petGender;
	  this.petname=petName;
	}

	public Integer getPetid() {
		return petid;
	}

	public void setPetid(Integer petid) {
		this.petid = petid;
	}

	public String getPetname() {
		return petname;
	}

	public void setPetname(String petname) {
		this.petname = petname;
	}

	public String getPetgender() {
		return petgender;
	}

	public void setPetgender(String petgender) {
		this.petgender = petgender;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public TestMember getTestmember() {
		return testmember;
	}

	public void setTestmember(TestMember testmember) {
		this.testmember = testmember;
	}
	
	
}
