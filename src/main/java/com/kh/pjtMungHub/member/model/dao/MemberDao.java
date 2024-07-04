package com.kh.pjtMungHub.member.model.dao;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pjtMungHub.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.loginMember",m);
	}
	
	public Member searchId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.searchId",m);
	}
	public int changePw(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.changePw",m);
	}

	public Member checkId(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.checkId",m);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int newUserNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.newUserNo");
	}
	
	public boolean isUserRestricted(SqlSessionTemplate sqlSession,int userNo) {
		return sqlSession.selectOne("memberMapper.isUserRestricted",userNo);
	}

	public int restrictUser(SqlSessionTemplate sqlSession, int userNo, int days) {
		Map<String,Object>params = new HashMap<String, Object>();
		params.put("userNo", userNo);
		params.put("days",days);
		return sqlSession.update("memberMapper.restrictUser",params);
	}

	public LocalDateTime getRestrictedUntil(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.getRestrictedUntil",userNo);
	}

	
}
