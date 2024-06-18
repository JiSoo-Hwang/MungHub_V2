package com.kh.pjtMungHub.petcare.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pjtMungHub.petcare.model.dao.PetCareDao;
import com.kh.pjtMungHub.petcare.model.vo.AvailableTimes;
import com.kh.pjtMungHub.petcare.model.vo.PetSitter;

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
	

}
