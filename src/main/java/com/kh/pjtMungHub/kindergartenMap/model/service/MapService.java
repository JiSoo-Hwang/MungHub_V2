package com.kh.pjtMungHub.kindergartenMap.model.service;

import java.util.ArrayList;

import com.kh.pjtMungHub.kindergartenMap.model.vo.MapVO;
import com.kh.pjtMungHub.kindergartenMap.model.vo.Registration;
import com.kh.pjtMungHub.pet.model.vo.Pet;



public interface MapService {

	public ArrayList<MapVO> selectMap();
	public Pet selectPet(String ownerNo);
	public MapVO selectKindergarten(int kindNo);
	public int insertReg(Registration reg);
	//유치원등록상담목록 조회 메서드
	public ArrayList<Registration> selectRegList(String userNo);
}
