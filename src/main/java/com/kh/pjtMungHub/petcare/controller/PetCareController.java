package com.kh.pjtMungHub.petcare.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
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
import org.springframework.web.servlet.ModelAndView;

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
import com.kh.pjtMungHub.petcare.model.vo.LongReview;
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
	public String enrollSitter(@RequestParam(value="currentPage",defaultValue="1")int currentPage
							   ,Model model) {
		
		model.addAttribute("currentPage",currentPage);
		return "petCare/selectSitter";
	}
	
	//페이지 첫화면 펫시터 리스트
	@ResponseBody
	@RequestMapping("firstSitterList.re")
	public HashMap<String,Object> firstSitterList(String firstCurrentPage){
		
		int currentPage = Integer.parseInt(firstCurrentPage);
		int listCount = petCareService.firstListCount();
		int pageLimit = 3;
		int boardLimit = 3;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList <PetSitter> list = petCareService.firstSitterList(pi);
		
		HashMap<String,Object> result = new HashMap<>();
		result.put("list", list);
		result.put("pi", pi);
		return result;
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
	
	//단기돌봄 새로운 선택화면 (펫시터 가능 날짜 같이)
	@GetMapping("shortSitter.re")
	public ModelAndView shortSitterRe(ModelAndView mv,PetSitter petSitter) {
		
		//날짜 지정 후 시간 비활성화에 필요한
		ArrayList<Reservation> disabledPlan = petCareService.disabledDates(petSitter.getPetSitterNo());
		
		mv.addObject("disabledPlan", disabledPlan).setViewName("petCare/reservationSitter");
		mv.addObject("petSitter", petSitter).setViewName("petCare/reservationSitter");
		return mv;
	}
	
	//단기돌봄 새로운 예약 페이지
	@GetMapping("shortSencond.re")
	public String shortReservationSencond(AvailableTimes at,Model model) {
		
		Price p = petCareService.priceTable(at);
		at.setTotalPrice(p.getTotalPrice());
		at.setPriceName(p.getPriceName());
		model.addAttribute("at",at);
		return "petCare/reservationSitterRe";
	}
	
	//단기돌봄 예약 정보 저장하기
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
		
		// reservationNo 가져오기
		int reservationId = petCareService.reservationId();
		
		//펫시터정보
		PetSitter sitter = petCareService.sitterInfo(re);
		
		if(result>0) {
			session.setAttribute("alertMsg", "예약에 성공했습니다! 결제 페이지로 이동합니다.");
			model.addAttribute("re",re);
			model.addAttribute("reservationId",reservationId);
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
		
		String reservationId = payment.getCustomData().get("reservationId");
		String reservationHouseNo = payment.getCustomData().get("reservationHouseNo");
		String userNo = payment.getCustomData().get("userNo");
		String userId = payment.getCustomData().get("userId");
		payment.setReservationNo(reservationId);
		payment.setReservationHouseNo(reservationHouseNo);
		payment.setUserNo(userNo);
		payment.setUserId(userId);
		
		return petCareService.insertPayment(payment);
	}
	
	//결제내역 페이지로 이동
	@RequestMapping("payDetail.re")
	public ModelAndView payDetail(String uid,ModelAndView mv,HttpSession session) {
		
		Payment payment = petCareService.payDetail(uid);
		
		//결제성공 후 각 paymentStatus '결제완료' 변경작업
		if(Integer.parseInt(payment.getDifferentNo())==1) {
			
			int result = petCareService.updateReservation(String.valueOf(petCareService.selectReservationId(payment)));
			
			if(result>0) {
				session.setAttribute("alertMsg", "결제성공!! 내역을 확인해주세요.");
				mv.addObject("p",payment).setViewName("petCare/payDetail"); 
			}else {
				mv.addObject("alertMsg","결제실패..관리자에게 문의해주세요").setViewName("redirect:/houseList.re"); 
			}
			
		}else if(Integer.parseInt(payment.getDifferentNo())==2) {
			
			int result = petCareService.updateHouseRe(payment.getReservationHouseNo());
			
			if(result>0) {
				session.setAttribute("alertMsg", "결제성공!! 내역을 확인해주세요.");
				mv.addObject("p",payment).setViewName("petCare/payDetail"); 
			}else {
				mv.addObject("alertMsg","결제실패..관리자에게 문의해주세요").setViewName("redirect:/houseList.re"); 
			}
		}
		return mv;
	}
	
	//장기돌봄 예약 리스트로 이동
	@RequestMapping("houseList.re")
	public String selectHouse(@RequestParam(value="currentPage",defaultValue="1")int currentPage
							 ,Model model) {
		
		model.addAttribute("currentPage",currentPage);
		return "petCare/selectHouse";
	}
	
	//장기돌봄 페이지 처음화면
	@ResponseBody
	@RequestMapping("firstHouseList.re")
	public HashMap<String,Object> firstHouseList(String firstCurrentPage) {
		
		int currentPage = Integer.parseInt(firstCurrentPage);
		int listCount = petCareService.firstListCount();
		int pageLimit = 3;
		int boardLimit = 3;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<House> list = petCareService.firstHouseList(pi);
		
		HashMap<String,Object> result = new HashMap<>(); //ArrayList 와 pi를 같이 보내려면 map 을 활용
		result.put("houseList",list);
		result.put("pi", pi);
		return result;
	}
	
	//장기돌봄 예약 리스트로 이동
	@ResponseBody
	@RequestMapping(value="selectHouseList.re",produces="application/json;charset=UTF-8")
	public HashMap<String,Object> selectHouseList(@RequestParam(value="currentPage",defaultValue="1")int currentPage
										   ,HouseReservation houseRe,Date endJavaDate) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //날짜형식
		String formatDate = sdf.format(endJavaDate); //날짜형식으로 적용
		java.sql.Date sqlDate = java.sql.Date.valueOf(formatDate); //sql 형식으로 변환 성공!!
		houseRe.setEndDate(sqlDate); //필드에 적용
		
		String address = houseRe.getAddress().substring(0,2); //주소 앞2글자
		houseRe.setAddress(address);

		int listCount = petCareService.listCount(houseRe);
		int pageLimit = 3;
		int boardLimit = 3;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<House> houseList = petCareService.selectHouseList(houseRe,pi);
		
		HashMap<String,Object> result = new HashMap<>(); //ArrayList 와 pi를 같이 보내려면 map 을 활용
		result.put("houseList",houseList);
		result.put("pi", pi);
		
		return result;
	}
	
	//집 상세정보 / 정보전달 
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
	
	//집 후기
	@ResponseBody
	@RequestMapping("longReview.re")
	public HashMap<String,Object> longReview(@RequestParam(value="currentPage",defaultValue="1")int currentPage
									,ModelAndView mv,int houseNo) {
		//후기정보 페이징바와 같이
		int listCount = petCareService.reviewCount(houseNo);
		int pageLimit = 3;
		int boardLimit = 2;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<LongReview> reviewList = petCareService.selectLongReview(houseNo,pi); 
		
		HashMap<String,Object> result = new HashMap<>();
		result.put("reviewList", reviewList);
		result.put("pi", pi);
		return result;
	}
	
	//맵이동
	@RequestMapping("mapTest.do")
	public String mapTest() {
		return "petCare/mapTest";
	}
	
	//장기돌봄 예약 저장 후 결제 페이지로 이동
	@PostMapping("enrollHouse.re")
	public ModelAndView enrollHouse(String javaDate,String inputDate,HouseReservation hr
			   				 ,ModelAndView mv,HttpSession session) {
		
		java.sql.Date sqlDate1 = java.sql.Date.valueOf(javaDate);
		java.sql.Date sqlDate2 = java.sql.Date.valueOf(inputDate);
		hr.setEndDate(sqlDate1);
		hr.setStartDate(sqlDate2);
		
		int result = petCareService.enrollHouse(hr); //예약정보 저장
		
		House house = petCareService.detailHouse(Integer.parseInt(hr.getHouseNo())); //집정보
		HousePrice price = petCareService.selectPriceInfo(hr.getStayNo()); //선택한 요금정보
		
		if(result>0) {
			int reservationHouseNo = petCareService.houserReservationNo();
			
			session.setAttribute("alertMsg", "예약에 성공하셨습니다! 결제를 완료하셔야 예약이 확정 됩니다.");
			mv.addObject("hr",hr);
			mv.addObject("reservationHouseNo",reservationHouseNo);
			mv.addObject("house",house);
			mv.addObject("price",price);
			mv.setViewName("petCare/paymentHouse");
		}else {
			mv.addObject("alertMsg","오류가 발생 했습니다. 관리자에게 문의해주세요.").setViewName("redirect:/");
		}
		return mv;
	}
	
	
	//병원검색 페이지로 이동
	@RequestMapping("hospital.ho")
	public String hospitalPage() {
		return "petCare/hospital";
	}
	
	//API 설정
	@ResponseBody
	@RequestMapping(value="hospitalList.ho", produces="text/xml;charset=UTF-8")
	public String hospitalList() throws IOException {
		
		String str = "";
		
		String serviceKey = "00d6f801245544b987ad67dfe6210312";
		String url = "https://openapi.gg.go.kr/Animalhosptl";
		url+="?KEY="+serviceKey;
		url+="&pIndex=1";
		url+="&pSize=50";
		url+="&SIGUN_CD=41820";
		URL requestUrl = new URL(url);
		
		HttpURLConnection urlCon = (HttpURLConnection)requestUrl.openConnection();
		urlCon.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));
		
		String line;
		while((line=br.readLine()) != null) {
			str+=line;
		}
		br.close();
		urlCon.disconnect();
		
		
		System.out.println(str);
		
		return str;
	}
	
	
	
	
	
}






















