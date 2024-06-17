package com.kh.pjtMungHub.kindergartenMap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class KindergartenMapController {

	//지도페이지로 이동 메소드
	@GetMapping("map.do")
	public String selectMap() {
		return "kindergartenMap/kindergartenMapView";
	}
	
}
