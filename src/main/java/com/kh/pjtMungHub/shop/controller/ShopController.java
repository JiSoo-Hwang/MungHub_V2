package com.kh.pjtMungHub.shop.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pjtMungHub.shop.model.service.ShopServiceImpl;
import com.kh.pjtMungHub.shop.model.vo.Product;



@Controller
public class ShopController {

	private ShopServiceImpl ShopService;
	
	@GetMapping("list.sp")
	public ModelAndView ShopList(ModelAndView mv) {
		
		ArrayList<Product> pList = ShopService.selectProductList(); 
		
		System.out.println(pList);
		
		mv.addObject("pList", pList);
		mv.setViewName("shop/shopList");
	
		
		return mv;
	}
	
	
}
