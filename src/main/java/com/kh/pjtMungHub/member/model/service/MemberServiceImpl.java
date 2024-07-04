package com.kh.pjtMungHub.member.model.service;

import java.time.LocalDateTime;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pjtMungHub.member.model.dao.MemberDao;
import com.kh.pjtMungHub.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginMember(Member m) {
		return dao.loginMember(sqlSession,m);
	}

	@Override
	public Member searchId(Member m) {
		return dao.searchId(sqlSession,m);
	}

	@Override
	public int changePw(Member m) {
		return dao.changePw(sqlSession,m);
	}

	@Override
	public Member checkId(Member m) {
		return dao.checkId(sqlSession,m);
	}
	
	@Override
	public int insertMember(Member m) {
		return dao.insertMember(sqlSession,m);
	}

	@Override
	public int newUserNo() {
		return dao.newUserNo(sqlSession);
	}
	
	@Override
	public boolean isUserRestricted(int userNo) {
		return dao.isUserRestricted(sqlSession,userNo);
	}

	@Override
	public int restrictUser(int userNo, int days) {
		return dao.restrictUser(sqlSession,userNo,days);
		
	}

	@Override
	public LocalDateTime getRestrictedUntil(int userNo) {
		return dao.getRestrictedUntil(sqlSession,userNo);
	}



}
