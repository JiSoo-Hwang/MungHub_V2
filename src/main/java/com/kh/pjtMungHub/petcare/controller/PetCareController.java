package com.kh.pjtMungHub.petcare.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.petcare.model.service.PetCareServiceImpl;
import com.kh.pjtMungHub.petcare.model.vo.AvailableTimes;
import com.kh.pjtMungHub.petcare.model.vo.House;
import com.kh.pjtMungHub.petcare.model.vo.HouseReservation;
import com.kh.pjtMungHub.petcare.model.vo.Payment;
import com.kh.pjtMungHub.petcare.model.vo.PetSitter;
import com.kh.pjtMungHub.petcare.model.vo.Price;
import com.kh.pjtMungHub.petcare.model.vo.Reservation;

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
	public String selectHouse() {
		
		return "petCare/selectHouse";
	}
	
	//장기돌봄 예약 리스트로 이동
	@ResponseBody
	@RequestMapping(value="selectHouseList.re",produces="application/json;charset=UTF-8")
	public ArrayList<House> selectHouseList(HouseReservation houseRe,Date endJavaDate) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //날짜형식
		String formatDate = sdf.format(endJavaDate); //날짜형식으로 적용
		java.sql.Date sqlDate = java.sql.Date.valueOf(formatDate); //sql 형식으로 변환 성공!!
		houseRe.setEndDate(sqlDate); //필드에 적용
		
		ArrayList<House> houseList = petCareService.selectHouseList(houseRe);
		
		return houseList;
	}
	
	
	
	
	
	
	
	
	
}






















