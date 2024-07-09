package com.kh.pjtMungHub.chatting.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MessageVO {
	
	private int chatNo;
	private int sitterNo;
	private int masterNo;
	private String chatContent;
	private Date chatDate;

}
