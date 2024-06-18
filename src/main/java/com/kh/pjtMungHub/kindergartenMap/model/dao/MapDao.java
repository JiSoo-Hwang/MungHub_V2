package com.kh.pjtMungHub.kindergartenMap.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pjtMungHub.kindergartenMap.model.vo.MapVO;

@Repository
public class MapDao {

	public ArrayList<MapVO> selectMap(SqlSessionTemplate sqlsession) {
		
		ArrayList<MapVO> mapList = (ArrayList)sqlsession.selectList("kindergartenMapper.selectMap");
		
		return mapList;
	}

	
	
}
