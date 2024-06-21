package com.kh.pjtMungHub.kindergartenMap.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pjtMungHub.kindergartenMap.model.service.MapService;
import com.kh.pjtMungHub.kindergartenMap.model.vo.Kindergarten;
import com.kh.pjtMungHub.kindergartenMap.model.vo.Registration;
import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.pet.model.vo.Pet;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class KindergartenMapController {

	@Autowired
	private MapService mapService;

	// 지도 반환리스트

	@RequestMapping("map.do")
	public String selectMap(Model model) {

		ArrayList<Kindergarten> mapList = mapService.selectMap();

		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < mapList.size(); i++) {
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
		model.addAttribute("mapList", jsonArray);
		return "kindergartenMap/kindergartenMapView";
	}

	@GetMapping("reg.do")
	public String regForm(int kindNo, int ownerNo, Model model, HttpSession session) {

		Pet pet = mapService.selectPet(ownerNo);
		Kindergarten kindergarten = mapService.selectKindergarten(kindNo);
		model.addAttribute("pet", pet);
		model.addAttribute("kindergarten", kindergarten);
		return "kindergartenReg/insertRegView";
	}

	@PostMapping("reg.do")
	public String insertReg(Registration reg, MultipartFile upFile, Model model, HttpSession session) {
		if(!upFile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upFile, session);
			reg.setOriginName(upFile.getOriginalFilename());
			reg.setChangeName("resources/uploadFiles/kindergarten/"+changeName);
		}
		int result = mapService.insertReg(reg);
		reg.setApproval("N");
		if (result > 0) {
			Pet pet = mapService.selectPet(reg.getUserNo());
			Kindergarten kindergarten = mapService.selectKindergarten(reg.getKindNo());
			model.addAttribute("pet", pet);
			model.addAttribute("kindergarten", kindergarten);
			model.addAttribute("registration", reg);
			session.setAttribute("alertMsg", "상담 신청 성공! 승인 결과를 기다려주세요~!");
			return "kindergartenReg/regDetailView";
		} else {
			session.setAttribute("alertMsg", "상담 신청 실패... 다시 시도해주세요...!");
			return "kindergartenReg/insertRegView";
		}

	}

	@RequestMapping("regDetail.do")
	public ModelAndView selectReg(int reservNo,HttpSession session, ModelAndView mv) {
		Registration registration = mapService.selectRegistration(reservNo);
		if(registration!=null) {
			Pet pet = mapService.selectPet(registration.getUserNo());
			mv.addObject("registration",registration);
			mv.addObject("pet",pet);
			mv.setViewName("kindergartenReg/regDetailView");
		}else {
			session.setAttribute("alertMsg", "상세조회실패... 다시 시도해주세요");
			mv.setViewName("kindergartenReg/regListView2");
		}
		return mv;
	}
	
	/* 예약내역보기(견주) */
	@GetMapping("regList.do")
	public String regList(Model model,HttpSession session) {
		Member member = (Member)session.getAttribute("loginUser");
		int userNo = member.getUserNo();
		ArrayList<Registration> regList = mapService.selectRegList(userNo);
		ArrayList<Kindergarten> kindergartenList = new ArrayList<Kindergarten>();
		for (int i = 0; i < regList.size(); i++) {
			kindergartenList.add(mapService.selectKindergarten(regList.get(i).getKindNo()));
		}
		model.addAttribute("kindergartenList", kindergartenList);
		model.addAttribute("regList", regList);
		return "kindergartenReg/regListView";
	}

	/* 예약내역보기(원장님) */
	@GetMapping("regList2.do")
	public String regList2(int userNo, Model model) {
		ArrayList<Registration> regList = mapService.selectRegList(userNo);
		model.addAttribute("regList", regList);
		return "kindergartenReg/regListView2";
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

	@RequestMapping("deleteReg.do")
	public String deleteReg(int reservNo,HttpSession session) {
		int result = mapService.deleteReg(reservNo);
		if(result>0) {
			session.setAttribute("alertMsg", "상담이 정상적으로 취소되었습니다.");
			return "kindergartenReg/regListView";
		}else {
			session.setAttribute("alertMsg", "처리 실패... 다시 시도바랍니다.");
			return "kindergartenReg/regListView";
		}
	}
}
