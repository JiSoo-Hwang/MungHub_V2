package com.kh.pjtMungHub.kindergartenMap.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pjtMungHub.kindergartenMap.model.dao.MapDao;
import com.kh.pjtMungHub.kindergartenMap.model.vo.Kindergarten;
import com.kh.pjtMungHub.kindergartenMap.model.vo.Registration;
import com.kh.pjtMungHub.pet.model.vo.Pet;

@Service
public class MapServiceImpl implements MapService{
	
	@Autowired
	private MapDao mapDao;
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public ArrayList<Kindergarten> selectMap() {
		
		ArrayList<Kindergarten> mapList = mapDao.selectMap(sqlsession);
		
		return mapList;
	}

	//해당 회원의 반려동물 정보 조회 메서드
	@Override
	public Pet selectPet(int ownerNo) {
		Pet pet = mapDao.selectPet(sqlsession,ownerNo);
		return pet;
	}

	@Override
	public Kindergarten selectKindergarten(int kindNo) {
		Kindergarten kindergarten = mapDao.selectKindergarten(sqlsession, kindNo);
		return kindergarten;
	}

	//상담신청등록메소드
	@Override
	public int insertReg(Registration reg) {
		int result = mapDao.insertReg(sqlsession,reg);
		return result;
	}

	//상담신청리스트조회메소드
	@Override
	public ArrayList<Registration> selectRegList(int userNo) {
		
		return mapDao.selectRegList(sqlsession,userNo);
	}
	


}
