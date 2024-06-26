package com.kh.pjtMungHub.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pjtMungHub.common.model.vo.PageInfo;
import com.kh.pjtMungHub.common.model.vo.PetPhoto;
import com.kh.pjtMungHub.kindergarten.model.vo.Kindergarten;
import com.kh.pjtMungHub.member.model.service.MemberService;
import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.pet.model.vo.Breed;
import com.kh.pjtMungHub.pet.model.vo.Pet;
import com.kh.pjtMungHub.petcare.controller.PetSaveFile;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("enter.me")
	public String enterLogin() {
		
		return "member/memberLoginForm";
	}
	@RequestMapping("enroll.me")
	public String enterEnroll(HttpSession session) {
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("loginInfo.me")
	public String loginUpdate() {
		return "member/memberLoginUpdate";
	}
	
	@RequestMapping("myPage.me")
	public String enterMyPage(HttpSession session) {
		Member m=(Member)session.getAttribute("loginUser");
		ArrayList<Pet> petList = service.selectPetList(m);
		System.out.println(petList);
		ArrayList<PetPhoto> petPhotoList=new ArrayList<PetPhoto>();
		if(petList!=null) {
			for(Pet p : petList) {
				PetPhoto photo=service.selectPetPhoto(p);
				System.out.println(photo);
				petPhotoList.add(photo);
			}
		}
		System.out.println(petPhotoList);
		session.setAttribute("petList",petList);
		session.setAttribute("petPhotoList",petPhotoList);
		return "member/memberMyPage";
	}
	
	@RequestMapping("updatePet.me")
	public String enterUpdatePet(HttpSession session) {
		ArrayList<Breed> breed=service.selectBreedList();
		session.setAttribute("breed", breed);
		return "member/memberPetUpdate";
	}
	
	@RequestMapping("msg.me")
	public String enterMsg(HttpSession session) {
		Member m=(Member)session.getAttribute("loginUser");
		PageInfo pi=new PageInfo();
		pi.setListCount(service.msgCount(m));
		pi.setCurrentPage(1);
		pi.setBoardLimit(15);
		pi.setPageLimit((int)Math.ceil((((double)pi.getListCount())/15)));
		pi.setMaxPage((int)Math.ceil((double)pi.getListCount()/pi.getBoardLimit()));
		pi.setStartPage(1);
		pi.setEndPage(pi.getStartPage()+pi.getPageLimit()-1);
		if(pi.getEndPage()>pi.getMaxPage()) {
			pi.setEndPage(pi.getMaxPage());
		}
		session.setAttribute("pi", pi);
		session.setAttribute("msgList",service.selectMessageList(m,pi.getCurrentPage()));
		return "member/memberMessage";
	}
	
	@RequestMapping("manage.me")
	public String enterManage(HttpSession session) {
		return "member/memberManage";
	}
	
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {
		Member loginUser = service.loginMember(m);
		if(loginUser==null || !bcryptPasswordEncoder.matches(m.getPassword(),loginUser.getPassword())) {
			mv.addObject("alertMsg","로그인 실패");
			mv.setViewName("/");
		}else if(loginUser.getStatus().equals("N")){
			mv.addObject("alertMsg","아직 승인처리가 완료되지 않았습니다. 관리자에게 문의하시기 바랍니다.");
		}else {
			mv.addObject("alertMsg",loginUser.getUserId()+"님 환영합니다.");
			session.setAttribute("loginUser", loginUser);
		}
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@RequestMapping("logout.me")
	public ModelAndView logoutMember(ModelAndView mv,HttpSession session) {
		mv.addObject("alertMsg", "이용해 주셔서 감사합니다.");
		session.removeAttribute("loginUser");
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("checkId.me")
	public String checkId(Member m) {
		Member mem=service.checkId(m);
		if(mem!=null){
			return "NNNNN";						
		}else {
			return m.getUserId();
		}
	}
	
	@PostMapping("join.me")
	public String insertMember(Member m, Model model, HttpSession session) {
		String encPwd=bcryptPasswordEncoder.encode(m.getPassword());
		m.setPassword(encPwd);
		int result=0;
		if(m.getKindName()==null) {
			result = service.insertMember(m);
		}else {
			result = service.insertTeacher(m);
		}
		if(result>0) {
			session.setAttribute("alertMsg", "회원 가입이 완료되었습니다.");
			if(m.getPetYN().equals("Y")) {
				Member mem = service.loginMember(m);
				session.setAttribute("loginUser", mem);				
				return "redirect:/updatePet.me";
			}
		}else {
			model.addAttribute("alertMsg","회원 가입 실패");
		}
		return "redirect:/";
	}
	
	@PostMapping("searchId.me")
	public ModelAndView searchId(Member m, ModelAndView mv, HttpSession session) {
		Member result = service.searchId(m);
		if(result!=null) {
			mv.addObject("alertMsg", "조회하신 아이디는 "+result.getUserId()+" 입니다.");
			mv.setViewName("member/memberLoginUpdate");
		}else {
			mv.addObject("alertMsg","입력한 데이터를 다시 확인해 주세요.");
			mv.setViewName("member/memberLoginForm");
		}
		return mv;
	}
	
	@PostMapping("changePw.me")
	public ModelAndView changePw(Member m, ModelAndView mv, HttpSession session) {
		Member result=service.searchId(m);
		if(result==null||!result.getUserId().equals(m.getUserId())) {
			mv.addObject("alertMsg", "입력하신 정보를 다시 확인해 주세요.");
		}else {
			m.setPassword(bcryptPasswordEncoder.encode(m.getPassword()));
			
			int rnum=service.changePw(m);
			if(rnum>0) {
				mv.addObject("alertMsg", "비밀번호가 변경되었습니다. 다시 로그인해 주세요.");
			}else {
				System.out.println("통신오류");
			}
		}
		mv.setViewName("redirect:/enter.me");
		return mv;
	}

	@PostMapping("enrollPet.me")
	public ModelAndView enrollPet(Pet p, MultipartFile upFile, ModelAndView mv, HttpSession session) {
		System.out.println(p);
		System.out.println(upFile);
		Member m=(Member)session.getAttribute("loginUser");
		int result1;
		int result2;
		String alertMsg;
		if(!upFile.getOriginalFilename().equals("")) {
			PetPhoto petPhoto = new PetPhoto();
			int pNum=service.getPhotoNo();

			String changeName=saveFile(upFile, session);
			String filePath="/resources/uploadFiles/petPhoto/"+changeName;

			petPhoto.setPhotoNo(pNum);
			petPhoto.setOriginName(upFile.getOriginalFilename());
			petPhoto.setChangeName(changeName);
			petPhoto.setFilePath(filePath);
			result1=service.insertPetPhoto(petPhoto);
			if(result1>0) {
				p.setPhotoNo(pNum);
				System.out.println(p);
			}
		}else {
			result1=1;
		}
		result2=service.insertPet(p);
		if(result1*result2>0) {
			alertMsg="반려견 등록을 완료하였습니다!";
		}else{
			alertMsg="반려견 등록을 실패하셨습니다.";
		}
		session.setAttribute("alertMsg", alertMsg);
		mv.setViewName("redirect:/myPage.me");
		return mv;
	}
	
	@PostMapping("updatePetStat.me")
	public String updatePetStat(Pet p, MultipartFile reUpFile, HttpSession session) {
		boolean flag = false; //파일 삭제 필요시 사용할 논리값
		String deleteFile = "";//파일 저장경로 및 변경파일명 담아놓을 변수
		
		//새로운 첨부파일이 넘어온 경우(파일명이 넘어왔을때) 
		if(!reUpFile.getOriginalFilename().equals("")) {
			PetPhoto photo = new PetPhoto();
			//새로운 첨부파일이 있는경우 기존 첨부파일을 찾아서 삭제하는 작업을 해야함
			if(p.getPhotoNo()!=0) {
				flag = true;
				photo=service.selectPetPhoto(p);
				deleteFile = photo.getChangeName();
			}
			//새로운 첨부파일 정보 데이터베이스에 등록,서버에 업로드 
			String changeName = saveFile(reUpFile,session);
			
			//처리된 변경이름과 원본명을 board에 담아주기
			photo.setOriginName(reUpFile.getOriginalFilename());
			photo.setChangeName("resources/uploadFiles/"+changeName);
		}
		int result = service.updatePet(p);
		String msg = "";	
		if(result>0) { //수정 성공시
			msg = "게시글 수정 성공!";
			if(flag) {
				File f = new File(session.getServletContext().getRealPath(deleteFile));
				f.delete(); //삭제
			}
		}else {//수정 실패 
			msg = "게시글 수정 실패!";
		}
		session.setAttribute("alertMsg", msg);
		return "redirect:/updatePet.me";
	}
	
	@ResponseBody
	@GetMapping("selectKind.me")
	public ArrayList<Kindergarten> searchKind(Kindergarten kind){
		ArrayList<Kindergarten> kindList = service.selectKindList(kind);
		return kindList;
	}
	
	@ResponseBody
	@GetMapping("selectPet.me")
	public Pet updatePetStat(Pet p) {
		Pet pet=service.selectPetByNo(p);
		return pet;
	}
	public String saveFile(MultipartFile upfile,HttpSession session) {

		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		int ranNum = (int)(Math.random()*90000+10000);
		String changeName = currentTime+ranNum+ext;
		
		String savePath=session.getServletContext().getRealPath("/resources/uploadFiles/petPhoto/");
		
		try {
		upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
		e.printStackTrace();
		}	
		return changeName;
	}
}
