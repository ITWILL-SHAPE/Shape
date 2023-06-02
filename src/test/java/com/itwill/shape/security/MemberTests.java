package com.itwill.shape.security;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.itwill.shape.domain.UserInfo;
import com.itwill.shape.dto.UserCreateDto;
import com.itwill.shape.repository.UserInfoRepository;
import com.zaxxer.hikari.HikariDataSource;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/application-context.xml",
	"file:src/main/webapp/WEB-INF/security-context.xml"
})
public class MemberTests {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder passwordEncoder;
	@Setter(onMethod_ = @Autowired)
	private HikariDataSource ds;
	
	@Autowired
	private UserInfoRepository userInfoRepository;
	
	@Test
	public void testInsertMember() {
		assertNotNull(userInfoRepository);
		log.info("userInfoRepository = {}", userInfoRepository);
		
		UserCreateDto dto = UserCreateDto.builder()
										.id("test2")
										.pwd(passwordEncoder.encode("test2"))
										.name("test2")
										.gender("M")
										.phone("01011112222")
										.email("test1@test1.com")
										.build();
		log.info(dto.toString());
		
		int result = userInfoRepository.insertMember(dto.toEntityMember());
		assertEquals(1, result);
		log.info("result = {}", result);
		
	}
	
}
