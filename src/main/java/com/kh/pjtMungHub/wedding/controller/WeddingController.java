package com.kh.pjtMungHub.wedding.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.pet.model.vo.Breed;
import com.kh.pjtMungHub.pet.model.vo.Pet;
import com.kh.pjtMungHub.wedding.model.service.WeddingService;
import com.kh.pjtMungHub.wedding.model.vo.Wedding;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WeddingController {
 
	@Autowired
	private WeddingService service;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
//	@ResponseBody
//	@RequestMapping("breedList.wd")
//	public ArrayList<Breed> selectBreeds(){
//		ArrayList<Breed> breedList = service.selectBreeds();
//		
//		return breedList;
//		
//	}
	
	@GetMapping("wedList.wd")
	public ModelAndView weddingList(ModelAndView mv) {
		ArrayList<Breed> breedList = service.selectBreeds();
		ArrayList<Wedding> weddingList = service.selectWeddings();
		mv.addObject("weddingList", weddingList).
		addObject("breedList", breedList).setViewName("wedding/weddingListView");
		return mv;
	}
	
	@GetMapping("detail.wd")
	public String selectWedding(int weddingNo, Model model ) {
		Wedding w = service.selectWedding(weddingNo);
		model.addAttribute("wedding",w);
		return "wedding/weddingDetailView";
	}
	
	@GetMapping("insert.wd")
	public String insertWeddingForm(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		int userNo = m.getUserNo();
		Pet pet = service.selectPet(userNo);
		model.addAttribute("pet",pet);
		return "wedding/insertWeddingView";
	}
	
	@PostMapping("insert.wd")
	public String insertWedding(Wedding w, MultipartFile upFile, ArrayList<MultipartFile>vacCert, Model model, HttpSession session) {
		if(!upFile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upFile, session);
			w.setOriginName(upFile.getOriginalFilename());
			w.setChangeName("resources/uploadFiles/wedding/"+changeName);
		}
		return "wedding/weddingListView";
	}
	
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
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/kindergarten/");

		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
}
