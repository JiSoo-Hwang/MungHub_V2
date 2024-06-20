package com.kh.pjtMungHub.kindergartenMap.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pjtMungHub.kindergartenMap.model.vo.MapVO;
import com.kh.pjtMungHub.pet.model.vo.Pet;

@Repository
public class MapDao {

	public ArrayList<MapVO> selectMap(SqlSessionTemplate sqlsession) {
		
		ArrayList<MapVO> mapList = (ArrayList)sqlsession.selectList("kindergartenMapper.selectMap");
		
		return mapList;
	}

	public MapVO selectKindergarten(SqlSessionTemplate sqlsession, int kindNo) {
		
		MapVO kindergarten = sqlsession.selectOne("kindergartenMapper.selectKindergarten",kindNo);
		
		return kindergarten;
	}

	//해당 회원의 반려동물 정보 조회 메서드
	public Pet selectPet(SqlSessionTemplate sqlSession,int ownerNo) {

		Pet pet = sqlSession.selectOne("kindergartenMapper.selectPet",ownerNo);
		
		return pet;
	}

	
	
}
