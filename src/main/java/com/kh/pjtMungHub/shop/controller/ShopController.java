package com.kh.pjtMungHub.shop.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pjtMungHub.shop.model.service.ShopService;
import com.kh.pjtMungHub.shop.model.vo.Product;



@Controller
public class ShopController {

	@Autowired
	private ShopService ShopService;
	
	@GetMapping("list.sp")
	public ModelAndView ShopList(ModelAndView mv) {
		
		ArrayList<Product> pList = ShopService.selectProductList(); 

		
		mv.addObject("pList", pList);
		mv.setViewName("shop/shopListView");
	
		
		return mv;
	}
	
	@GetMapping("detail.sp/{productNo}")
	public ModelAndView ShopDetail(@PathVariable int productNo, ModelAndView mv) {
		
		Product p=ShopService.selectProductDetail(productNo);
		
		mv.addObject("p",p);
		mv.setViewName("shop/shopDetailView");
		
		return mv;
	}
	
	
}
