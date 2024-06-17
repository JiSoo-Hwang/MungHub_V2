package com.kh.pjtMungHub.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.pjtMungHub.member.model.dao.MemberDao;
import com.kh.pjtMungHub.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	private MemberDao dao;
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
		return dao.changePw(sqlSession, m);
	}

}
