package com.kh.pjtMungHub.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class WebsocketController {
	
	@GetMapping("/enter.ch")
	public String enterChat() {
		return "member/chat";
	}

}
