package com.kh.pjtMungHub.kindergartenReg.model.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pjtMungHub.kindergartenReg.model.dao.KindergartenRegDao;
import com.kh.pjtMungHub.pet.model.vo.Pet;

@Service
public class KindergartenRegServiceImpl implements KindergartenRegService{

	@Autowired
	private KindergartenRegDao regDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//신청 페이지에 해당 회원 반려 동물 불러오기
	@Override
	public Pet selectPet(int ownerNo) {
		
		Pet pet = regDao.selectPet(sqlSession, ownerNo);
				
		return pet;
	}

}
