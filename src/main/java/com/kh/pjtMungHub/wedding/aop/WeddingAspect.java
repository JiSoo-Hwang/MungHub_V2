package com.kh.pjtMungHub.wedding.aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.pjtMungHub.member.model.service.MemberService;
import com.kh.pjtMungHub.member.model.vo.Member;

@Aspect
@Component
public class WeddingAspect {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HttpSession session;
	
	@Before("execution(* com.kh.pjtMungHub.wedding.controller.WeddingController.weddingList(..))")
	public void checkAccess()throws Exception {
		Member m = (Member)session.getAttribute("loginUser");
		if(m!=null) {
			int userNo = m.getUserNo();
			if(memberService.isUserRestricted(userNo)) {
				throw new AccessRestrictedException("이미 수락된 만남을 취소하여 취소한 날로부터 14일간 해당 페이지 접근이 제한되었습니다.");
			}
			
		}else {
			throw new AccessRestrictedException("로그인이 필요합니다.");
		}
	}
	
}
