package com.kh.pjtMungHub.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pjtMungHub.common.model.vo.PetPhoto;
import com.kh.pjtMungHub.kindergarten.model.vo.Kindergarten;
import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.member.model.vo.Message;
import com.kh.pjtMungHub.pet.model.vo.Breed;
import com.kh.pjtMungHub.pet.model.vo.Pet;

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
	
	public int insertTeacher(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertTeacher", m);
	}
	
	public ArrayList<Pet> selectPetList(SqlSessionTemplate sqlSession, Member m){
		return (ArrayList)sqlSession.selectList("memberMapper.selectPetList",m);
	}

	public PetPhoto selectPetPhoto(SqlSessionTemplate sqlSession, Pet p) {
		return sqlSession.selectOne("memberMapper.selectPetPhoto", p);
	}

	public ArrayList<Kindergarten> selectKindList(SqlSessionTemplate sqlSession,Kindergarten kind) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectKindList",kind);
	}

	public ArrayList<Breed> selectBreedList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectBreedList");
	}

	public ArrayList<Message> selectMessageList(SqlSessionTemplate sqlSession, Member m, int i) {
		RowBounds rb = new RowBounds((i-1)*15,15);

		return (ArrayList)sqlSession.selectList("memberMapper.selectMessageList",m);
	}

	public int msgCount(SqlSessionTemplate sqlSession, Member m) {
		int result=sqlSession.selectOne("memberMapper.msgCount");
		return result;
	}

	public int getPhotoNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.getPhotoNo");
	}

	public int insertPetPhoto(SqlSessionTemplate sqlSession, PetPhoto petPhoto) {
		return sqlSession.insert("memberMapper.insertPetPhoto", petPhoto);
	}

	public int insertPet(SqlSessionTemplate sqlSession, Pet p) {
		return sqlSession.insert("memberMapper.insertPet", p);
	}

	public Pet selectPetByNo(SqlSessionTemplate sqlSession, Pet p) {
		return sqlSession.selectOne("memberMapper.selectPetByNo",p);
	}

	public int updatePet(SqlSessionTemplate sqlSession, Pet p) {
		return sqlSession.update("memberMapper.updatePet", p);
	}


}
