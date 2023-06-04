package com.itwill.shape.service;

import java.util.List;

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
		public List<MeetMainDetailDto> detailByMtid(long mtid) {
			log.info("detail(mtid={})" , mtid);
			
			List<MeetMainDetailDto> list = meetInfoRepository.detailByMtid(mtid);
			
//			return list.stream().map(MeetMainDetailDto::fromEntity).
			return null;
		}


		/**
		 * 상세보기 수정 페이지 modify
		 */
		public MeetMainDetailDto read(long mtid) {
			log.info("read(mtid={})",mtid);
			
			
			return null;
		}
		
		/**
		 * 참여자 정보 
		 */
		
		
		
		
		
		
		// 찜수 
		
}
