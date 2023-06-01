package com.itwill.shape.repository;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.itwill.shape.domain.UserInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
	locations = { "file:src/main/webapp/WEB-INF/application-context.xml" }
)
public class UserInfoRepositoryTest {
	
	@Autowired
	private UserInfoRepository userInfoRepository;
	
	@Test
	public void testCreateAdmin() {
		assertNotNull(userInfoRepository);
		log.info("userInfoRepository = {}", userInfoRepository);
		
		UserInfo user = UserInfo.builder()
								.id("admin")
								.pwd("admin00")
								.name("어드민")
								.build();
		log.info(user.toString());
		
		int result = userInfoRepository.insertAdmin(user);
		assertEquals(1, result);
		log.info("result={}", result);
		
	}
	

}
