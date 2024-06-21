package com.kh.pjtMungHub.petcare.model.service;

import java.util.ArrayList;

import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.petcare.model.vo.AvailableTimes;
import com.kh.pjtMungHub.petcare.model.vo.Payment;
import com.kh.pjtMungHub.petcare.model.vo.PetSitter;
import com.kh.pjtMungHub.petcare.model.vo.Price;
import com.kh.pjtMungHub.petcare.model.vo.Reservation;

public interface PetCareService {
	
	//가상의 로그인유저
	Member selectMember();
	
	//날짜,시간 지정시 펫시터 리스트형태로 불러오기
	ArrayList<PetSitter> selectSitter(AvailableTimes at);
	
	//요금테이블에서 가격정보 가져오기
	Price priceTable(AvailableTimes at);
	
	//예약 정보 저장하기
	int enrollReservation(Reservation re);
	
	//펫시터 정보 가져오기
	PetSitter sitterInfo(Reservation re);
	
	//예약번호 가져오기
	String selectReservationId(Payment payment);
	
	//결제정보 저장하기
	int insertPayment(Payment payment);
	
	//결제내역 보여주기
	Payment payDetail(Payment payment);
	
	

}
