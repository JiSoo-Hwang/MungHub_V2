package com.kh.pjtMungHub.petcare.model.service;

import java.util.ArrayList;

import com.kh.pjtMungHub.common.model.vo.PageInfo;
import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.petcare.model.vo.AvailableTimes;
import com.kh.pjtMungHub.petcare.model.vo.House;
import com.kh.pjtMungHub.petcare.model.vo.HousePrice;
import com.kh.pjtMungHub.petcare.model.vo.HouseReservation;
import com.kh.pjtMungHub.petcare.model.vo.Payment;
import com.kh.pjtMungHub.petcare.model.vo.PetSitter;
import com.kh.pjtMungHub.petcare.model.vo.Price;
import com.kh.pjtMungHub.petcare.model.vo.Reservation;

public interface PetCareService {
	
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
	
	//장기돌봄 집리스트 조건부로 불러오기
	ArrayList<House> selectHouseList(HouseReservation houseRe,PageInfo pi);
	
	//페이징바처리에 필요한 집 리스트 갯수
	int listCount();
	
	//집 상세정보
	House detailHouse(int houseNo);
	
	//집 요금정보
	ArrayList<HousePrice> selectHousePrice();
	

}
