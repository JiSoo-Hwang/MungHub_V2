package com.kh.pjtMungHub.member.model.service;

import com.kh.pjtMungHub.member.model.vo.Member;

public interface MemberService {

	public Member loginMember(Member m);
	public Member searchId(Member m);
	public int changePw(Member m);
	
}
