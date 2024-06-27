package com.kh.pjtMungHub.shop.model.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.kh.pjtMungHub.shop.model.vo.Attachment;
import com.kh.pjtMungHub.shop.model.vo.Brand;
import com.kh.pjtMungHub.shop.model.vo.Cart;
import com.kh.pjtMungHub.shop.model.vo.Category;
import com.kh.pjtMungHub.shop.model.vo.ParameterVo;
import com.kh.pjtMungHub.shop.model.vo.Product;
import com.kh.pjtMungHub.shop.model.vo.ShipInfo;

public interface ShopService {

	ArrayList<Product> selectProductList();


	Product selectProductDetail(int productNo);


	int insertProduct(Product p, ParameterVo fileParameter);


	ArrayList<Category> selectCategory();


	ArrayList<Brand> selectBrand();


	int addCart(Cart c);


	ArrayList<Cart> selectCartList(int userNo);


	int removeCartItem(ParameterVo parameter);


	int updateCartAmount(ParameterVo parameter);


	int insertShipInfo(ShipInfo s);


	ArrayList<ShipInfo> selectShipInfoList(int userNo);


	int changeShipInfo(ShipInfo s);


	ArrayList<Cart> selectOrderList(ParameterVo parameter);


	ShipInfo selectShipInfo(int userNo); 
}
