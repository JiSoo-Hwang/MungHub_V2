package com.kh.pjtMungHub.kindergartenMap.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pjtMungHub.kindergartenMap.model.vo.Kindergarten;
import com.kh.pjtMungHub.kindergartenMap.model.vo.Registration;
import com.kh.pjtMungHub.pet.model.vo.Pet;

@Repository
public class MapDao {

	public ArrayList<Kindergarten> selectMap(SqlSessionTemplate sqlsession) {
		
		
		return (ArrayList)sqlsession.selectList("kindergartenMapper.selectMap");
	}

	public Kindergarten selectKindergarten(SqlSessionTemplate sqlsession, int kindNo) {
		
		
		return sqlsession.selectOne("kindergartenMapper.selectKindergarten",kindNo);
	}

	//해당 회원의 반려동물 정보 조회 메서드
	public Pet selectPet(SqlSessionTemplate sqlSession,int ownerNo) {

		
		return sqlSession.selectOne("kindergartenMapper.selectPet",ownerNo);
	}
	
	//상담신청등록 메소드
	public int insertReg(SqlSessionTemplate sqlsession, Registration reg) {
		
		return sqlsession.insert("kindergartenMapper.insertReg",reg);
	}

	//상담신청목록 조회 메소드
	public ArrayList<Registration> selectRegList(SqlSessionTemplate sqlsession, int userNo) {
		
		return (ArrayList)sqlsession.selectList("kindergartenMapper.selectRegList",userNo);
	}

	//상담신청내역 상세 조회 메소드 
	public Registration selectRegistration(SqlSessionTemplate sqlsession, int reservNo) {

		return sqlsession.selectOne("kindergartenMapper.selectRegistration",reservNo);
	}

	public int deleteReg(SqlSessionTemplate sqlsession, int reservNo) {
		
		return sqlsession.delete("kindergartenMapper.deleteRegistration",reservNo);
	}


	
	
}
