package com.kh.pjtMungHub.petcare.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pjtMungHub.petcare.model.vo.AvailableTimes;
import com.kh.pjtMungHub.petcare.model.vo.PetSitter;

@Repository
public class PetCareDao {

	//날짜,시간 지정시 펫시터 리스트형태로 불러오기
	public ArrayList<PetSitter> selectSitter(SqlSessionTemplate sqlSession, AvailableTimes at) {
		return (ArrayList)sqlSession.selectList("petcareMapper.selectSitter");
	}

}
