package com.itwill.shape.repository;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.print.SimpleDoc;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.itwill.shape.domain.MeetInfo;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp/WEB-INF/application-context.xml" }
)
public class MtCreateRepositoryTest {
	
	@Autowired
	private MtCreateRepository mtCreateRepository;
	
	@Test // create
	public void testCreateMeet() {
		assertNotNull(mtCreateRepository);
		log.info("mtCreateRepository = {}" , mtCreateRepository);
		
		MeetInfo mtInfo = MeetInfo.builder()
				.crtr_id("test1")
				.title("mtInfo Junit test")
				.category("mtInfo Junit test")
				.sido("mtInfo Junit test")
				.sigungu("mtInfo Junit test")
				.location("mtInfo Junit test")
				.mt_date("mtInfo Junit test")
				.mt_time("mtInfo Junit test")
				.ed_date("mtInfo Junit test")
				.nm_ppl(1)
				.mt_cost("mtInfo Junit test")
				.mt_cost_info("mtInfo Junit test")
				.content("mtInfo Junit test")
				.build();
		log.info(mtInfo.toString());
		
		int result = mtCreateRepository.insert(mtInfo);
		assertEquals(1, result);
		log.info("mtInfo = {}", mtInfo);
		
		
				
				
	}

}
