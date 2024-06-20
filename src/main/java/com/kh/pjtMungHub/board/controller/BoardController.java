package com.kh.pjtMungHub.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.pjtMungHub.board.model.service.BoardService;
import com.kh.pjtMungHub.board.model.vo.Board;
import com.kh.pjtMungHub.common.model.vo.PageInfo;
import com.kh.pjtMungHub.common.template.Pagination;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	//목록페이지로 이동 메소드
	@GetMapping("/list.bo")
	public String boardList(@RequestParam(value="currentPage",defaultValue = "1")
	                        int currentPage,
	                        Model model) {
		
		int listCount = boardService.listCount();
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		//게시글 목록 조회해보기
		ArrayList<Board> list =boardService.selectList(pi);
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		
		
		return "board/boardListView";
	}
	
	
		
		
		
	
	

}
