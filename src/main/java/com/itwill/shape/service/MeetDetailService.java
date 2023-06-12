package com.itwill.shape.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.MeetInfo;
import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.domain.MeetPrtcp;
import com.itwill.shape.domain.UserInfo;
import com.itwill.shape.dto.MeetMainDetailDto;
import com.itwill.shape.dto.MeetPrtcpCreateDto;
import com.itwill.shape.dto.UserInfoSelectByIdDto;
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
		public MeetMainDetailDto detailByMtid(long mtid) {
			log.info("detail(mtid={})" , mtid);
			
			MeetMainDetailDto dto = MeetMainDetailDto.fromEntity(meetInfoRepository.detailByMtid(mtid));
			log.info("dto={}", dto);
			
			List<MeetPrtcp> list = meetPrtcpRepository.selectPrtcpList(mtid);
			log.info(list.toString());
			
			UserInfo result = meetPrtcpRepository.getUserInfo(dto.getCrtr_id());

			dto.setPrtcpDtoList(list); // 참여자 정보	
			
			dto.setUserHost(result); // 작성자 정보
			
			return dto;
			
		}
		// 참여하기 클릭
		public int create(MeetPrtcpCreateDto dto) {
			log.info("create(dto={})");
			return meetPrtcpRepository.Prtcpinsert(dto.toEntity());
		}


		/**
		 * 상세보기 수정 페이지 modify
		 *
		/*
		 * public MeetMainDetailDto update(long mtid) {
		 * log.info("update(mtid={})",mtid);
		 * 
		 * 
		 * return null;
		 */
			
		//}
		
		/**
		 * 참여자는 따로 서비스 컨트롤러 만들었음
		 */
		
		// 찜수 
		/**
		 * MTID 테이블의 ID USER의 찜 수 +1
		 * @param mtlike -> mtid, id 둘 다 필요 + 넘기기
		 * @return
		 */
		public int LikeCountUpdate(long mtid, String id) {
			log.info("LikeCountUpdate(mtid = {}, id = {})", mtid, id);
			
			
			return meetLikeRepository.likeCreate(mtid, id);
		}
		/**
		 * mtid 모임에 like count 감소
		 * @param long mtid, String id
		 * @return
		 */
		public int LikeCountDelete(long mtid, String id) {
			log.info("LikeCountDelete(mtid = {}, id = {})", mtid, id);
			
			
			return meetLikeRepository.likeDelete(mtid, id);
		}
		
		// 모임별 찜 수 
		public long LikeCountMtid(int mtid) {
			log.info("LikeCountMtid(mtid = {})", mtid);
			
			
			return meetLikeRepository.selectMeetlikeCountWithMtid(mtid);
		}


		
}
