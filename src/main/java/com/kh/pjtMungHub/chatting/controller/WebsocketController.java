package com.kh.pjtMungHub.chatting.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.pjtMungHub.member.model.vo.Member;

@Controller
@RequestMapping("/chat")
public class WebsocketController {
	
	@GetMapping("/{code}")
	public String enterChat(@PathVariable String code, HttpSession session) {
		return "member/memberChatting";
	}

}
