package com.itwill.shape.repository;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import javax.print.SimpleDoc;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.itwill.shape.domain.InfoFaQ;
import com.itwill.shape.domain.MeetInfo;
import com.itwill.shape.domain.MeetPrtcp;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp/WEB-INF/application-context.xml" }
)
public class MtCreateRepositoryTest {
	
	@Autowired
	private MeetInfoRepository mtCreateRepository;
	
	@Autowired
	private MeetPrtcpRepository meetDetailRepository; 
	
	//@Test // create
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
				.mt_cost("test")
				.mt_cost_info("mtInfo Junit test")
				.content("mtInfo Junit test")
				.build();
		log.info(mtInfo.toString());
		
		int result = mtCreateRepository.insert(mtInfo);
		log.info("mtInfo = {}", mtInfo);
	}
	
	//@Test //delete
	public void testDeleteMeet() {
		int result = mtCreateRepository.delete(1);
		Assertions.assertEquals(1, result);
	}
	
	//@Test //update
	public void testUpdateMeet() {
		MeetInfo mtInfo = MeetInfo.builder()
				.mtid(2)
				.title("test")
				.mt_date("2023/06/02")
				.mt_time("10:41")
				.mt_cost("5000")
				.mt_cost_info("대외비")
				.content("환영합니다")
				.build();
		log.info("mtInfo = {}", mtInfo);
		
		int result = mtCreateRepository.update(mtInfo);
		Assertions.assertEquals(1, result);
	}
	
//	@Test
	public void testCreatePrtcp() {
		assertNotNull(meetDetailRepository);
		log.info("MeetDetailRepository = {}" , meetDetailRepository);
		
		MeetPrtcp mtPrtcp = MeetPrtcp.builder()
				.mtid(3)
				.prtcp_id("admin")
				.name("어드민")
				.gender("F")
				.phone(0)
				.email("test")
				.build();
		log.info(mtPrtcp.toString());
		
		int result = meetDetailRepository.prtcpInsert(mtPrtcp);
		log.info("mtInfo = {}", mtPrtcp);
	}
	
//	@Test
	public void testSelectPrtcpList() {
		List<MeetPrtcp> list = meetDetailRepository.prtcpList(2);
        for (MeetPrtcp p : list) {
            log.info(p.toString());
        }	
    }
	
//	@Test
	public void testUserInfoSelect() {
		List<MeetPrtcp> list = meetDetailRepository.prtcpList(2);
        for (MeetPrtcp p : list) {
            log.info(p.toString());
        }	
	}
	
//	@Test // 참여취소 테스트
	public void testDeletePrtcp() {
		int result = meetDetailRepository.prtcpDelete("admin");
	}
	
	
}
