package com.kh.pjtMungHub.kindergarten.model.service;

import java.util.ArrayList;

import com.kh.pjtMungHub.kindergarten.model.vo.Kindergarten;
import com.kh.pjtMungHub.kindergarten.model.vo.Registration;
import com.kh.pjtMungHub.pet.model.vo.Pet;



public interface KindergartenService {

	public ArrayList<Kindergarten> selectMap();
	public Pet selectPet(int ownerNo);
	public Kindergarten selectKindergarten(int kindNo);
	public int insertReg(Registration reg);
	//유치원등록상담목록 조회 메서드
	public ArrayList<Registration> selectRegList(int userNo);
	public ArrayList<Registration> selectRegList2(int userNo);
	public Registration selectRegistration(int reservNo);
	//상담철회 메서드
	public int deleteReg(int reservNo);
	//상담신청수정 메서드
	public int updateReg(Registration reg);
}
