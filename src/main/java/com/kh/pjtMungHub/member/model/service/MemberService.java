package com.kh.pjtMungHub.member.model.service;

import com.kh.pjtMungHub.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);
	Member searchId(Member m);
	int changePw(Member m);
	int insertMember(Member m);
	Member checkId(Member m);
	int newUserNo();
	boolean isUserRestricted(int userNo);
	int restrictUser(int userNo,int days);
}
