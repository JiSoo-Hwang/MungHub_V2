package com.kh.pjtMungHub.kindergartenMap.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pjtMungHub.kindergartenMap.model.dao.MapDao;
import com.kh.pjtMungHub.kindergartenMap.model.vo.MapVO;

@Service
public class MapServiceImpl implements MapService{
	
	@Autowired
	private MapDao mapDao;
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public ArrayList<MapVO> selectMap() {
		
		ArrayList<MapVO> mapList = mapDao.selectMap(sqlsession);
		
		return mapList;
	}

}
