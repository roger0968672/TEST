package com.petAdopt.springboot.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name="testmember")
public class TestMember {
	
     @Id  @Column(name="MEMBERID")
     @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberid;
     
	@Column(name="MEMBERNAME")
	private String membername;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "testmember",cascade = CascadeType.ALL)
	private Set<TestPetAdoptBean>  TPAB=new HashSet<TestPetAdoptBean>();
	
	@Column(name="MEMBERPHONE")
	private String memberphone;

	public TestMember() {
	}
	public TestMember(String membername,String memberphone) {
		this.membername=membername;
		this.memberphone=memberphone;
	}

	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public Set<TestPetAdoptBean> getTPAB() {
		return TPAB;
	}

	public void setTPAB(Set<TestPetAdoptBean> tPAB) {
		TPAB = tPAB;
	}
	public String getMemberphone() {
		return memberphone;
	}
	public void setMemberphone(String memberphone) {
		this.memberphone = memberphone;
	}
	
}
