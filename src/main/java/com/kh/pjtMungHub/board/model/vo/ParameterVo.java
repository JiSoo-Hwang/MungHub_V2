package com.kh.pjtMungHub.board.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ParameterVo {
	
	
	private int offset;
	private int limit;
	private String category;
	private String sort;
	
	

}