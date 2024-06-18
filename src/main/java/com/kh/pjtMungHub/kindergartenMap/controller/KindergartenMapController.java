package com.kh.pjtMungHub.kindergartenMap.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.pjtMungHub.kindergartenMap.model.service.MapService;
import com.kh.pjtMungHub.kindergartenMap.model.vo.MapVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class KindergartenMapController {
	
	@Autowired
	private MapService mapService;
	
	//지도 반환리스트
	
	@RequestMapping("map.do")
	public String selectMap(Model model) {
		
		ArrayList<MapVO> mapList = mapService.selectMap();
		
		model.addAttribute("mapList",mapList);
		
		return "kindergartenMap/kindergartenMapView";
	}
	
	
}
