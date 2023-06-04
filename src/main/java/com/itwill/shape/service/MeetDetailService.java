package com.itwill.shape.service;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.MeetInfo;
import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.dto.MeetMainDetailDto;
import com.itwill.shape.repository.MeetInfoRepository;
import com.itwill.shape.repository.MeetLikeRepository;
import com.itwill.shape.repository.MeetPrtcpRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
// 상세보기 페이지 서비스
public class MeetDetailService {
	private final MeetInfoRepository meetInfoRepository;
	private final MeetLikeRepository meetLikeRepository; // 찜수
	private final MeetPrtcpRepository meetPrtcpRepository; // 참여자 정보 
	
	
		/**
		 * 리스트 페이지
		 */
		public MeetMainDetailDto read(long mtid) {
			log.info("mtid={}" , mtid);
			
			// DB MeetInfo 테이블 검색
			MeetInfo entity = meetInfoRepository.detailByMtid(mtid);
			
			// 검색 내용을 DTO로 변환
			MeetMainDetailDto detailDto = MeetMainDetailDto.fromEntity(entity);

			return detailDto;			
		}
		
		/**
		 * 참여자 정보 
		 */
		
		
		
		
		
		
		// 찜수 
		
}
