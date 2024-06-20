package com.kh.pjtMungHub.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.pjtMungHub.board.model.dao.BoardDao;
import com.kh.pjtMungHub.board.model.vo.Board;
import com.kh.pjtMungHub.common.model.vo.PageInfo;

public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao boardDao;

	@Override
	public int listCount() {
		// TODO Auto-generated method stub
		return boardDao.listCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return boardDao.selectList(sqlSession,pi);
	}
	

	

	

}
