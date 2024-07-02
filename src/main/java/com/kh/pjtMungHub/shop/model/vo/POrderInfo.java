package com.kh.pjtMungHub.shop.model.vo;

import java.sql.Date;
import java.util.HashMap;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class POrderInfo {
	
	private String merchantUid;
	private String process;
	private String items;
	private String itemsQuantity;
	private int totalPrice;
	private int userNo;
	private Date payDate;
	private HashMap<String,String> message;
	
	private String address;
	private String phone;
	private String recipient;
	
}
