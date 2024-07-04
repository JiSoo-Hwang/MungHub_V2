package com.kh.pjtMungHub.shop.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.kh.pjtMungHub.shop.model.service.ShopService;
import com.kh.pjtMungHub.shop.model.vo.Attachment;
import com.kh.pjtMungHub.shop.model.vo.Brand;
import com.kh.pjtMungHub.shop.model.vo.Cart;
import com.kh.pjtMungHub.shop.model.vo.Category;
import com.kh.pjtMungHub.shop.model.vo.Favorite;
import com.kh.pjtMungHub.shop.model.vo.POrderInfo;
import com.kh.pjtMungHub.shop.model.vo.ParameterVo;
import com.kh.pjtMungHub.shop.model.vo.Product;
import com.kh.pjtMungHub.shop.model.vo.Review;
import com.kh.pjtMungHub.shop.model.vo.ShipInfo;


@Controller
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	@GetMapping("list.sp")
	public ModelAndView ShopList(ModelAndView mv) {
		
		ArrayList<Product> pList = shopService.selectProductList("Y"); 
		for(int i=0; i<pList.size();i++) {
			pList.get(i).setReviewCount(shopService.selectReviewCount(pList.get(i).getProductNo()));
			pList.get(i).setReviewTScore((double)shopService.selectScoreAvg(pList.get(i).getProductNo()));
		}
		
		mv.addObject("pList", pList);
		mv.setViewName("shop/shopListView");
	
		
		return mv;
	}
	
	@GetMapping("notPosted.sp")
	public ModelAndView notPostedList(ModelAndView mv) {
		
		ArrayList<Product> pList = shopService.selectProductList("N");
		
		mv.addObject("notPostList","N");
		mv.addObject("pList",pList);
		mv.setViewName("/shop/shopListView");
		return mv;
	}
	
	@PostMapping("delete.sp")
	@ResponseBody
	public int deleteProductData(int productNo) {
		
		int result=shopService.deleteProductData(productNo);
		
		
		return result;
	}
	
	@GetMapping("detail.sp/{productNo}")
	public ModelAndView ShopDetail(@PathVariable int productNo,
									ModelAndView mv) {
		
		Product p=shopService.selectProductDetail(productNo);
		ArrayList<Product> pList = shopService.selectProductList("Y"); 
		ParameterVo parameter = ParameterVo.builder().justifying("product").number(productNo).build();
		ArrayList<Attachment> atList= shopService.selectAttachmentList(parameter);
		ArrayList<Integer> percent=shopService.selectScorePercent(productNo);
		
		ParameterVo parameter2=ParameterVo.builder().justifying("best").productNo(productNo).build();
		ArrayList<Review> bestReviewTop4=shopService.selectReviewList(parameter2);
		
		ArrayList<ArrayList<Attachment>> reviewAt=new ArrayList<>();
		ArrayList<Attachment> rAtList=new ArrayList<>();
		ParameterVo parameter3;
		for (int i = 0; i < bestReviewTop4.size(); i++) {
			
			parameter3=ParameterVo.builder().justifying("review").number(bestReviewTop4.get(i).getReviewNo()).build();
			
			rAtList=shopService.selectAttachmentList(parameter3);
			reviewAt.add(rAtList);
		}
		
		p.setReviewCount(shopService.selectReviewCount(productNo));
		p.setReviewTScore((double)shopService.selectScoreAvg(productNo));
		
		mv.addObject("rAtList",reviewAt);
		mv.addObject("best4Review",bestReviewTop4);
		mv.addObject("percent",percent);
		mv.addObject("atList",atList);
		mv.addObject("pList", pList);
		mv.addObject("p",p);
		mv.setViewName("shop/shopDetailView");
		
		return mv;
	}
	@GetMapping("selectFavorite.sp")
	@ResponseBody
	public boolean selectFavorite(Favorite favor) {
		
		ParameterVo parameter = ParameterVo.builder()
				.userNo(favor.getUserNo())
				.productNo(favor.getProductNo())
				.justifying("Y")
				.build();
		
		Favorite fav=shopService.selectFavorite(parameter);
		
		if(fav==null) {
			parameter.setJustifying("N");
			Favorite deleteFav=shopService.selectFavorite(parameter);
			if(deleteFav!=null) {
				shopService.convertFavorite(favor);
			}
			return false;
		}else {
			return true;
		}
		
	}
	@PostMapping("subscribe.sp")
	@ResponseBody
	public int subscribe(Favorite favor) {
		
		int result=shopService.convertFavorite(favor);
		
		return result;
	}
	
	
	@GetMapping("update.sp/{productNo}")
	public ModelAndView updateProduct(@PathVariable int productNo, ModelAndView mv) {
		
		Product p=shopService.selectProductDetail(productNo);
	
		ParameterVo parameter=ParameterVo.builder().justifying("product").number(p.getProductNo()).build();
		
		ArrayList<Category> c=shopService.selectCategory();
		ArrayList<Brand> b=shopService.selectBrand();
		ArrayList<Attachment> atList=shopService.selectAttachmentList(parameter);
		
		mv.addObject("c",c);
		mv.addObject("b",b);
		mv.addObject("atList",atList);
		mv.addObject("p",p);
		mv.setViewName("shop/shopUpdateView");
		return mv;
	}
	
	@PostMapping("update.sp")
	public String updateProduct(Product p
							,MultipartFile[] upfile
							,HttpSession session) {
		
		boolean flag= false;
		String deleteFile= "";
		
		ParameterVo parameter=ParameterVo.builder().justifying("product").number(p.getProductNo()).build();
		
		ArrayList<Attachment> atList=shopService.selectAttachmentList(parameter);
		
		for(int i=0; i<upfile.length; i++) {
		if(!upfile[i].getOriginalFilename().equals("")) {
				
				if(atList.get(i).getChangeName()!=null) {
					flag = true;
					deleteFile= atList.get(i).getChangeName();
					if(flag) {
						File f= new File(session.getServletContext().getRealPath(deleteFile));
						f.delete();
					}
				}
				String changeName = saveFile(upfile[i],session,"productFile/");
				
				Attachment at=Attachment.builder().
						fileLev(i).
						originName(upfile[i].getOriginalFilename()).
						changeName(changeName).
						fileJustify("product").
						filePath("/pjtMungHub/resources/uploadFiles/shopFile/productFile/").
						productNo(p.getProductNo()).
						build();
				
				atList.add(at);
			}
		}
	    parameter.setAtList(atList);
		int result = shopService.updateAttachment(parameter);
		int result2 = shopService.updateProduct(p);
		
		
		if(result*result2>0) {
			
			return "redirect:/detail.sp/"+p.getProductNo();
		}else {
			return "redirect:/detail.sp/"+p.getProductNo();
		}
			
	}
	
	@PostMapping("deleteAttachment.sp")
	@ResponseBody
	public int deleteAttachment(Attachment at) {
		
		ParameterVo parameter= ParameterVo.builder().
				justifying("product").
				at(at).
				number(at.getProductNo())
				.build();
		
		int result=shopService.deleteAttachment(parameter);
		
		return result;
	}
	
	@GetMapping("insert.sp")
	public ModelAndView shopInsertForm(ModelAndView mv) {
		
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
	
	@PostMapping("stopPost.sp")
	public ModelAndView stopItemPost(ModelAndView mv,
									@RequestParam int productNo,
									@RequestParam String justifying) {		
		ParameterVo parameter = ParameterVo.builder()
				.justifying(justifying)
				.productNo(productNo)
				.build();
		
		int result = shopService.stopItemPost(parameter);
		
		if(result>0) {
			if(justifying.equals("Y")) {
				mv.addObject("alertMsg", "상품게시를 시작합니다.");
			}else {
				mv.addObject("alertMsg","상품게시를 중단합니다.");
			}
			mv.setViewName("redirect:/list.sp");
			return mv;
		}else {
			mv.addObject("alertMsg","요청에 실패했습니다.");
			mv.setViewName("redirect:/shopListDetail.sp"+productNo);
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
	
	@GetMapping("cartCount.sp")
	@ResponseBody
	public int selectCartCount (@RequestParam int userNo) {
		
		int result=shopService.selectCartCount(userNo);
		
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
	@GetMapping("orderDetail/{merchantUid}")
	public ModelAndView orderInfoDetail(ModelAndView mv,@PathVariable String merchantUid) {
		
		POrderInfo order = shopService.selectOrder(merchantUid);
		
		String[] items=order.getItems().split(",");
		String[] itemQuantity=order.getItemsQuantity().split(",");
		
		ArrayList<Product> itemList=new ArrayList<>();
		
		for(int i=0;i< items.length;i++) {
			int item=Integer.parseInt(items[i]);
			
			Product p=shopService.selectProductDetail(item);
			
			itemList.add(p);
		}
		
		mv.addObject("itemList",itemList);
		mv.addObject("itemQuantity",itemQuantity);
		mv.addObject("order",order);
		mv.setViewName("shop/orderDetail");
		
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
	
	@PostMapping("insertReview.sp")
	@ResponseBody
	public int insertReview(@RequestPart(value="review")Review review,
							@RequestPart(value="uploadFile",required=false) MultipartFile upfile,
							HttpSession session) {
		
		Attachment at=new Attachment();
			if(upfile!=null) {
				
			
			if(!upfile.getOriginalFilename().equals("")) {
				
				String changeName = saveFile(upfile,session,"reviewFile/"+review.getType());
				
				at=Attachment.builder().
						fileLev(0).
						originName(upfile.getOriginalFilename()).
						changeName(changeName).
						fileJustify("review").
						filePath("/pjtMungHub/resources/uploadFiles/shopFile/reviewFile/"+review.getType()+"/").
						build();
			}
			}
			ArrayList<Attachment> atList=new ArrayList<>();
			
			atList.add(at);
		
		ParameterVo fileParameter=ParameterVo.builder()
				.atList(atList)
				.justifying("review")
				.build();
		
		int result=shopService.insertReview(review,fileParameter);
		
		
		return result;
	}
	
	@GetMapping("reviewList.sp")
	@ResponseBody
	public JSONArray selectReviewList(ParameterVo param) {
		
		ParameterVo parameter=ParameterVo.builder()
				.justifying(param.getJustifying())
				.productNo(param.getProductNo())
				.amount(param.getAmount())
				.star(param.getStar())
				.build();
		ArrayList<Review> rList=shopService.selectReviewList(parameter);
		
		JSONArray reviewJArr=new JSONArray();
		
		for (int i = 0; i < rList.size(); i++) {
			ParameterVo parameter2=ParameterVo.builder()
					.justifying("review")
					.number(rList.get(i).getReviewNo())
					.build();
			ArrayList<Attachment> atList= shopService.selectAttachmentList(parameter2);
			
			JSONObject jobj=new JSONObject();
			jobj.put("atList", atList);
			jobj.put("reviewNo", rList.get(i).getReviewNo());
			jobj.put("reviewContent", rList.get(i).getReviewContent());
			jobj.put("userNo", rList.get(i).getUserNo());
			jobj.put("userName", rList.get(i).getUserName());
			jobj.put("productNo", rList.get(i).getProductNo());
			jobj.put("createDate", rList.get(i).getCreateDate());
			jobj.put("likeCount", rList.get(i).getLikeCount());
			jobj.put("score", rList.get(i).getScore());
			
			reviewJArr.add(jobj);
			
		}
	
		return reviewJArr;
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
