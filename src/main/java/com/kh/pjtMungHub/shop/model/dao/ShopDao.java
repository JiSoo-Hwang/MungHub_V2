package com.kh.pjtMungHub.shop.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pjtMungHub.shop.model.vo.Product;

@Repository
public class ShopDao {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("shopMapper.selectList");
	}

	public Product selectProductDetail(SqlSessionTemplate sqlSession, int productNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.selectDetail",productNo);
	}

}
