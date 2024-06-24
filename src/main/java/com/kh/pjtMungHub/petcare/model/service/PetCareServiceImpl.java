package com.kh.pjtMungHub.petcare.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.petcare.model.dao.PetCareDao;
import com.kh.pjtMungHub.petcare.model.vo.AvailableTimes;
import com.kh.pjtMungHub.petcare.model.vo.House;
import com.kh.pjtMungHub.petcare.model.vo.HouseReservation;
import com.kh.pjtMungHub.petcare.model.vo.Payment;
import com.kh.pjtMungHub.petcare.model.vo.PetSitter;
import com.kh.pjtMungHub.petcare.model.vo.Price;
import com.kh.pjtMungHub.petcare.model.vo.Reservation;

@Service
public class PetCareServiceImpl implements PetCareService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PetCareDao petCareDao;
	
	//날짜,시간 지정시 펫시터 리스트형태로 불러오기
	@Override
	public ArrayList<PetSitter> selectSitter(AvailableTimes at) {
		return petCareDao.selectSitter(sqlSession,at);
	}
	
	//요금테이블에서 가격정보 가져오기
	@Override
	public Price priceTable(AvailableTimes at) {
		return petCareDao.priceTable(sqlSession,at);
	}

	//예약 정보 저장하기
	@Override
	public int enrollReservation(Reservation re) {
		return petCareDao.enrollReservation(sqlSession,re);
	}

	//펫시터 정보 가져오기
	@Override
	public PetSitter sitterInfo(Reservation re) {
		return petCareDao.sitterInfo(sqlSession,re);
	}
	
	//예약번호 가져오기
	@Override
	public String selectReservationId(Payment payment) {
		return petCareDao.selectReservationId(sqlSession,payment);
	}

	//결제정보 저장하기
	@Override
	public int insertPayment(Payment payment) {
		return petCareDao.insertPayment(sqlSession,payment);
	}

	//결제내역 보여주기
	@Override
	public Payment payDetail(Payment payment) {
		return petCareDao.payDetail(sqlSession,payment);
	}

	//장기돌봄 집리스트 조건부로 불러오기
	@Override
	public ArrayList<House> selectHouseList(HouseReservation houseRe) {
		return petCareDao.selectHouseList(sqlSession,houseRe);
	}

	


	
	

}
