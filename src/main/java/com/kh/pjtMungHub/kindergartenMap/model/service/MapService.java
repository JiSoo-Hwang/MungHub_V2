package com.kh.pjtMungHub.kindergartenMap.model.service;

import java.util.ArrayList;

import com.kh.pjtMungHub.kindergartenMap.model.vo.Kindergarten;
import com.kh.pjtMungHub.kindergartenMap.model.vo.Registration;
import com.kh.pjtMungHub.pet.model.vo.Pet;



public interface MapService {

	public ArrayList<Kindergarten> selectMap();
	public Pet selectPet(int ownerNo);
	public Kindergarten selectKindergarten(int kindNo);
	public int insertReg(Registration reg);
	//유치원등록상담목록 조회 메서드
	public ArrayList<Registration> selectRegList(int userNo);
	public Registration selectRegistration(int reservNo);
	//상담철회 메서드
	public int deleteReg(int reservNo);
}
