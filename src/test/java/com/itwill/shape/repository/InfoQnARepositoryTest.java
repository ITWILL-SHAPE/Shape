package com.itwill.shape.repository;
// 지현 큐앤에이 
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/application-context.xml"}
		)
public class InfoQnARepositoryTest {

	@Autowired
	private InfoQnARepository infoQnARepository;
	
	@Test
	public void testInfoQnARepository() {
		Assertions.assertNotNull(infoQnARepository);
		log.info("infoQnARepository = {}",infoQnARepository);
	}
}
