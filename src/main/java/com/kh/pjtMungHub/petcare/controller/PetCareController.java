package com.kh.pjtMungHub.petcare.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.pjtMungHub.common.model.vo.PageInfo;
import com.kh.pjtMungHub.common.template.Pagination;
import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.petcare.model.service.PetCareServiceImpl;
import com.kh.pjtMungHub.petcare.model.vo.AvailableTimes;
import com.kh.pjtMungHub.petcare.model.vo.Certification;
import com.kh.pjtMungHub.petcare.model.vo.Environment;
import com.kh.pjtMungHub.petcare.model.vo.House;
import com.kh.pjtMungHub.petcare.model.vo.HousePrice;
import com.kh.pjtMungHub.petcare.model.vo.HouseReservation;
import com.kh.pjtMungHub.petcare.model.vo.Payment;
import com.kh.pjtMungHub.petcare.model.vo.PetSitter;
import com.kh.pjtMungHub.petcare.model.vo.Price;
import com.kh.pjtMungHub.petcare.model.vo.Reservation;
import com.kh.pjtMungHub.petcare.model.vo.SupplyGuide;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PetCareController {
	
	@Autowired
	private PetCareServiceImpl petCareService;
	
	
	//펫시터 선택 페이지 이동
	@RequestMapping("sitter.re")
	public String enrollSitter() {
		
		return "petCare/selectSitter";
	}
	
	//날짜,시간 지정시 스케줄 가능한 펫시터 리스트형태로 불러오기
	@ResponseBody
	@PostMapping(value="selectSitter.re",produces="application/json;charset=UTF-8")
	public ArrayList<PetSitter> selectSitter(@ModelAttribute AvailableTimes at) {
		
		ArrayList<PetSitter> sList = petCareService.selectSitter(at);
		return sList;
	}
	
	//단기돌봄 예약 페이지 이동하면서 요금표 테이블에서 결제가격 가져오기
	@GetMapping("short.re")
	public String shortReservation(AvailableTimes at,Model model) {
		
		Price p = petCareService.priceTable(at);
		
		at.setTotalPrice(p.getTotalPrice());
		at.setPriceName(p.getPriceName());
		model.addAttribute("at",at);
		return "petCare/reservation";
	}
	
	//예약 정보 저장하기
	@PostMapping("enroll.re")
	public String enrollReservation(Reservation re
								   ,String priceName
								   ,int totalPrice
								   ,MultipartFile upfile
								   ,HttpSession session
								   ,Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = PetSaveFile.getSaveFile(upfile, session);
			re.setOriginName(upfile.getOriginalFilename());
			re.setChangeName("resources/uploadFiles/petPhoto/"+changeName);
		}
		//예약정보 저장하기
		re.setTotalAmount(totalPrice);
		int result = petCareService.enrollReservation(re);
		
		//펫시터정보
		PetSitter sitter = petCareService.sitterInfo(re);
		if(result>0) {
			session.setAttribute("alertMsg", "예약에 성공했습니다! 결제 페이지로 이동합니다.");
			model.addAttribute("re",re);
			model.addAttribute("sitter",sitter);
			model.addAttribute("priceName",priceName);
			model.addAttribute("totalPrice",totalPrice);
			return "petCare/payment";
		}else {
			session.setAttribute("alertMsg", "예약에 실패했습니다. 관리자에게 문의해주세요.");
			return "petCare/selectSitter";
		}
	}
	
	//결제정보 저장하기
	@ResponseBody
	@RequestMapping(value="insertPayment.re",produces="application/json;charset=UTF-8")
	public int insertPayment(Payment payment) {
		
		payment.setPaymentStatus(2); //2번 '결제완료'
		int result = petCareService.insertPayment(payment);
		
		return result;
	}
	
	//결제내역 페이지로 이동
	@RequestMapping("payDetail.re")
	public String payDetail(String uid,Model model) {
		
		Payment payment = new Payment();
		payment.setPaymentId(uid);
		
		System.out.println(payment);
		
		payment = petCareService.payDetail(payment);
		model.addAttribute("p",payment);
		return "petCare/payDetail";
	}
	
	//장기돌봄 예약 리스트로 이동
	@RequestMapping("houseList.re")
	public String selectHouse(@RequestParam(value="currentPage",defaultValue="1")int currentPage
							 ,Model model) {
		
		model.addAttribute(currentPage);
		return "petCare/selectHouse";
	}
	
	//장기돌봄 예약 리스트로 이동
	@ResponseBody
	@RequestMapping(value="selectHouseList.re",produces="application/json;charset=UTF-8")
	public HashMap<String,Object> selectHouseList(@RequestParam(value="currentPage",defaultValue="1")int currentPage
										   ,HouseReservation houseRe,Date endJavaDate) {
		
		int listCount = petCareService.listCount();
		int pageLimit = 3;
		int boardLimit = 3;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //날짜형식
		String formatDate = sdf.format(endJavaDate); //날짜형식으로 적용
		java.sql.Date sqlDate = java.sql.Date.valueOf(formatDate); //sql 형식으로 변환 성공!!
		houseRe.setEndDate(sqlDate); //필드에 적용
		
		String address = houseRe.getAddress().substring(0,2); //주소 앞2글자
		houseRe.setAddress(address);
		
		ArrayList<House> houseList = petCareService.selectHouseList(houseRe,pi);
		
		HashMap<String,Object> result = new HashMap<>(); //ArrayList 와 pi를 같이 보내려면 map 을 활용
		result.put("houseList",houseList);
		result.put("pi", pi);
		
		return result;
	}
	
	//집 상세정보 페이지 이동 및 정보전달
	@RequestMapping("detailHouse.re")
	public String detailHouse(int houseNo,Model model) {
		
		House house = petCareService.detailHouse(houseNo); //집
		ArrayList<HousePrice> price = petCareService.selectHousePrice(); //요금
		ArrayList<Certification> cer = petCareService.selectCertification(houseNo);//인증
		ArrayList<Environment> env = petCareService.selectEnvironment(houseNo);//환경
		ArrayList<SupplyGuide> sup = petCareService.selectSupplyGuide(houseNo);//지원서비스
		
		model.addAttribute("house", house); //집번호,집주인이름,주소,간단소개,자세한소개,근처병원,사진이름/경로
		model.addAttribute("price",price); //숙박 일정에 따른 요금정보 (ex : 1박2일 = 4만원..)
		model.addAttribute("cer",cer); //인증정보(ex: 신원인증..)
		model.addAttribute("env",env); //환경정보(ex: #1인가구,#단독주택..)
		model.addAttribute("sup",sup); //지원서비스(ex: 산책,응급처치..)
		return "petCare/detailHouse";
	}
	
	//맵이동
	@RequestMapping("mapTest.do")
	public String mapTest() {
		return "petCare/mapTest";
	}
	
	
	
	
	
	
	
	
	
}






















