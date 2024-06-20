package com.kh.pjtMungHub.kindergartenMap.controller;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.pjtMungHub.kindergartenMap.model.service.MapService;
import com.kh.pjtMungHub.kindergartenMap.model.vo.MapVO;
import com.kh.pjtMungHub.kindergartenMap.model.vo.Registration;
import com.kh.pjtMungHub.pet.model.vo.Pet;

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
	
	@GetMapping("reg.do")
	public String regForm(@RequestParam(value = "kindNo")int kindNo, Model model) {
		String ownerNo = "1";
		Pet pet = mapService.selectPet(ownerNo);
		MapVO kindergarten = mapService.selectKindergarten(kindNo);
		model.addAttribute("pet",pet);
		model.addAttribute("kindergarten",kindergarten);
		return "kindergartenReg/insertRegView";
	}
	

	@PostMapping("reg.do")
	public String insertReg(Registration reg,Model model) {
		int result = mapService.insertReg(reg);
		if(result>0) {
			Pet pet = mapService.selectPet(reg.getUserNo());
			MapVO kindergarten = mapService.selectKindergarten(reg.getKindNo());
			model.addAttribute("pet",pet);
			model.addAttribute("kindergarten",kindergarten);
			model.addAttribute("registration",reg);
			return "kindergartenReg/regDetailView";
		}else {
			return "kindergartenReg/insertRegView";
		}
		
	}
/*예약내역보기(견주)*/	
	@GetMapping("regList.do")
	public String regList(String userNo, Model model) {
		ArrayList<Registration> regList = mapService.selectRegList(userNo);
		ArrayList<MapVO> kindergartenList = new ArrayList<MapVO>();
		for(int i=0; i<regList.size();i++) {
			kindergartenList.add(mapService.selectKindergarten(regList.get(i).getKindNo()));
		}
		model.addAttribute("kindergartenList",kindergartenList);
		model.addAttribute("regList",regList);
		return "kindergartenReg/regListView";
	}
	/*예약내역보기(원장님)*/	
	@GetMapping("regList2.do")
	public String regList2(String userNo, Model model) {
		ArrayList<Registration> regList = mapService.selectRegList(userNo);
		model.addAttribute("regList",regList);
		return "kindergartenReg/regListView2";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
