package com.kh.pjtMungHub.shop.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pjtMungHub.shop.model.dao.ShopDao;
import com.kh.pjtMungHub.shop.model.vo.Product;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ShopDao shopDao;
	
	@Override
	public ArrayList<Product> selectProductList() {
		// TODO Auto-generated method stub
		return shopDao.selectProductList(sqlSession);
	}

}
