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
import com.itwill.shape.dto.MeetMainDetailDto;

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
	
//	@Test // 상세페이지에서 참여를 누를경우 참여자 정보
	public void testCreatePrtcp() {
		assertNotNull(meetDetailRepository);
		log.info("MeetDetailRepository = {}" , meetDetailRepository);
		
		MeetPrtcp mtPrtcp = MeetPrtcp.builder()
				.mtid(62)
				.prtcp_id("test2")
				.name("test2")
				.gender("M")
				.phone(01011112222)
				.email("test2@test2.com")
				.build();
		log.info(mtPrtcp.toString());
		
		int result = meetDetailRepository.Prtcpinsert(mtPrtcp);
		log.info("mtInfo = {}", mtPrtcp);
	}
	
//	 @Test  //MTID를 선택한 user들의 참여자 정보 검색
	public void testSelectPrtcpList() {
		List<MeetPrtcp> list = meetDetailRepository.selectPrtcpList(47); // 파라미터 MTID 번호 -> 소모임들중 어떤 소모임 글인지
        for (MeetPrtcp p : list) {
            log.info(p.toString());
        }	
    }
	 
	
//	@Test // 참여취소 테스트 user가 참여 취소 누르실 
	public void testDeletePrtcp() {
		int result = meetDetailRepository.Prtcpdelete("test2"); //prtcpId 값을 써줘야함
		System.out.println(result);
	}
	
	
	
	//	@Test // 리스트에 상세페이지 누르면 나오는 페이지 
	public void testdetailByMtid() {
//		MeetMainDetailDto result = mtCreateRepository.detailByMtid(46);
//			System.out.println(result);
		
		
	}
	
}
