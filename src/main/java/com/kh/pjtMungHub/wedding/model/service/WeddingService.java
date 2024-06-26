package com.kh.pjtMungHub.wedding.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.pjtMungHub.kindergarten.model.vo.Vaccine;
import com.kh.pjtMungHub.pet.model.vo.Breed;
import com.kh.pjtMungHub.pet.model.vo.Pet;
import com.kh.pjtMungHub.wedding.model.vo.Wedding;

public interface WeddingService {

	//견종조회 메서드
	ArrayList<Breed> selectBreeds();

	//웨딩신청 조회 메서드
	ArrayList<Wedding> selectWeddings();

	//웨딩신청 상세조회 메서드
	Wedding selectWedding(int weddingNo);

	//회원 보유 반려견 조회해서 웨딩 신청
	Pet selectPet(int userNo);

	//신규 웨딩플랜 신청 추가 메서드
	int insertWedding(Wedding w, ArrayList<Vaccine> vacList);

	//웨딩플랜 신청 내역 조회 메서드
	ArrayList<Wedding> selectRegList();


}
