package com.kh.pjtMungHub.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.pjtMungHub.member.model.service.MemberService;
import com.kh.pjtMungHub.member.model.vo.Member;

@Controller
public class MemberController {
	
	private MemberService service;

	@RequestMapping("login.me")
	public String loginMember(Member m) {
		if(service.loginMember(m)!=null) {
			
		}
		return "";
	}
}
