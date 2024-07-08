package com.kh.pjtMungHub.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.pjtMungHub.board.model.vo.Board;
import com.kh.pjtMungHub.board.model.vo.Category;
import com.kh.pjtMungHub.board.model.vo.ParameterVo;
import com.kh.pjtMungHub.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	public int listCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub

		return sqlSession.selectOne("boardMapper.listCount");
	}

	public int listCount(SqlSessionTemplate sqlSession, int category) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.listCount", category);
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String sort) {
		// TODO Auto-generated method stub

		// 페이징 처리를 위한 RowBounds 객체 생성
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		ParameterVo params = new ParameterVo();
		
		params.setLimit(limit);
		params.setOffset(offset);
		params.setSort(sort);

		return (ArrayList)sqlSession.selectList("boardMapper.selectList", params, rowBounds);
		
		
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String sort, int category) {
		// TODO Auto-generated method stub

		// 페이징 처리를 위한 RowBounds 객체 생성

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		ParameterVo params = new ParameterVo();

		params.setLimit(limit);
		params.setOffset(offset);
		params.setCategory(category);
		params.setSort(sort);

		return (ArrayList) sqlSession.selectList("boardMapper.selectList", params, rowBounds);
	}

	public ArrayList<Category> selectCategory(SqlSessionTemplate sqlSession) {

		return (ArrayList) sqlSession.selectList("boardMapper.selectCategory");
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
