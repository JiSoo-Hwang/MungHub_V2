package com.kh.pjtMungHub.shop.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.shop.model.service.ShopService;
import com.kh.pjtMungHub.shop.model.vo.Attachment;
import com.kh.pjtMungHub.shop.model.vo.Brand;
import com.kh.pjtMungHub.shop.model.vo.Cart;
import com.kh.pjtMungHub.shop.model.vo.Category;
import com.kh.pjtMungHub.shop.model.vo.ParameterVo;
import com.kh.pjtMungHub.shop.model.vo.Product;

import lombok.extern.slf4j.Slf4j;


@Controller
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	@GetMapping("list.sp")
	public ModelAndView ShopList(ModelAndView mv) {
		
		ArrayList<Product> pList = shopService.selectProductList(); 
		
		mv.addObject("pList", pList);
		mv.setViewName("shop/shopListView");
	
		
		return mv;
	}
	
	@GetMapping("detail.sp/{productNo}")
	public ModelAndView ShopDetail(@PathVariable int productNo, ModelAndView mv) {
		
		Product p=shopService.selectProductDetail(productNo);
		ArrayList<Product> pList = shopService.selectProductList(); 
		
		mv.addObject("pList", pList);
		mv.addObject("p",p);
		mv.setViewName("shop/shopDetailView");
		
		return mv;
	}
	
	@GetMapping("insert.sp")
	public ModelAndView shopInsertFrom(ModelAndView mv) {
		
		ArrayList<Category> c=shopService.selectCategory();
		ArrayList<Brand> b=shopService.selectBrand();
		mv.addObject("c",c);
		mv.addObject("b",b);
		mv.setViewName("shop/insertProductView");
		
		
		return mv;
	}
	
	
	@PostMapping("insert.sp")
	public ModelAndView shopInsert(Product p,
								   ModelAndView mv,
								   MultipartFile[] upfile,
								   HttpSession session) {
		ArrayList<Attachment> atList=new ArrayList<>();
		
		for(int i=0;i<upfile.length;i++) {
			
			if(!upfile[i].getOriginalFilename().equals("")) {
				
				String changeName = saveFile(upfile[i],session,"productFile/");
				
				Attachment at=Attachment.builder().
						fileLev(i).
						originName(upfile[i].getOriginalFilename()).
						changeName(changeName).
						fileJustify("product").
						filePath("/pjtMungHub/resources/uploadFiles/shopFile/productFile/").
						build();
				
				atList.add(at);
			}
			
		}
		ParameterVo fileParameter=ParameterVo.builder()
				.atList(atList)
				.justifying("product")
				.build();
		
		int result=shopService.insertProduct(p,fileParameter);
		
		if(result>0) {
			
			session.setAttribute("message", "등록성공");
			mv.setViewName("redirect:/list.sp");
			
			return mv;
		}else {
			for(int i=0;i<atList.size();i++) {
				String deleteFile=atList.get(i).getFilePath()+atList.get(i).getChangeName();
				new File(session.getServletContext().getRealPath(deleteFile)).delete();
			}
			session.setAttribute("message","등록실패");
			mv.setViewName("redirect:/insert.sp");
			
			return mv;
		}
		
	}
	
	@GetMapping("cart/{userNo}")
	public ModelAndView cartList(ModelAndView mv,
			@PathVariable int userNo) {
		
		ArrayList<Cart> cList = shopService.selectCartList(userNo);
	
		mv.addObject("cList",cList);
		mv.setViewName("shop/shoppingCart");
		return mv;
	}
	
	
	@PostMapping(value="addCart.sp", produces="application/json; charset=UTF-8")
	@ResponseBody
	public int addCart(Cart c) {
		
		System.out.println(c);
		
		int result=shopService.addCart(c);
		
		return result;
	}
	
	
	public String saveFile(MultipartFile upfile
						  ,HttpSession session
						  ,String type) {
		
		String originName = upfile.getOriginalFilename();
		String currentTime= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext=originName.substring(originName.lastIndexOf("."));
		int ranNum=(int)(Math.random()*90000+10000);
		String changeName = currentTime+ranNum+ext;
		String savePath= session.getServletContext().getRealPath("/resources/uploadFiles/shopFile/"+type);
		
		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return changeName;
		
	}
	
	
	
	
}
