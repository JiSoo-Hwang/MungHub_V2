package com.kh.pjtMungHub.board.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	
	private int boardNo;//	BOARD_NO	NUMBER
	private int category;//	CATEGORY_NO	NUMBER
	private String fileNo;//	FILE_NO	NUMBER
	private String breedId;//	BREED_ID	VARCHAR2(4 BYTE)
	private String boardTitle;//	BOARD_TITLE	VARCHAR2(100 BYTE)
	private String boardWriter;//	BOARD_WRITER	VARCHAR2(100 BYTE)
	private String boardContent;//	BOARD_CONTENT	VARCHAR2(4000 BYTE)
	private int count;//	COUNT	NUMBER
	private int recommend;//	RECOMMEND	NUMBER
	private Date uploadDate;//	UPLOAD_DATE	DATE
	private Date reviseDate;//	REVISE_DATE	DATE
	private String status;

}
