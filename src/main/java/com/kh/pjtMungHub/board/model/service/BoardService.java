package com.kh.pjtMungHub.board.model.service;

import java.util.ArrayList;

import com.kh.pjtMungHub.board.model.vo.Board;
import com.kh.pjtMungHub.common.model.vo.PageInfo;

public interface BoardService {
	
	//게시글 목록과 페이징처리까지
		//게시글 총 개수 조회
		int listCount();
		
		//게시글 목록조회
		ArrayList<Board> selectList(PageInfo pi);

		//조회수 증가
		int increaseCount(int boardNo);

		//게시물 상세보기
		Board selectBoard(int boardNo);

		int insertBoard(int BoardNo);

}
