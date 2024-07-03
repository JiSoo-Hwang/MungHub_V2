package com.kh.pjtMungHub.chatting.server;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChattingServer extends TextWebSocketHandler{

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		log.debug("서버 연결 완료");
		log.debug("webSession : {}",session);
		

	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		log.debug("메시지 수신");
		log.debug("session : {}",session);
		log.debug("TextMessage : {}",message);
		session.sendMessage(message);
	}
}
