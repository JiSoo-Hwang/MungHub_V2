package com.kh.pjtMungHub.kindergartenMap.controller;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
		
		JSONArray jsonArray = new JSONArray();
		
		
		for(int i=0;i<mapList.size();i++) {
			JSONObject jobj = new JSONObject();
			jobj.put("kindNo", mapList.get(i).getKindNo());
			jobj.put("directorId", mapList.get(i).getDirectorId());
			jobj.put("regionName", mapList.get(i).getRegionName());
			jobj.put("kindAddress", mapList.get(i).getKindAddress());
			jobj.put("kindName", mapList.get(i).getKindName());
			jobj.put("kindContact", mapList.get(i).getKindContact());
			jobj.put("placeX", mapList.get(i).getPlaceX());
			jobj.put("placeY", mapList.get(i).getPlaceY());
			jobj.put("status", mapList.get(i).getStatus());
			jsonArray.add(jobj);
		}
		model.addAttribute("mapList",jsonArray);
		return "kindergartenMap/kindergartenMapView";
	}
	@RequestMapping("reg.do")
	public String regForm() {
		return "kindergartenReg/insertRegView";
	}
}
