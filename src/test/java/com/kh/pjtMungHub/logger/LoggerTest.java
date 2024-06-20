package com.kh.pjtMungHub.logger;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.pjtMungHub.kindergartenMap.model.vo.MapVO;
import com.kh.pjtMungHub.pet.model.vo.Pet;

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
		int ownerNo = 1;
		Pet pet = sqlSession.selectOne("kindergartenMapper.selectPet",ownerNo);
		log.debug("강아지 정보 : {}",pet);
		
		int kindNo = 69;
		MapVO kindergarten = sqlSession.selectOne("kindergartenMapper.selectKindergarten",kindNo);
		log.debug("유치원 정보 : {}",kindergarten);
	}
	
}
