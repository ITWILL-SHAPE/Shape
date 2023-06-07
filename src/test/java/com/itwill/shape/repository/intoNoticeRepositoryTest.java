package com.itwill.shape.repository;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.itwill.shape.domain.InfoNotice;
import com.itwill.shape.dto.InfoNoticeListDto;
import com.itwill.shape.dto.InfoNoticeCreateDto;
import com.itwill.shape.dto.InfoNoticeUpdateDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp/WEB-INF/application-context.xml" }
)
public class intoNoticeRepositoryTest {
	
	@Autowired
	private InfoNoticeRepository infoNoticeRepository;
	
	@Test // read list
	public void testReadList() {
		List<InfoNoticeListDto> list = infoNoticeRepository.selectOrderByDateDesc();
		for(InfoNoticeListDto x : list) {
			log.info(x.toString());
		}
	}
	
	//@Test //create
	public void testCreateNotice() {
		
//		infoNoticeCreateDto dto = infoNoticeCreateDto.builder()
//				.title("Junit 테스트")
//				.content("테스트")
//				.atchd_file("".getBytes())
//				.fix("N")
//				.build();
//		log.info(dto.toString());
		
		InfoNotice notice = InfoNotice.builder()
				.title("Junit 테스트 fix -1")
				.content("테스트")
				.atchd_file("".getBytes())
				.fix(-1)
				.build();
		log.info(notice.toString());
		
		int result = infoNoticeRepository.insert(notice);
		assertEquals(1, result);
		log.info("result = {}", result);
	}
	
	//@Test //detail
	public void testSelectByNid() {
		InfoNotice notice = infoNoticeRepository.selectByNid(1);
		Assertions.assertNotNull(notice);
		log.info(notice.toString());
	}
	
	@Test //update
	public void testUpdateNotice() {
		InfoNotice dto = InfoNotice.builder()
				.nid(7)
				.title("junit 수정 테스트fdfdfdfdfdfd")
				.content("공지사항 수정 테스트")
				.atchd_file("".getBytes())
				.fix(-1)
				.build();
		log.info(dto.toString());
		int result = infoNoticeRepository.updateNotice(dto);
		Assertions.assertEquals(1, result);
	}
	
	//@Test //delete
	public void testDelteNotice() {
		int result = infoNoticeRepository.deleteByNid(3);
		Assertions.assertEquals(1, result);
	}
}
