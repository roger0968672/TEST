package com.petpet.member.controller;

import java.util.Base64;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petpet.member.model.Member;
import com.petpet.member.service.MemberService;

@Controller
public class MemberEditController {
	
	@Autowired
	private MemberService memberService;
	
	
	//進入修改會員(需驗證)
	@GetMapping("/lock/MemberEdit")
	public String toMemberEdit(HttpServletRequest request, Model m) {
		Integer memberid = (Integer)(request.getSession().getAttribute("memberid"));
		Member member = memberService.findById(memberid);
		m.addAttribute("member", member);
		return "Member/MemberEdit";
	}
	
	
	//更新會員資料
	@PostMapping("/UpdateMemberEdit")
	public String updateMemberEdit(@RequestParam(name = "memberid") Integer memberid, 
								   @RequestParam(name = "image") String photo,
								   HttpServletRequest request, Model m) {
		
		String photoChar = photo.substring(photo.indexOf(",") + 1);
		Member member = memberService.findById(memberid);
		byte[] imageData1= member.getPhoto();
		member.setPhoto(imageData1);
		
		if (!photo.isEmpty()) {		
			byte[] imageData = Base64.getDecoder().decode(photoChar);
			member.setPhoto(imageData);
		}
			
		member.setFullname(request.getParameter("fullname"));
		member.setGender(request.getParameter("gender"));
		member.setBirthday(request.getParameter("birthday"));
		member.setMobile(request.getParameter("mobile"));
			
		memberService.save(member);

		m.addAttribute("member", member);
			
		return "Member/MemberCenter";
	}
}
