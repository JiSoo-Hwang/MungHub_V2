package com.kh.pjtMungHub.petcare.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pjtMungHub.petcare.model.vo.AvailableTimes;
import com.kh.pjtMungHub.petcare.model.vo.PetSitter;
import com.kh.pjtMungHub.petcare.model.vo.Price;
import com.kh.pjtMungHub.petcare.model.vo.Reservation;

@Repository
public class PetCareDao {

	//날짜,시간 지정시 펫시터 리스트형태로 불러오기
	public ArrayList<PetSitter> selectSitter(SqlSessionTemplate sqlSession, AvailableTimes at) {
		return (ArrayList)sqlSession.selectList("petcareMapper.selectSitter");
	}
	
	//요금테이블에서 가격정보 가져오기
	public Price priceTable(SqlSessionTemplate sqlSession, AvailableTimes at) {
		return sqlSession.selectOne("petcareMapper.priceTable",at);
	}

	//예약정보 저장하기
	public int enrollReservation(SqlSessionTemplate sqlSession, Reservation re) {
		return sqlSession.insert("petcareMapper.enrollReservation",re);
	}

	

}
