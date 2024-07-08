package com.kh.pjtMungHub.shop.model.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.kh.pjtMungHub.shop.model.vo.Attachment;
import com.kh.pjtMungHub.shop.model.vo.Brand;
import com.kh.pjtMungHub.shop.model.vo.Cart;
import com.kh.pjtMungHub.shop.model.vo.Category;
import com.kh.pjtMungHub.shop.model.vo.Favorite;
import com.kh.pjtMungHub.shop.model.vo.POrderInfo;
import com.kh.pjtMungHub.shop.model.vo.ParameterVo;
import com.kh.pjtMungHub.shop.model.vo.Product;
import com.kh.pjtMungHub.shop.model.vo.Review;
import com.kh.pjtMungHub.shop.model.vo.ScorePercent;
import com.kh.pjtMungHub.shop.model.vo.ShipInfo;

public interface ShopService {

	ArrayList<Product> selectProductList(String status);


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


	ArrayList<Cart> selectCartItemList(ParameterVo parameter);


	ShipInfo selectShipInfo(int userNo);


	POrderInfo selectOrder(String merchantUid);


	int insertOrderInfo(POrderInfo orderInfo);


	ArrayList<POrderInfo> selectOrderList(int userNo);


	int removeShipInfo(ShipInfo s);


	int selectCartCount(int userNo);


	int stopItemPost(ParameterVo parameter);


	ArrayList<Attachment> selectAttachmentList(ParameterVo parameter);


	int deleteProductData(int productNo);


	int updateAttachment(ParameterVo parameter);


	int updateProduct(Product p);



	int deleteAttachment(ParameterVo parameter);


	Favorite selectFavorite(ParameterVo parameter);


	int convertFavorite(Favorite favor);


	int insertReview(Review review, ParameterVo fileParameter);


	int selectReviewCount(int productNo);


	ArrayList<ScorePercent> selectScorePercent(int productNo);


	double selectScoreAvg(int productNo);



	ArrayList<Review> selectReviewList(ParameterVo parameter2);


	Attachment selectAttachment(ParameterVo parameter);


	ArrayList<Favorite> selectFavoriteList(ParameterVo parameter);



}
