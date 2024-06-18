package com.kh.pjtMungHub.petcare.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.pjtMungHub.petcare.model.service.PetCareServiceImpl;
import com.kh.pjtMungHub.petcare.model.vo.AvailableTimes;
import com.kh.pjtMungHub.petcare.model.vo.PetSitter;

@Controller
public class PetCareController {
	
	@Autowired
	private PetCareServiceImpl petCareService;
	
	//단순 페이지 이동
	@RequestMapping("sitter.re")
	public String enrollSitter() {
		return "petCare/selectSitter";
	}
	
	//날짜,시간 지정시 펫시터 리스트형태로 불러오기
	@ResponseBody
	@PostMapping(value="selectSitter.re",produces="application/json;charset=UTF-8")
	public ArrayList<PetSitter> selectSitter(@ModelAttribute AvailableTimes at) {
		
		ArrayList<PetSitter> sList = petCareService.selectSitter(at);
		//파일 이름과 경로를 지정해서
		//소개글,사진,각종 정보를 페이지에 표현하기
		return sList;
	}

}
