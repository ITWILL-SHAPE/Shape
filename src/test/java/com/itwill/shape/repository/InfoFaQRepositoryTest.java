package com.itwill.shape.repository;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.itwill.shape.domain.InfoFaQ;
import com.itwill.shape.dto.InfoFaQDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp/WEB-INF/application-context.xml" }
)
public class InfoFaQRepositoryTest {
	
	@Autowired
	private InfoFaQRepository infoFaQRepository;
	
	//@Test //create
	public void testCreateFaq() {
		assertNotNull(infoFaQRepository);
		log.info("infoFaQRepository = {}", infoFaQRepository);
		
		InfoFaQ faq = InfoFaQ.builder()
				.question("faq Junit test")
				.answer("faq Junit test")
				.build();
		log.info(faq.toString());
		
		int result = infoFaQRepository.insert(faq);
		assertEquals(1, result);
		log.info("result = {}", result);
	}
	
	//@Test //read
	public void testReadFaq() {
		List<InfoFaQDto> list = infoFaQRepository.selectOrderByFid();
		for(InfoFaQDto x : list) {
			log.info(x.toString());
		}
	}
	
	//@Test //update
	public void testUpdateFaq() {
		InfoFaQ faq = InfoFaQ.builder()
				.fid(2)
				.question("질문 수정 test")
				.answer("답변 수정 test")
				.build();
		log.info("faq = {}", faq);
		
		int result = infoFaQRepository.updateFaQ(faq);
		Assertions.assertEquals(1, result);
	}
	
	@Test //delete
	public void testDeleteFaq() {
		int result = infoFaQRepository.deleteByFid(3);
		Assertions.assertEquals(1, result);
	}
	
}
