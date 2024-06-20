package com.kh.pjtMungHub.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reply {
	
	private int replyNo;//	REPLY_NO	NUMBER
	private String replyContent;//	REPLY_CONTENT	VARCHAR2(500 BYTE)
	private String replyWriter;//	REPLY_WRITER	VARCHAR2(30 BYTE)
	private Date createDate;//	CREATE_DATE	DATE
	private String replyStatus;//	REPLY_STATUS	VARCHAR2(1 BYTE)

}
