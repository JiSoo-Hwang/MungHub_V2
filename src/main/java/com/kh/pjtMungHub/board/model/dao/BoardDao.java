package com.kh.pjtMungHub.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	
	public int listCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.listCount");
	}

}
