package com.kh.pjtMungHub.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pjtMungHub.board.model.vo.Board;
import com.kh.pjtMungHub.common.model.vo.PageInfo;

@Repository
public class BoardDao {
	
	public int listCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.listCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		
		int limit =pi.getBoardLimit();
		int offset =(pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList",null,rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.increaseCount",boardNo);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectBoard",boardNo);
	}

}
