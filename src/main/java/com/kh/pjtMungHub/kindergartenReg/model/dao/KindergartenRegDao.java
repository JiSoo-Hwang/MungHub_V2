package com.kh.pjtMungHub.kindergartenReg.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pjtMungHub.pet.model.vo.Pet;


@Repository
public class KindergartenRegDao {

	public Pet selectPet(SqlSessionTemplate sqlSession, int ownerNo) {
		
		Pet pet = sqlSession.selectOne("kindergartenMapper.selectPet",ownerNo);
		
		return pet;
	}

}
