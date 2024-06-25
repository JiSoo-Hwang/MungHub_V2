package com.kh.pjtMungHub.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pjtMungHub.board.model.service.BoardService;
import com.kh.pjtMungHub.board.model.vo.Board;
import com.kh.pjtMungHub.common.model.vo.PageInfo;
import com.kh.pjtMungHub.common.template.Pagination;




@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	//목록페이지로 이동 메소드
	@GetMapping("list.bo")
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
	
	@GetMapping("detail.bo")
	public ModelAndView selectBoard(int boardNo,
									ModelAndView mv) {
		//조회수 증가시키기
		int result = boardService.increaseCount(boardNo);
		
		//조회수가 제대로 증가되었다면 상세조회 
		if(result>0) {
			Board b = boardService.selectBoard(boardNo);
			mv.addObject("b",b).setViewName("board/boardDetailView");
		}else {
			mv.addObject("errorMsg","상세조회 실패!");
		}
		
		return mv;
		
	}
	
	//게시물 작성 페이지로 이동하는 메소드
	@GetMapping("insert.bo")
	public String boardEnrollForm() {
		
		return "board/EnrollForm";
		
	}
	//게시물 등록 메소드
	/*@PostMapping
	public String insertBoard(Board b,
							  MultipartFile upfile,
							  HttpSession session) {
		
		
		int result = boardService.insertBoard(b);
		
		if(result>0) {//게시글 작성 성공
			session.setAttribute("alertMsg", "게시글 작성 성공!");
		}else { //게시글 작성 실패
			session.setAttribute("alertMsg", "게시글 작성 실패!");
		}

		
		
		return "redirect/:list.bo";
	}*/
	
	
		
		
		
	
	

}
