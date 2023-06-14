package com.itwill.shape.repository;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.domain.MeetPrtcp;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
		locations = {
				"file:src/main/webapp/WEB-INF/application-context.xml",
				"file:src/main/webapp/WEB-INF/email-context.xml",
				"file:src/main/webapp/WEB-INF/security-context.xml"
		}
)
public class MtLikeRepositoryTest {

	@Autowired
	private MeetInfoRepository meetInfoRepository;
	
	@Autowired
	private MeetLikeRepository meetLikeRepository;
	
	@Autowired
	private MeetPrtcpRepository meetPrtcpRepository;
	
//	@Test
//	public void testLikeCreate() {
//		assertNotNull(meetLikeRepository);
//		log.info("MeetDetailRepository = {}" , meetLikeRepository);
//		
//		MeetLike mtLike = MeetLike.builder()
//				.mtid(3)
//				.id("test3")
//				.build();
//		
//		
//		log.info(mtLike.toString());
//		
//		int result = meetLikeRepository.likeInsert(mtLike.getMtid(), mtLike.getId());
//		log.info("mtInfo = {}", mtLike);
//	}
//	
////	@Test
//	public void testLikeDelete() {
//		int result = meetLikeRepository.likeDelete(3, "test3");
//	}
//	
//	
////	@Test
//	public void testLikeCount() {
//		long result = meetLikeRepository.selectMeetlikeCountWithMtid(3);
//        
//        log.info("result = {}",result);
//	}
	
//	@Test
	public void testInsertLike() {
	    assertNotNull(meetLikeRepository);
	    log.info("meetLikeRepository = {}", meetLikeRepository);

	    MeetLike mtLike = MeetLike.builder()
	            .mtid(107)
	            .id("test3")
	            .build();
	    log.info(mtLike.toString());

	    meetLikeRepository.insertLike(mtLike.getMtid(), mtLike.getId());
	    log.info("mtLike = {}", mtLike);
	
	}
	
//	@Test
	public void testDeleteLike() {
		MeetLike mtLike = MeetLike.builder()
	            .mtid(107)
	            .id("test2")
	            .build();
	    log.info(mtLike.toString());

		meetLikeRepository.deleteLike(mtLike.getMtid(), mtLike.getId());
	}
	
	@Test
	public void testGetLikeCount() {
		long likeCount = meetLikeRepository.getLikeCountByMtid(24);
		
		int result = meetLikeRepository.getLikeCountByMtid(likeCount);
		log.info("testGetLikeCount = {}", likeCount);
	}
	
}
