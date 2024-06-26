package com.kh.pjtMungHub.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pjtMungHub.common.model.vo.PetPhoto;
import com.kh.pjtMungHub.kindergarten.model.vo.Kindergarten;
import com.kh.pjtMungHub.member.model.dao.MemberDao;
import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.member.model.vo.Message;
import com.kh.pjtMungHub.pet.model.vo.Breed;
import com.kh.pjtMungHub.pet.model.vo.Pet;

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
	public int insertTeacher(Member m) {
		return dao.insertTeacher(sqlSession,m);
	}

	@Override
	public ArrayList<Pet> selectPetList(Member m) {
		return dao.selectPetList(sqlSession, m);
	}

	@Override
	public PetPhoto selectPetPhoto(Pet p) {
		return dao.selectPetPhoto(sqlSession,p);
	}

	@Override
	public ArrayList<Kindergarten> selectKindList(Kindergarten kind) {
		return dao.selectKindList(sqlSession, kind);
	}

	@Override
	public ArrayList<Breed> selectBreedList() {
		return dao.selectBreedList(sqlSession);
	}
	
	@Override
	public ArrayList<Message> selectMessageList(Member m, int i) {
		return dao.selectMessageList(sqlSession,m,i);
	}

	@Override
	public int msgCount(Member m) {
		return dao.msgCount(sqlSession,m);
	}

	@Override
	public int getPhotoNo() {
		return dao.getPhotoNo(sqlSession);
	}

	@Override
	public int insertPetPhoto(PetPhoto petPhoto) {
		return dao.insertPetPhoto(sqlSession,petPhoto);
	}

	@Override
	public int insertPet(Pet p) {
		return dao.insertPet(sqlSession,p);
	}

	@Override
	public Pet selectPetByNo(Pet p) {
		return dao.selectPetByNo(sqlSession,p);
	}

	@Override
	public int updatePet(Pet p) {
		return dao.updatePet(sqlSession,p);
	}


}
