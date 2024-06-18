package com.kh.pjtMungHub.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pjtMungHub.member.model.service.MemberService;
import com.kh.pjtMungHub.member.model.vo.Member;

@Controller
public class MemberController {
	
	private MemberService service;
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {
		
		Member loginUser = service.loginMember(m);
		if(loginUser==null || !bcryptPasswordEncoder.matches(m.getUserPwd(),loginUser.getUserPwd())) {
			mv.addObject("errorMsg","로그인 실패");
		}else {
			mv.addObject("loginUser",loginUser);
		}
		mv.setViewName("redirect:/");
		return mv;
	}
	@RequestMapping("insert.me")
	public void insertMember(Member m) {
		
	}
}
