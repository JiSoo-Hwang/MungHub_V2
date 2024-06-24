package com.kh.pjtMungHub.logger;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.pjtMungHub.kindergarten.model.vo.Registration;
import com.kh.pjtMungHub.kindergarten.model.vo.Vaccine;
import com.kh.pjtMungHub.petcare.model.vo.Reservation;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		  "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		  "file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
public class LoggerTest {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Test
	public void test1() {
//		int ownerNo = 1;
//		int userNo = 1;
//		Registration registration = Registration.builder()
//												.reservNo(8)
//												.reason("제가 감당하기엔 너무 버거운 멍멍이네요,,,")
//												.build();
//		
//		int result = sqlSession.update("kindergartenMapper.rejectReg",registration);
//		log.debug("수정 되었는가? : {}",result);
		ArrayList<Vaccine>vacList = new ArrayList<Vaccine>();
		Vaccine v = Vaccine.builder()
							.petNo("8")
							.originName("D_1.jpg")
							.changeName("2024062116375136931.jpg")
							.build();
		vacList.add(v);
		int result = 1;
		for(Vaccine vac:vacList) {
			result *= sqlSession.insert("kindergartenMapper.insertVac",vac);
		}
		
		log.debug("입력되었는가? : {}",result);
//		Registration registration = Registration.builder()
//												.petIntro("귀여운 댕댕이")
//												.petNote("귀여워쥬금")
//												.originName("D_6.jpg")
//												.changeName("2024062116375136931.jpg")
//												.reservNo(2)
//												.build();
//		int updateResult = sqlSession.update("kindergartenMapper.updateRegistration",registration);
//		log.debug("수정 되었는가? :{}",updateResult);
		
//		int reservNo = 9;						
//		int result = sqlSession.delete("kindergartenMapper.deleteRegistration",reservNo);
//		log.debug("삭제 되었는가? :{}",result);
		
//		ArrayList<Registration> regList = (ArrayList)sqlSession.selectList("kindergartenMapper.selectRegList2",userNo);
//		for (Registration reg : regList) {
//			log.debug("예약 목록 : {}",reg);
//		}
//		ArrayList<Kindergarten> kindergartenList = new ArrayList<Kindergarten>();
//		for(int i=0; i<regList.size();i++) {
//			kindergartenList.add(sqlSession.selectOne("kindergartenMapper.selectKindergarten",regList.get(i).getKindNo()));
//			
//		}
//		for(Kindergarten mv : kindergartenList) {
//			log.debug("유치원 목록 : {}",mv);
//		}
//		Pet pet = sqlSession.selectOne("kindergartenMapper.selectPet",ownerNo);
//		log.debug("강아지 정보 : {}",pet);
//		
//		int kindNo = 69;
//		Kindergarten kindergarten = sqlSession.selectOne("kindergartenMapper.selectKindergarten",kindNo);
//		log.debug("유치원 정보 : {}",kindergarten);
	}
	
}
