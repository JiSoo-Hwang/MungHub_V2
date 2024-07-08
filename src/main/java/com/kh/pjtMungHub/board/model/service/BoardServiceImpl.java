package com.kh.pjtMungHub.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pjtMungHub.board.model.dao.BoardDao;
import com.kh.pjtMungHub.board.model.vo.Board;
import com.kh.pjtMungHub.board.model.vo.Category;
import com.kh.pjtMungHub.common.model.vo.PageInfo;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao boardDao;

	//게시물 총 개수 조회
	@Override
	public int listCount() {
		// TODO Auto-generated method stub
		return boardDao.listCount(sqlSession);
	}
	//해당 카테고리 게시물 조회
	@Override
	public int listCount(int category) {
		// TODO Auto-generated method stub
		return boardDao.listCount(sqlSession,category);
	}
	//카테고리 선택
	@Override
	public ArrayList<Category> selectCategory() {
		// TODO Auto-generated method stub
		return boardDao.selectCategory(sqlSession);
	}
	
	 @Override
	 public ArrayList<Board> selectList(PageInfo pi, String sort) {
		 // TODO Auto-generated method stub
	     return boardDao.selectList(sqlSession, pi, sort);
	 }
	@Override
	public ArrayList<Board> selectList(PageInfo pi, String sort, int category) {
		// TODO Auto-generated method stub
		return boardDao.selectList(sqlSession,pi,sort,category);
	}
	@Override
	public int eventCount() {
		// TODO Auto-generated method stub
		return boardDao.eventCount(sqlSession);
	}

	@Override
	public int increaseCount(int boardNo) {
		// TODO Auto-generated method stub
		
		return boardDao.increaseCount(sqlSession,boardNo);
	}

	@Override
	public Board selectBoard(int boardNo) {
		// TODO Auto-generated method stub
		
		return boardDao.selectBoard(sqlSession,boardNo);
	}

	@Override
	public int insertBoard(int boardNo) {
		// TODO Auto-generated method stub
		return boardDao.insertBoard(sqlSession,boardNo);
	}

	

	

	

}