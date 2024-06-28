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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pjtMungHub.shop.model.service.ShopService;
import com.kh.pjtMungHub.shop.model.vo.Attachment;
import com.kh.pjtMungHub.shop.model.vo.Brand;
import com.kh.pjtMungHub.shop.model.vo.Cart;
import com.kh.pjtMungHub.shop.model.vo.Category;
import com.kh.pjtMungHub.shop.model.vo.POrderInfo;
import com.kh.pjtMungHub.shop.model.vo.ParameterVo;
import com.kh.pjtMungHub.shop.model.vo.Product;
import com.kh.pjtMungHub.shop.model.vo.ShipInfo;


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
	
	@GetMapping("cart.sp")
	public String cart() {
		
		return "shop/shoppingCart";
	}
	
	@ResponseBody
	@GetMapping(value="cartList.sp",produces="application/json;charset=UTF-8")
	public ArrayList<Cart> cartList(int userNo) {
		
		ArrayList<Cart> cList = shopService.selectCartList(userNo);
	
		return cList;
	}
	@ResponseBody
	@PostMapping("updateCartAmount.sp")
	public int updateCartAmount(@RequestParam int productNo
								,@RequestParam int userNo
								,@RequestParam int amount) {
						
		ParameterVo parameter = ParameterVo.builder()
				.productNo(productNo)
				.userNo(userNo)
				.amount(amount)
				.build();
		
		int result=shopService.updateCartAmount(parameter);
		
		return result;
	}
	
	@PostMapping("addCart.sp")
	@ResponseBody
	public int addCart(Cart c) {
		
		int result=shopService.addCart(c);
		
		return result;
	}
	
	@PostMapping("removeCartItem.sp")
	@ResponseBody
	public int removeCartItem(@RequestParam String[] items,@RequestParam int userNo) {
		
		ParameterVo parameter = ParameterVo.builder()
				.items(items)
				.userNo(userNo)
				.build();
		
		int result=shopService.removeCartItem(parameter);
		
		return result;
	}
	
	@PostMapping("order.sp")
	public ModelAndView productOrder(ModelAndView mv ,
			@RequestParam ArrayList<Integer> chooseOrNot,
			@RequestParam int userNo) {
		
		
		ParameterVo parameter = ParameterVo.builder()
				.userNo(userNo)
				.checkedItem(chooseOrNot)
				.build();
		
		int totalPrice=0;
		
		ArrayList<Cart> orderList = shopService.selectCartItemList(parameter);
		String itemList="";
		String itemsNo="";
		String itemsQuantity="";
		ShipInfo shipInfo = shopService.selectShipInfo(userNo);
		for(int i=0;i<orderList.size();i++) {
			
			int price=orderList.get(i).getPrice();
			int discount=orderList.get(i).getDiscount();
			int amount=orderList.get(i).getAmount();
			
			if(i<orderList.size()-1) {
				itemList+=orderList.get(i).getProductName()+",";
				itemsNo+=orderList.get(i).getProductNo()+",";
				itemsQuantity+=orderList.get(i).getAmount()+",";
			}else {
				itemList+=orderList.get(i).getProductName(); //마지막에 추가되는 상품뒤에는 구분자 붙이지 않는 조건문
				itemsNo+=orderList.get(i).getProductNo();
				itemsQuantity+=orderList.get(i).getAmount();
			}
			
			totalPrice=(price-(price/discount)*amount);
		}
		
		mv.addObject("itemsNo",itemsNo);
		mv.addObject("itemsQuantity",itemsQuantity);
		mv.addObject("itemList",itemList);
		mv.addObject("totalPrice",totalPrice);
		mv.addObject("shipInfo",shipInfo);
		mv.addObject("orderList",orderList);
		mv.setViewName("shop/orderPage");
		return mv;
	}
	
	@PostMapping("insertOrderInfo.sp")
	@ResponseBody
	public int insertOrderInfo(POrderInfo orderInfo) {
		
		int result=shopService.insertOrderInfo(orderInfo);
		
		return result;
	}
	
	@GetMapping("orderConfirm/{merchantUid}")
	public ModelAndView orderConfirm(@PathVariable String merchantUid,ModelAndView mv) {
		
		POrderInfo orderInfo = shopService.selectOrder(merchantUid);
		
		String itemList =orderInfo.getItems();
		String itemQuantity =orderInfo.getItemsQuantity();
		
		String[] itemListArr = itemList.split(",");
		String[] itemQuantityArr = itemQuantity.split(",");
		
		mv.addObject("itemList",itemListArr);
		mv.addObject("itemQuantity",itemQuantityArr);
		mv.addObject("orderInfo",orderInfo);
		mv.setViewName("shop/orderConfirm");
		
		return mv;
	}
	
	@GetMapping("orderList/{userNo}")
	public ModelAndView orderInfoList(ModelAndView mv,@PathVariable int userNo) {
		
		ArrayList<POrderInfo> orderList = shopService.selectOrderList(userNo);
		
		mv.addObject("orderList",orderList);
		mv.setViewName("shop/orderList");
		return mv;
	}
	
	@PostMapping("insertShipInfo.sp")
	@ResponseBody
	public int insertShipInfo(ShipInfo s) {
		
		int result = shopService.insertShipInfo(s);
		
		return result;
	}
	
	@GetMapping("selectShipInfoList.sp")
	@ResponseBody
	public ArrayList<ShipInfo> selectShipInfoList(@RequestParam int userNo){
		
		ArrayList<ShipInfo> sList = shopService.selectShipInfoList(userNo);
		
		return sList;
	}
	
	@PostMapping("changeShipInfo.sp")
	@ResponseBody
	public int changeShipInfo(ShipInfo s) {
		
		int result =shopService.changeShipInfo(s);
		
		return result;
	}
	
	@PostMapping("removeShipInfo.sp")
	@ResponseBody
	public int removeShipInfo(ShipInfo s) {
		
		int result =shopService.removeShipInfo(s);
		
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
