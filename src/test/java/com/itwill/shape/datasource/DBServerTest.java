package com.itwill.shape.datasource;

import org.junit.jupiter.api.extension.ExtendWith;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
	locations = { "file:src/main/webapp/WEB-INF/application-context.xml" }
)
public class DBServerTest {
	
	@Autowired
	@Qualifier("hikariConfig")
	private HikariConfig config;
	
	@Autowired
	private HikariDataSource ds;
	
	@Autowired
	private SqlSessionFactoryBean sessionFactory;

}
