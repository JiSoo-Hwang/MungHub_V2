package com.kh.pjtMungHub.petcare.model.service;

import java.util.ArrayList;

import com.kh.pjtMungHub.petcare.model.vo.AvailableTimes;
import com.kh.pjtMungHub.petcare.model.vo.PetSitter;

public interface PetCareService {
	
	//날짜,시간 지정시 펫시터 리스트형태로 불러오기
	ArrayList<PetSitter> selectSitter(AvailableTimes at);

}
