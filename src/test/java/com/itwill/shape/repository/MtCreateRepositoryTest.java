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
	
	@Test // create
	public void testCreateMeet() {
		assertNotNull(mtCreateRepository);
		log.info("mtCreateRepository = {}" , mtCreateRepository);
		
		MeetInfo mtInfo = MeetInfo.builder()
				.crtr_id("test2")
				.title("뭐 쓰지")
				.category("취미")
				.sido("경기도")
				.sigungu("어딘가")
				.location("수영장")
				.mt_date("20230605")
				.mt_time("1212")
				.ed_date("20230605")
				.nm_ppl(5)
				.mt_cost("5000")
				.mt_cost_info("커피")
				.content("집")
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
