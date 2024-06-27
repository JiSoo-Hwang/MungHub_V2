package com.kh.pjtMungHub.shop.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class POrderInfo {
	
	private int orderNo;
	private String process;
	private String items;
	private int totalPrice;
	private int userNo;
	private Date payDate;
	
}
