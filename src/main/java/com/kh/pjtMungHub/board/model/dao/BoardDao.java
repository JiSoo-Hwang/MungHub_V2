package com.kh.pjtMungHub.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pjtMungHub.board.model.vo.Board;
import com.kh.pjtMungHub.board.model.vo.Category;
import com.kh.pjtMungHub.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	public int listCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub

		return sqlSession.selectOne("boardMapper.listCount");
	}

	public int listCount(SqlSessionTemplate sqlSession, String category) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.listCountByCategory", category);
	}
//////////////////////////////////////////////////////////////////////////////////////////
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String sort) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.selectList");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String category, String sort) {
		// TODO Auto-generated method stub
		
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectListByCategory");
	}
/////////////////////////////////////////////////////////////////////////////////
	public ArrayList<Category> selectCategory(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("boardMapper.selectCategory");
	}

	public int eventCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.eventCount");
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.increaseCount", boardNo);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertBoard", boardNo);
	}

}
