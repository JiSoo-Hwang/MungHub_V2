package com.kh.pjtMungHub.shop.model.vo;

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

	private ArrayList<Attachment> atList;
	private Attachment at;
	private String justifying;
	private int number;
	
	private String[] items;
	private int userNo;
	private int productNo;
	private int amount;
	
	private ArrayList<Integer> checkedItem;
}
