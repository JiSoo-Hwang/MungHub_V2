package com.kh.pjtMungHub.chatting.server;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.kh.pjtMungHub.chatting.vo.MessageVO;
import com.kh.pjtMungHub.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChattingServer extends TextWebSocketHandler{

	private Set<WebSocketSession> users = new CopyOnWriteArraySet<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		log.debug("연결 완료");
		log.debug("session : {}",session);
		log.debug("정보 : {}",session.getAttributes().get("loginUser"));
		users.add(session);
		log.debug("아이디 : {}",((Member)(session.getAttributes().get("loginUser"))).getUserId());


	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		// 메시지를 전달받아 아이디와 메시지를 vo에 담아 처리해보기
		Member loginUser = ((Member)(session.getAttributes().get("loginUser")));
		MessageVO mv = MessageVO.builder().masterNo(loginUser.getUserNo()).chatContent(message.getPayload()).build();
		// VO 정보를 json화시켜 메시지 객체에 담아 전달하기
		// json화시켜 문자열로 만든 값을 담아 전달하고 데이터를 받는 위치에서 다시 json으로 파싱
		message = new TextMessage(new Gson().toJson(mv));
		// 순차적으로 접근한 사용자들에게 메시지 전달하기
		for(WebSocketSession ws : users) {
			ws.sendMessage(message);
		}
	}
}
