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
import com.kh.pjtMungHub.shop.model.vo.ParameterVo;
import com.kh.pjtMungHub.shop.model.vo.Product;

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

	

}
