package com.kh.pjtMungHub.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.kh.pjtMungHub.board.model.vo.Category;
import com.kh.pjtMungHub.board.model.vo.ParameterVo;
import com.kh.pjtMungHub.board.model.vo.Recommend;
import com.kh.pjtMungHub.board.model.vo.Reply;
import com.kh.pjtMungHub.common.model.vo.PageInfo;
import com.kh.pjtMungHub.common.template.Pagination;
import com.kh.pjtMungHub.board.model.vo.Attachment;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 목록 페이지로 이동 메소드
	@GetMapping("list.bo")
	public String boardList(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "category", defaultValue = "0") int category,
			@RequestParam(value = "sort", defaultValue = "latest") String sort) {

		int listCount = boardService.listCount(category);

		int pageLimit = 10;

		int boardLimit = 20;

		// 페이지 정보 객체 생성
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		// 게시글 목록 조회
		ArrayList<Board> list = boardService.selectList(pi, sort);
		// 카테고리 목록 조회
		ArrayList<Category> ctList = boardService.selectCategory();

		if (category == 0) {
			list = boardService.selectList(pi, sort);
		} else {
			list = boardService.selectList(pi, sort, category);
		}

		// 모델에 데이터 추가
		model.addAttribute("pi", pi);
		model.addAttribute("sort", sort);
		model.addAttribute("category", category);
		model.addAttribute("ctList", ctList);
		model.addAttribute("list", list);

		return "board/boardListView";
	}

	@GetMapping("detail.bo")
	public ModelAndView selectBoard(int boardNo, ModelAndView mv) {

		// 조회수 증가시키기
		int result = boardService.increaseCount(boardNo);

		ArrayList<Attachment> aList = new ArrayList<>();

		// 조회수가 제대로 증가되었다면 상세조회
		if (result > 0) {

			Board b = boardService.selectBoard(boardNo);
			aList = boardService.AttachmentList(boardNo);
			
			mv.addObject("aList", aList);
			mv.addObject("b", b).setViewName("board/detailBoardView");

		} else {
			mv.addObject("errorMsg", "상세조회 실패!");

		}

		return mv;

	}

	// 게시물 작성 페이지로 이동하는 메소드
	@GetMapping("insert.bo")
	public ModelAndView boardEnrollForm(ModelAndView mv) {

		ArrayList<Category> ctList = boardService.selectCategory();

		mv.addObject("ctList", ctList);
		mv.setViewName("board/insertBoardView");

		return mv;
	}

	// 게시물 등록 메소드
	@PostMapping("insert.bo")
	public ModelAndView insertBoard(Board b, ModelAndView mv, MultipartFile[] upfile, HttpSession session) {

		ArrayList<Attachment> aList = new ArrayList<>();

		if (!upfile[0].getOriginalFilename().equals("")) {
			for (int i = 0; i < upfile.length; i++) {

				String fileType = upfile[i].getOriginalFilename();

				int index = fileType.lastIndexOf(".");

				String extension = fileType.substring(index + 1).toLowerCase();
				String type = determineFileType(extension);
				String changeName = saveFile(upfile[i], session, type);

				Attachment a = Attachment.builder().fileLevel(i).originName(upfile[i].getOriginalFilename())
						.changeName(changeName)
						.filePath("/pjtMungHub/resources/uploadFiles/board/boardDetail/" + type + "/").fileType(type)
						.build();

				aList.add(a);
			}
		}
		ParameterVo fileParameter = ParameterVo.builder().aList(aList).build();

		int result = boardService.insertBoard(b, fileParameter);

		if (result > 0) {// 게시글 작성 성공

			session.setAttribute("alertMsg", "게시글 작성 성공!");
			mv.setViewName("redirect:/list.bo");

		} else { // 게시글 작성 실패
			deleteUploadedFiles(aList, session);
			session.setAttribute("alertMsg", "게시글 작성 실패!");
			mv.setViewName("redirect:/insert.bo");

		}
		return mv;
	}

	// 게시글 삭제 메소드
	@PostMapping("delete.bo")
	public ModelAndView deleteBoard(int boardNo, HttpSession session, ModelAndView mv) {

		int result = boardService.deleteBoard(boardNo);

		// 넘어온 파일 정보가 있다면 해당 파일 서버에서 삭제처리하기
		if (result > 0) { // 성공시

			session.setAttribute("alertMsg", "게시글 삭제 성공");
			mv.setViewName("redirect:/list.bo");
		} else {
			session.setAttribute("alertMsg", "게시글 삭제 실패");
			mv.setViewName("redirect:/detail.bo?boardNo=" + boardNo);
		}
		return mv;

	}

	// 게시글 수정페이지 이동 메소드
	@GetMapping("update.bo")
	public String boardUpdateForm(int boardNo, ModelAndView mv) {

		// boardNo로 db에서 해당 게시글 정보 조회해오기 (기존 상세보기시 사용했던 메소드 재활용하기)
		Board b = boardService.selectBoard(boardNo);
		ArrayList<Category> ctList = boardService.selectCategory();
		ArrayList<Attachment> aList = boardService.AttachmentList(boardNo);

		System.out.println(b);
		System.out.println(ctList);
		System.out.println(aList);
		mv.addObject("aList", aList);
		mv.addObject("ctList", ctList);
		mv.addObject("b", b);
		// 페이지 이동할때 전달하기
		return "board/updateBoardForm";
	}

	// 게시글 수정처리 메소드
	@PostMapping("update.bo")
	public String updateBoard(Board b, MultipartFile[] upfile, HttpSession session) {

		boolean flag = false; // 파일 삭제 필요시 사용할 논리값
		String deleteFile = "";// 파일 저장경로 및 변경파일명 담아놓을 변수
		ArrayList<Attachment> aList = new ArrayList<>();
		// 새로운 첨부파일이 넘어온 경우(파일명이 넘어왔을때)
		if (!upfile[0].getOriginalFilename().equals("")) {
			for (int i = 0; i < upfile.length; i++) {
				String fileType = upfile[i].getOriginalFilename();
				int index = fileType.lastIndexOf(".");

				String extension = fileType.substring(index + 1).toLowerCase();
				String type = determineFileType(extension);
				String changeName = saveFile(upfile[i], session, type);

				Attachment a = Attachment.builder().fileLevel(i).originName(upfile[i].getOriginalFilename())
						.changeName(changeName)
						.filePath("/pjtMungHub/resources/uploadFiles/board/boardDetail/" + type + "/").fileType(type)
						.build();

				aList.add(a);
				// 새로운 첨부파일이 있는경우 기존 첨부파일을 찾아서 삭제하는 작업을 해야함
				if (b.getOriginName() != null) {
					flag = true;
					deleteFile = b.getChangeName();
				}

				// 처리된 변경이름과 원본명을 board에 담아주기
				//b.setOriginName(upfile[i].getOriginalFilename());
				//b.setChangeName("pjtMungHub/resources/uploadFiles/board/boardDetail/" + type + "/").fileType(type));
			}
		}
		ParameterVo fileParameter = ParameterVo.builder().aList(aList).build();
		/*
		 * 게시글정보인 b 에는 boardNo,boardTitle,boardContent가 들어있다
		 * 
		 * 추가적으로 고려해야하는 경우는 1.새로 첨부된 파일이 없고 기존 파일도 없을때 2.새로 첨부된 파일이 없고 기존 파일은 있을때 3.새로
		 * 첨부된 파일이 있고 기존 파일은 없을때 - 새로 전달된 파일을 서버에 저장하고 데이터베이스에도 등록 4.새로 첨부된 파일이 있고 기존
		 * 파일도 있을때 - 기존파일은 삭제 / 새로 첨부된 파일을 저장 및 등록하기
		 */
		int result = boardService.updateBoard(b,fileParameter);

		if (result > 0) { // 수정 성공시
			String msg = "게시글 수정 성공!";
			if (flag) {
				// File(실제 파일 저장 경로)
				File f = new File(session.getServletContext().getRealPath(deleteFile));
				f.delete(); // 삭제
			}
			session.setAttribute("alertMsg", msg);
		} else {// 수정 실패
			String msg = "게시글 수정 실패!";
			session.setAttribute("alertMsg", msg);
		}
		// 수정된 게시글 상세보기 페이지로 이동
		return "redirect:/detail.bo?boardNo=" + b.getBoardNo();

	}

	// 파일 업로드 실패시 파일 삭제하는 구문
	private void deleteUploadedFiles(ArrayList<Attachment> aList, HttpSession session) {
		for (Attachment a : aList) {

			String deleteFile = a.getFilePath() + a.getChangeName();

			new File(session.getServletContext().getRealPath(deleteFile)).delete();
		}
	}

	// 파일 종류 확인하는 메소드
	private String determineFileType(String extension) {
		if (Arrays.asList("avi", "mov", "mp4", "wmv", "asf", "mkv").contains(extension)) {
			return "video";
		} else if (Arrays.asList("jpeg", "jpg", "png", "gif").contains(extension)) {
			return "image";
		} else {
			return "file";
		}
	}

	// 파일 업로드 처리 메소드(재활용)
	public String saveFile(MultipartFile upfile, HttpSession session, String fileType) {

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
		String savePath = session.getServletContext()
				.getRealPath("/resources/uploadFiles/board/boardDetail/" + fileType + "/");
		// 7.경로와 수정 파일명을 합쳐서 파일 업로드 처리하기
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return changeName;
	}
	
	@PostMapping("RecCount.bo")
	@ResponseBody
	public int getLikeCount(Recommend r) {
		return boardService.likeCount(r);
	}
	@PostMapping("RecUpdate.bo")
	@ResponseBody
	public int updateLike(Recommend r) {
		int result=boardService.updateLike(r);
		
		
		int likeCount=boardService.likeCount(r);
		
		return likeCount;
	}
	// 댓글 목록 조회
	@ResponseBody
	@RequestMapping(value = "replyList.bo", produces = "application/json;charset=UTF-8")
	public ArrayList<Reply> replyList(int boardNo) {

		ArrayList<Reply> rList = boardService.replyList(boardNo);

		return rList;
	}

	// 댓글 입력
	@ResponseBody
	@RequestMapping(value = "insertReply.bo", produces = "application/json; charset=UTF-8")
	public int insertReply(Reply r) {

		int result = boardService.insertReply(r);

		return result;
	}

	// 댓글 삭제 기능 추가예정

	@ResponseBody
	@RequestMapping(value = "deleteReply.bo", produces = "application/json; charset=UTF-8")
	public int deleteReply(int replyNo) {

		int result = boardService.deleteReply(replyNo);

		return result;
	}

}
