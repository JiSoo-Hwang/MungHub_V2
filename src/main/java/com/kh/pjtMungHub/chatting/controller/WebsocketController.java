package com.kh.pjtMungHub.chatting.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.pjtMungHub.chatting.vo.MessageVO;
import com.kh.pjtMungHub.member.model.service.MemberService;
import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.petcare.model.vo.PetSitter;

@Controller
@RequestMapping("/chat")
public class WebsocketController {
	
	@Autowired
	private MemberService service;
	@GetMapping("/{code}")
	public String enterChat(@PathVariable String code, HttpSession session) {
		ArrayList<PetSitter> sitterList=service.getSitterList();
		ArrayList<MessageVO> lastChat=(ArrayList)session.getAttribute("chatList");
		String[] code2=code.split("n");
		int petSitterNo=Integer.parseInt(code2[0]);
		MessageVO p= new MessageVO();
		for(MessageVO msg:lastChat) {
			if(msg.getSitterNo()==petSitterNo) {
				p=msg;
			}
		}
		ArrayList<MessageVO> chatList=service.selectChatList(p);
		for(PetSitter pst :sitterList){
			if(pst.getPetSitterNo()==p.getSitterNo()) {
				session.setAttribute("sitterUser",pst);
				break;
			}
		}
		session.setAttribute("chatList", chatList);
		System.out.println(chatList);
		return "member/memberChatting";
	}

}
