package com.kh.pjtMungHub.wedding.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pjtMungHub.kindergarten.model.vo.Vaccine;
import com.kh.pjtMungHub.pet.model.vo.Breed;
import com.kh.pjtMungHub.pet.model.vo.Pet;
import com.kh.pjtMungHub.wedding.model.dao.WeddingDao;
import com.kh.pjtMungHub.wedding.model.vo.Wedding;

@Service
public class WeddingServiceImpl implements WeddingService{

	@Autowired
	private WeddingDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//견종조회 메서드
	@Override
	public ArrayList<Breed> selectBreeds() {
		return dao.selectBreeds(sqlSession);
	}

	//웨딩신청 조회 메서드
	@Override
	public ArrayList<Wedding> selectWeddings() {
		
		return dao.selectWeddings(sqlSession);
	}

	//웨딩 정보 상세 조회 메서드
	@Override
	public Wedding selectWedding(int weddingNo) {
		return dao.selectWedding(sqlSession, weddingNo);
	}
	
	//회원 보유 반려견 조회해서 웨딩 신청
	@Override
	public Pet selectPet(int userNo) {
		return dao.selectPet(sqlSession,userNo);
	}
	
	//신규 웨딩플랜 신청 추가 메서드
	@Override
	public int insertWedding(Wedding w, ArrayList<Vaccine> vacList) {
		return dao.insertWedding(sqlSession,w,vacList);
	}
	
	//웨딩플랜 신청 내역 조회 메서드
	@Override
	public ArrayList<Wedding> selectRegList() {
		return dao.selectRegList(sqlSession);
	}

	//웨딩플랜 신청 거절 메서드
	@Override
	public int rejectReg(Wedding w) {
		return dao.rejectReg(sqlSession,w);
	}

	//웨딩플랜 신청 승인 메서드
	@Override
	public int approveReg(int weddingNo) {
	
		return dao.approveReg(sqlSession,weddingNo);
	}

	//신청한 만남 조회해오는 메서드
	@Override
	public int countAppliedList(int userNo) {
		return dao.countAppliedList(sqlSession,userNo);
	}


	//만남 신청 조회 메서드
	@Override
	public ArrayList<Wedding> selectAppliedList(Wedding w) {
		return dao.selectAppliedList(sqlSession,w);
	}

	//만남 신청 메서드
	@Override
	public int applyMatching(Wedding w, ArrayList<Vaccine> vacList) {
		return dao.applyMatching(sqlSession, w,vacList);
	}

	//만남 신청 수락 메서드
	@Override
	public int acceptWedding(int weddingNo) {
		return dao.acceptWedding(sqlSession,weddingNo);
	}

	//견종별 리스트 추출 메서드
	@Override
	public ArrayList<Wedding> selectByBreed(String breedId) {
		return dao.selectByBreed(sqlSession,breedId);
	}

}
