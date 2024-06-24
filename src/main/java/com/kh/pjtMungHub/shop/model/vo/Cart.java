package com.kh.pjtMungHub.shop.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {

	private String productNo;
	private String amount;
	private String userNo;
	
	private String productName;
	private int price;
	private int discount;
	private String brandName;
	private String categoryName;
}
