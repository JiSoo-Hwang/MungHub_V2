package com.kh.pjtMungHub.petcare.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.petcare.model.vo.AvailableTimes;
import com.kh.pjtMungHub.petcare.model.vo.Payment;
import com.kh.pjtMungHub.petcare.model.vo.PetSitter;
import com.kh.pjtMungHub.petcare.model.vo.Price;
import com.kh.pjtMungHub.petcare.model.vo.Reservation;

@Repository
public class PetCareDao {
	
	//가상의 로그인유저
	public Member selectMember(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("petcareMapper.selectMember");
	}

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

	//펫시터 정보 가져오기
	public PetSitter sitterInfo(SqlSessionTemplate sqlSession, Reservation re) {
		return sqlSession.selectOne("petcareMapper.sitterInfo",re);
	}
	
	//예약번호 가져오기
	public String selectReservationId(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.selectOne("petcareMapper.selectReservationId",payment);
	}

	//결제정보 저장하기
	public int insertPayment(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.insert("petcareMapper.insertPayment",payment);
	}

	//결제내역 보여주기
	public Payment payDetail(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.selectOne("petcareMapper.payDetail",payment);
	}

	

	

	

}
