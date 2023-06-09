package com.itwill.shape.repository;
import java.util.List;

// 지현 큐앤에이 
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.itwill.shape.domain.Criteria;
import com.itwill.shape.domain.InfoQnA;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/application-context.xml",
				"file:src/main/webapp/WEB-INF/email-context.xml",
				"file:src/main/webapp/WEB-INF/security-context.xml" }
		)
public class InfoQnARepositoryTest {

	@Autowired
	private InfoQnARepository infoQnARepository;
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		List<InfoQnA> list = infoQnARepository.getListWithPaging(cri);
		for(InfoQnA q:list) {
			log.info(q.toString());
		}
	}
	
	//@Test
	public void testSelectOrderByQidDesc() {
		List<InfoQnA> list = infoQnARepository.selectOrderByQidDesc();
		for(InfoQnA q :list) {
			log.info(q.toString());
		}
	}
	
	//@Test
	public void testDeleteByQid() {
		int result = infoQnARepository.deleteByQid(1);
		Assertions.assertEquals(1, result);
		log.info("resultOfTestDelete={}", result);
	}
	
	//@Test
	public void testUpdateAnswerToQnA() {
		InfoQnA infoQnA = InfoQnA.builder()
				.qid(21)
				.an_title("답변드립니다.")
				.an_comment("네, 모집 취소는 모임 상세창에서 가능합니다.")
				.build();
		int result = infoQnARepository.updateAnswerToQnA(infoQnA);
		Assertions.assertEquals(1, result);
		log.info("resultOfTestUpdate={}", result);
	}
	
	//@Test
	public void testSelectByQid() {
		InfoQnA result = infoQnARepository.selectByQid(1);
		Assertions.assertNotNull(result);
		log.info(result.toString());
	}
	
	//@Test
	public void testInfoQnARepository() {
		Assertions.assertNotNull(infoQnARepository);
		log.info("infoQnARepository = {}",infoQnARepository);
		InfoQnA infoQnA = InfoQnA.builder()
				.title("문의드립니다.")
				.content("모임 모집 취소 가능한가요?")
				.writer("user")
				.secret("N")
				.build();
		log.info(infoQnA.toString());
		int result = infoQnARepository.insert(infoQnA);
		Assertions.assertEquals(1, result);
		log.info("result ={}", result);
	}
}
