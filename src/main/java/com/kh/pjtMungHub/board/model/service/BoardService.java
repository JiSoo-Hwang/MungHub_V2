package com.kh.pjtMungHub.board.model.service;

import java.util.ArrayList;

import com.kh.pjtMungHub.board.model.vo.Board;
import com.kh.pjtMungHub.board.model.vo.Category;
import com.kh.pjtMungHub.common.model.vo.PageInfo;

public interface BoardService {
	
	//게시글 목록과 페이징처리까지
		//게시글 총 개수 조회
		int listCount();
		//해당 카테고리 총 개수 조회
		int listCount(String category);
		
		ArrayList<Category> selectCategory();
		
		//게시글 목록조회
		ArrayList<Board> selectList(PageInfo pi);
		ArrayList<Board> selectList(PageInfo pi, String sort);
		ArrayList<Board> selectList(PageInfo pi, String sort, String category);

		//조회수 증가
		int increaseCount(int boardNo);

		//게시물 상세보기
		Board selectBoard(int boardNo);

		//게시물 만들기
		int insertBoard(int BoardNo);

}
