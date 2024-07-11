package com.kh.pjtMungHub.board.model.service;

import java.util.ArrayList;

import com.kh.pjtMungHub.board.model.vo.Board;
import com.kh.pjtMungHub.board.model.vo.Category;
import com.kh.pjtMungHub.board.model.vo.Reply;
import com.kh.pjtMungHub.common.model.vo.PageInfo;

public interface BoardService {
	
	//게시글 목록과 페이징처리까지
		//게시글 총 개수 조회
		int listCount();
		//해당 카테고리 게시물 총 개수 조회
		int listCount(int category);
		
		//게시글 목록 조회
		ArrayList<Board> selectList(PageInfo pi, String sort);
		
		//가지고있는 카테고리 개수 조회
		ArrayList<Category> selectCategory();
		
		
		ArrayList<Board> selectList(PageInfo pi, String sort, int category);
		
		//조회수 증가
		int increaseCount(int boardNo);

		//게시물 상세보기
		Board selectBoard(int boardNo);

		//게시물 만들기
		int insertBoard(Board b);
		
		//댓글 목록 조회
		ArrayList<Reply> replyList(int boardNo);
		//댓글 입력 
		int insertReply(Reply r);


}
