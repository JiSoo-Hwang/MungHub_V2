package com.kh.pjtMungHub.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pjtMungHub.member.model.service.MemberService;
import com.kh.pjtMungHub.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("enter.me")
	public String enterLogin() {
		
		return "member/memberLoginForm";
	}
	@RequestMapping("enroll.me")
	public String enterEnroll() {
		
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("loginInfo.me")
	public String loginUpdate() {
		return "member/memberLoginUpdate";
	}
	
	@RequestMapping("myPage.me")
	public String enterMyPage() {
		return "member/memberMyPage";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {
		Member loginUser = service.loginMember(m);
		if(loginUser==null || !bcryptPasswordEncoder.matches(m.getPassword(),loginUser.getPassword())) {
			mv.addObject("errorMsg","로그인 실패");
			mv.setViewName("/");
		}else {
			mv.addObject("errorMsg",loginUser.getUserId()+"님 환영합니다.");
			session.setAttribute("loginUser", loginUser);
		}
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@RequestMapping("logout.me")
	public ModelAndView logoutMember(ModelAndView mv,HttpSession session) {
		mv.addObject("errorMsg", "이용해 주셔서 감사합니다.");
		session.removeAttribute("loginUser");
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("userNo.me")
	public int newUserNo() {
		int userNo = service.newUserNo();
		if(userNo>0) {
			return userNo;
		}else {
			return 0;
		}
	}
	
	@ResponseBody
	@GetMapping("checkId.me")
	public String checkId(Member m) {
		Member mem=service.checkId(m);
		if(mem!=null){
			return "NNNNN";						
		}else {
			return m.getUserId();
		}
	}
	
	@PostMapping("join.me")
	public String insertMember(Member m, Model model, HttpSession session) {
		String encPwd=bcryptPasswordEncoder.encode(m.getPassword());
		m.setPassword(encPwd);
		int result = service.insertMember(m);
		if(result>0) {
			session.setAttribute("errorMsg", "회원 가입이 완료되었습니다.");
		}else {
			model.addAttribute("errorMsg","회원 가입 실패");
		}
		return "redirect:/";
	}
	
	@PostMapping("searchId.me")
	public ModelAndView searchId(Member m, ModelAndView mv, HttpSession session) {
		Member result = service.searchId(m);
		if(result!=null) {
			mv.addObject("errorMsg", "조회하신 아이디는 "+result.getUserId()+" 입니다.");
			mv.setViewName("member/memberLoginUpdate");
		}else {
			mv.addObject("errorMsg","입력한 데이터를 다시 확인해 주세요.");
			mv.setViewName("member/memberLoginForm");
		}
		return mv;
	}
	
	@PostMapping("changePw.me")
	public ModelAndView changePw(Member m, ModelAndView mv, HttpSession session) {
		Member result=service.searchId(m);
		if(result==null||!result.getUserId().equals(m.getUserId())) {
			mv.addObject("errorMsg", "입력하신 정보를 다시 확인해 주세요.");
		}else {
			m.setPassword(bcryptPasswordEncoder.encode(m.getPassword()));
			
			int rnum=service.changePw(m);
			if(rnum>0) {
				mv.addObject("errorMsg", "비밀번호가 변경되었습니다. 다시 로그인해 주세요.");
			}else {
				System.out.println("통신오류");
			}
		}
		mv.setViewName("member/memberLoginForm");
		return mv;
	}
}
