package com.kh.pjtMungHub.petcare.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pjtMungHub.common.model.vo.PageInfo;
import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.petcare.model.vo.AvailableTimes;
import com.kh.pjtMungHub.petcare.model.vo.Certification;
import com.kh.pjtMungHub.petcare.model.vo.Environment;
import com.kh.pjtMungHub.petcare.model.vo.House;
import com.kh.pjtMungHub.petcare.model.vo.HousePrice;
import com.kh.pjtMungHub.petcare.model.vo.HouseReservation;
import com.kh.pjtMungHub.petcare.model.vo.Payment;
import com.kh.pjtMungHub.petcare.model.vo.PetSitter;
import com.kh.pjtMungHub.petcare.model.vo.Price;
import com.kh.pjtMungHub.petcare.model.vo.Reservation;
import com.kh.pjtMungHub.petcare.model.vo.SupplyGuide;

@Repository
public class PetCareDao {

	//날짜,시간 지정시 펫시터 리스트형태로 불러오기
	public ArrayList<PetSitter> selectSitter(SqlSessionTemplate sqlSession, AvailableTimes at) {
		return (ArrayList)sqlSession.selectList("petcareMapper.selectSitter");
	}
	
	//요금테이블에서 가격정보 가져오기
	public Price priceTable(SqlSessionTemplate sqlSession, AvailableTimes at) {
		return sqlSession.selectOne("petcareMapper.priceTable",at);
	}

	//예약정보 저장하기
	public int enrollReservation(SqlSessionTemplate sqlSession, Reservation re) {
		return sqlSession.insert("petcareMapper.enrollReservation",re);
	}

	//펫시터 정보 가져오기
	public PetSitter sitterInfo(SqlSessionTemplate sqlSession, Reservation re) {
		return sqlSession.selectOne("petcareMapper.sitterInfo",re);
	}
	
	//예약번호 가져오기
	public String selectReservationId(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.selectOne("petcareMapper.selectReservationId",payment);
	}

	//결제정보 저장하기
	public int insertPayment(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.insert("petcareMapper.insertPayment",payment);
	}

	//결제내역 보여주기
	public Payment payDetail(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.selectOne("petcareMapper.payDetail",payment);
	}

	//장기돌봄 집리스트 조건부로 불러오기
	public ArrayList<House> selectHouseList(SqlSessionTemplate sqlSession, HouseReservation houseRe,PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset =(pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("petcareMapper.selectHouseList",houseRe,rowBounds);
	}

	//페이징바처리에 필요한 집 리스트 갯수
	public int listCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("petcareMapper.listCount");
	}

	//집 상세정보
	public House detailHouse(SqlSessionTemplate sqlSession, int houseNo) {
		return sqlSession.selectOne("petcareMapper.detailHouse",houseNo);
	}

	//집 요금정보
	public ArrayList<HousePrice> selectHousePrice(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("petcareMapper.selectHousePrice");
	}

	//인증정보
	public ArrayList<Certification> selectCertification(SqlSessionTemplate sqlSession, int houseNo) {
		return (ArrayList)sqlSession.selectList("petcareMapper.selectCertification",houseNo);
	}

	//환경정보
	public ArrayList<Environment> selectEnvironment(SqlSessionTemplate sqlSession, int houseNo) {
		return (ArrayList)sqlSession.selectList("petcareMapper.selectEnvironment",houseNo);
	}

	//지원서비스 정보
	public ArrayList<SupplyGuide> selectSupplyGuide(SqlSessionTemplate sqlSession, int houseNo) {
		return (ArrayList)sqlSession.selectList("petcareMapper.selectSupplyGuide",houseNo);
	}

	

	

	

}
