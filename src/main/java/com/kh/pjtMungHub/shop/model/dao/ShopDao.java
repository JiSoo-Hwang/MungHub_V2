package com.kh.pjtMungHub.shop.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.pjtMungHub.shop.model.vo.Attachment;
import com.kh.pjtMungHub.shop.model.vo.Brand;
import com.kh.pjtMungHub.shop.model.vo.Cart;
import com.kh.pjtMungHub.shop.model.vo.Category;
import com.kh.pjtMungHub.shop.model.vo.ParameterVo;
import com.kh.pjtMungHub.shop.model.vo.Product;

@Repository
public class ShopDao {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("shopMapper.selectList");
	}

	public Product selectProductDetail(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("shopMapper.selectDetail",productNo);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Category> selectCategory(SqlSessionTemplate sqlSession) { //product insert GetMapping시 조회
		return (ArrayList)sqlSession.selectList("shopMapper.selectCategory");
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Brand> selectBrand(SqlSessionTemplate sqlSession) { //product insert GetMapping시 조회
		return (ArrayList)sqlSession.selectList("shopMapper.selectBrand");
	}
	
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("shopMapper.insertProduct",p);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, ParameterVo fileParameter) { //product
		return sqlSession.insert("shopMapper.insertAttachment",fileParameter);
	}

	public int addCart(SqlSessionTemplate sqlSession, Cart c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("shopMapper.addCart",c);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("shopMapper.selectCartList",userNo);
	}

}
