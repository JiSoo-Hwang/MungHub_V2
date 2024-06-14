package com.kh.pjtMungHub.petcare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PetCareController {
	
	@RequestMapping("home.ca")
	public String homeCare() {
		//메인페이지에서 예약페이지로
		log.debug("확인");
		return "sitter/homeCare";
	}
	
	
}
