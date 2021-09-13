package com.petpet.member.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petpet.member.model.Member;
import com.petpet.member.repository.MemberRepository;
import com.petpet.member.util.AESUtil;

@Service("MemberService")
@Transactional
public class MemberService implements IMemberService {

	@Autowired @Qualifier("memberDAO")
	private MemberRepository memberDAO;
	
	@Override
	public List<Member> findAll() {
		return memberDAO.findAll();
	}
	
	@Override
	public Member findById(Integer memberid) {
		return memberDAO.getById(memberid);
	}
	
	@Override
	public Member save(Member member) {
		return memberDAO.save(member);
	}
	
	@Override
	public void delete(Member member) {
		memberDAO.delete(member);
	}

	@Override
	public void deleteById(Integer memberid) {
		memberDAO.deleteById(memberid);
	}

	@Override
	public Member findByEmail(String email) {
		return memberDAO.findByEmail(email);
	}
	
	@Override
	public Member findByEmailAndPassword(String email, String password) {
		return memberDAO.findByEmailAndPassword(email, password);
	}
	
	@Override
	public boolean verify(String verificationCode) {
		Member member = memberDAO.findByVerificationcode(verificationCode);
		if(member == null || member.isEnabled()) {
			return false;
		}else{
			memberDAO.enable(member.getMemberid());
			return true;
		}
	}
	
	
	public void updateResetPasswordToken(String token, String email) throws MemberNotFoundException {
		Member member = memberDAO.findByEmail(email);
		if(member != null) {
			member.setResetPasswordToken(token);
			memberDAO.save(member);
		}else {
			throw new MemberNotFoundException(email + " 並不是本站會員");
		}
	}
	
	public Member get(String resetPasswordToken) {
		return memberDAO.findByResetPasswordToken(resetPasswordToken);
	}
	
	public void updateResetPassword(Member member, String newPassword) {
		member.setPassword(AESUtil.encryptString(newPassword));
		member.setResetPasswordToken(null);
		memberDAO.save(member);
	}

	@Override
	public void enable(Integer memberid) {
		memberDAO.enable(memberid);
	}

	@Override
	public Member findByVerificationcode(String code) {
		return memberDAO.findByVerificationcode(code);
	}
	
	@Override
	public Optional<Member> adminFindById(Integer memberid) {
		return memberDAO.findById(memberid);
	}
	
	@Override
	public Member findByPassword(String password) {
		return memberDAO.findByPassword(password);
	}
	
	@Override
	public Member findByPasswordAndMemberid(String password, Integer memberid) {
		return memberDAO.findByPasswordAndMemberid(password, memberid);
	}
	
	@Override
	public String findByOldpassword(String password) {
		return memberDAO.findByOldpassword(password);
	}
	
	@Override
	public boolean havePostAddress(Member member) {
		String postalcode = member.getPostalcode();
		String city = member.getCity();
		String region = member.getRegion();
		String address = member.getAddress();
		String postname = member.getPostname();
		String postmobile = member.getPostmobile();
		if(postalcode!=null && city!=null && region!=null && address!=null && postname!=null && postmobile!=null) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public String getPostAddress(Member member) {
		String postalcode = member.getPostalcode();
		String city = member.getCity();
		String region = member.getRegion();
		String address = member.getAddress();
		String postAddress = postalcode + city + region + address;
		return postAddress;
	}
}
