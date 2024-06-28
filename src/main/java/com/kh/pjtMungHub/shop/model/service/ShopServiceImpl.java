package com.kh.pjtMungHub.shop.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.pjtMungHub.shop.model.dao.ShopDao;
import com.kh.pjtMungHub.shop.model.vo.Attachment;
import com.kh.pjtMungHub.shop.model.vo.Brand;
import com.kh.pjtMungHub.shop.model.vo.Cart;
import com.kh.pjtMungHub.shop.model.vo.Category;
import com.kh.pjtMungHub.shop.model.vo.POrderInfo;
import com.kh.pjtMungHub.shop.model.vo.ParameterVo;
import com.kh.pjtMungHub.shop.model.vo.Product;
import com.kh.pjtMungHub.shop.model.vo.ShipInfo;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ShopDao shopDao;
	
	@Override
	public ArrayList<Product> selectProductList() {
		
		return shopDao.selectProductList(sqlSession);
	}

	@Override
	public Product selectProductDetail(int productNo) {
		// TODO Auto-generated method stub
		return shopDao.selectProductDetail(sqlSession,productNo);
	}

	@Override
	public ArrayList<Category> selectCategory() {
		// TODO Auto-generated method stub
		return shopDao.selectCategory(sqlSession);
	}
	
	@Override
	public ArrayList<Brand> selectBrand() {
		// TODO Auto-generated method stub
		return shopDao.selectBrand(sqlSession);
	}


	@Override
	@Transactional
	public int insertProduct(Product p, ParameterVo fileParameter) {

		int result=shopDao.insertProduct(sqlSession, p);
		int result2=shopDao.insertAttachment(sqlSession, fileParameter);
		
		return result*result2;
	}

	@Override
	public int addCart(Cart c) {
		// TODO Auto-generated method stub
		return shopDao.addCart(sqlSession,c);
	}

	@Override
	public ArrayList<Cart> selectCartList(int userNo) {
		// TODO Auto-generated method stub
		return shopDao.selectCartList(sqlSession,userNo);
	}

	@Override
	public int removeCartItem(ParameterVo parameter) {
		// TODO Auto-generated method stub
		return shopDao.removeCartItem(sqlSession,parameter);
	}

	@Override
	public int updateCartAmount(ParameterVo parameter) {
		// TODO Auto-generated method stub
		return shopDao.updateCartAmount(sqlSession,parameter);
	}

	@Override
	@Transactional
	public int insertShipInfo(ShipInfo s) {
		// TODO Auto-generated method stub
		
		int result1= shopDao.chooseShipInfo(sqlSession,s);
		int result2 = shopDao.insertShipInfo(sqlSession,s);
		return result1*result2;
	}

	@Override
	public ArrayList<ShipInfo> selectShipInfoList(int userNo) {
		// TODO Auto-generated method stub
		return shopDao.selectShipInfoList(sqlSession,userNo);
	}



	@Override
	public ArrayList<Cart> selectCartItemList(ParameterVo parameter) {
		// TODO Auto-generated method stub
		return shopDao.selectCartItemList(sqlSession,parameter);
	}

	@Override
	public ShipInfo selectShipInfo(int userNo) {
		// TODO Auto-generated method stub
		return shopDao.selectShipInfo(sqlSession, userNo);
	}

	@Override
	public POrderInfo selectOrder(String merchantUid) {
		// TODO Auto-generated method stub
		return shopDao.selectOrder(sqlSession, merchantUid);
	}

	@Override
	public int insertOrderInfo(POrderInfo orderInfo) {
		// TODO Auto-generated method stub
		return shopDao.insertOrderInfo(sqlSession,orderInfo);
	}

	@Override
	public ArrayList<POrderInfo> selectOrderList(int userNo) {
		// TODO Auto-generated method stub
		return shopDao.selectOrderList(userNo);
	}

	@Override
	public int removeShipInfo(ShipInfo s) {
		// TODO Auto-generated method stub
		
		int result=shopDao.removeShipInfo(sqlSession, s);
		
		
		ShipInfo s2=shopDao.selectShipInfo2(sqlSession, s.getUserNo());
			
		int result2=shopDao.changeShipInfo(sqlSession, s2);
		return result*result2;	
				
	}
	
	@Override
	public int changeShipInfo(ShipInfo s) {
		// TODO Auto-generated method stub
		return shopDao.changeShipInfo(sqlSession,s);
	}


}
