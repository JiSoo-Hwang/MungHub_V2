package com.kh.pjtMungHub.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pjtMungHub.board.model.service.BoardService;
import com.kh.pjtMungHub.board.model.vo.Board;
import com.kh.pjtMungHub.board.model.vo.*;
import com.kh.pjtMungHub.common.model.vo.PageInfo;
import com.kh.pjtMungHub.common.template.Pagination;




@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	// 목록 페이지로 이동 메소드
	@GetMapping("list.bo")
	public String boardList(Model model,
	                        @RequestParam(value="currentPage", defaultValue="1") int currentPage,
	                        @RequestParam(value="category", defaultValue="0") int category,
	                        @RequestParam(value="sort", defaultValue="latest") String sort) {

	    // 전체 게시글 수 조회
	    int listCount = boardService.listCount();
	    
	    int pageLimit = 10;
	    int boardLimit = 20;
	    
	    // 페이지 정보 객체 생성
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	   
	    // 게시글 목록 조회
	    ArrayList<Board> List = boardService.selectList(pi,sort);
	    
	    if (category==0) {
	        listCount = boardService.listCount();
	    } else {
	        listCount = boardService.listCount(category);
	    }
	    
	    
	    // 카테고리 목록 조회
	    ArrayList<Category> ctList = boardService.selectCategory();

	    
	    if (category==0) {
	    	List = boardService.selectList(pi, sort);
	    } else {
	    	List = boardService.selectList(pi, sort,category);
	    }
	    
	    System.out.println(sort);
	    System.out.println(ctList);
	    System.out.println(List);
	    
	    // 모델에 데이터 추가
	    model.addAttribute("pi", pi);
	    model.addAttribute("sort", sort);
	    model.addAttribute("category", category);
	    model.addAttribute("ctList",ctList);
	    model.addAttribute("List",List);

	    
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
			mv.addObject("b",b).setViewName("board/detailBoardView");
		}else {
			mv.addObject("errorMsg","상세조회 실패!");
		}
		
		return mv;
		
	}
	
	//게시물 작성 페이지로 이동하는 메소드
	@GetMapping("insert.bo")
	public String boardEnrollForm() {
		
		return "board/insertBoardView";
		
	}
	/*
	//게시물 등록 메소드
	@PostMapping("insert.bo")
	public String insertBoard(ModelAndView mv) {
		
		ArrayList<Category> ctList = boardService.selectCategory();	
		
		mv.addObject("ctList",ctList);
		
		
		
		int result = boardService.insertBoard(b);
		
		if(result>0) {//게시글 작성 성공
			session.setAttribute("alertMsg", "게시글 작성 성공!");
		}else { //게시글 작성 실패
			session.setAttribute("alertMsg", "게시글 작성 실패!");
		}

		
		
		return "redirect/:list.bo";
	}
	*/
	
	// 파일 업로드 처리 메소드(재활용)
	public String saveFile(MultipartFile upfile, HttpSession session) {

	// 파일명 수정작업하기
	// 1.원본파일명 추출
	String originName = upfile.getOriginalFilename();
	// 2.시간형식 문자열로 만들기
	// 20240527162730
	String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	// 3.확장자 추출하기 파일명 뒤에서부터 . 찾아서 뒤로 잘라내기
	String ext = originName.substring(originName.lastIndexOf("."));
	// 4.랜덤값 5자리 뽑기
	int ranNum = (int) (Math.random() * 90000 + 10000);
	// 5.하나로 합쳐주기
	String changeName = currentTime + ranNum + ext;
	// 6.업로드하고자하는 물리적인 경로 알아내기 (프로젝트 내에 저장될 실제 경로 찾기)
	String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
	// 7.경로와 수정 파일명을 합쳐서 파일 업로드 처리하기
	try {
		upfile.transferTo(new File(savePath + changeName));
	} catch (IllegalStateException | IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}


	return changeName;

	}

	// 댓글 목록 조회
	@ResponseBody
	@RequestMapping(value = "replyList.bo", produces = "application/json;charset=UTF-8")
	public ArrayList<Reply> replyList(int boardNo) {

		ArrayList<Reply> rList = boardService.replyList(boardNo);

		return rList;
	}
	
	//댓글 입력
	@ResponseBody
	@RequestMapping("insertReply.bo")
	public int insertReply(Reply r) {
		
		System.out.println(r);
		
		int result = boardService.insertReply(r);
		
		return result;
	}	
	
		
		
		
	
	

}
