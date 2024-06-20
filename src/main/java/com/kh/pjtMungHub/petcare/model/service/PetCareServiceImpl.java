package com.kh.pjtMungHub.petcare.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pjtMungHub.petcare.model.dao.PetCareDao;
import com.kh.pjtMungHub.petcare.model.vo.AvailableTimes;
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

	
	

}
