package com.kh.pjtMungHub.shop.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.pjtMungHub.shop.model.vo.Attachment;
import com.kh.pjtMungHub.shop.model.vo.Brand;
import com.kh.pjtMungHub.shop.model.vo.Cart;
import com.kh.pjtMungHub.shop.model.vo.Category;
import com.kh.pjtMungHub.shop.model.vo.POrderInfo;
import com.kh.pjtMungHub.shop.model.vo.ParameterVo;
import com.kh.pjtMungHub.shop.model.vo.Product;
import com.kh.pjtMungHub.shop.model.vo.ShipInfo;

@Repository
public class ShopDao {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession, String status) {
		return (ArrayList)sqlSession.selectList("shopMapper.selectList",status);
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

	public int removeCartItem(SqlSessionTemplate sqlSession,ParameterVo parameter) {
		// TODO Auto-generated method stub
		return sqlSession.delete("shopMapper.removeCartItem",parameter);
	}

	public int updateCartAmount(SqlSessionTemplate sqlSession, ParameterVo parameter) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.updateCartAmount",parameter);
	}
	
	public int chooseShipInfo(SqlSessionTemplate sqlSession, ShipInfo s) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.chooseShipInfo",s);
	}

	public int insertShipInfo(SqlSessionTemplate sqlSession, ShipInfo s) {
		// TODO Auto-generated method stub
		return sqlSession.insert("shopMapper.insertShipInfo",s);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<ShipInfo> selectShipInfoList(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("shopMapper.selectShipInfoList", userNo);
	}

	public int changeShipInfo(SqlSessionTemplate sqlSession, ShipInfo s) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.changeShipInfo",s);
	}
	
	public int removeShipInfo(SqlSessionTemplate sqlSession, ShipInfo s) {
		// TODO Auto-generated method stub
		return sqlSession.delete("shopMapper.removeShipInfo",s);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<Cart> selectCartItemList(SqlSessionTemplate sqlSession, ParameterVo parameter) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("shopMapper.selectCartItemList",parameter);
	}

	public ShipInfo selectShipInfo(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.selectShipInfo",userNo);
	}
	public ShipInfo selectShipInfo2(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.selectShipInfo2",userNo);
	}

	

	public int insertOrderInfo(SqlSessionTemplate sqlSession, POrderInfo orderInfo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("shopMapper.insertOrderInfo",orderInfo);
	}

	public POrderInfo selectOrder(SqlSessionTemplate sqlSession, String merchantUid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.selectOrder",merchantUid);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<POrderInfo> selectOrderList(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("shopMapper.selectOrderList",userNo);
	}

	public int selectCartCount(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.selectCartCount",userNo);
	}

	public int stopItemPost(SqlSessionTemplate sqlSession, ParameterVo parameter) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.stopItemPost",parameter);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession, ParameterVo parameter) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("shopMapper.selectAttachmentList",parameter);
	}

	public int deleteProductData(int productNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.delete("shopMapper.deleteProductData",productNo);
	}

	public int updateAttachment(SqlSessionTemplate sqlSession, ParameterVo parameter) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.updateAttachment",parameter);
	}

	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.updateProduct",p);
	}

	public int deleteAttachment(SqlSessionTemplate sqlSession, ParameterVo parameter) {
		// TODO Auto-generated method stub
		return sqlSession.delete("shopMapper.deleteAttachment",parameter);
	}

	public int rearrangeAttachment(SqlSessionTemplate sqlSession, ParameterVo parameter) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.rearrangeAttachment",parameter);
	}



	


}
