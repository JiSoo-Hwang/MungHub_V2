package com.kh.pjtMungHub.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {

	private int boardNo;
	private int userNo;
	private int categoryNo;
	private int fileNo;
	private String breedId;
	private String boardTitle;
	private String boardWriter;
	private String boardContent;
	private int count;
	private int recommend;
	private Date uploadDate;
	private Date reviseDate;
	private String status;

}
