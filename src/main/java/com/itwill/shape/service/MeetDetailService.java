package com.itwill.shape.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.MeetInfo;
import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.domain.MeetPrtcp;
import com.itwill.shape.domain.UserInfo;
import com.itwill.shape.dto.MeetLikeDto;
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
			
			long count = meetLikeRepository.selectMeetlikeCountWithMtid(mtid);
			
			List<MeetLike> meetLikeList = meetLikeRepository.selectMeetLikeListByMtid(mtid);

			dto.setPrtcpDtoList(list); // 참여자 정보	
			
			dto.setUserHost(result); // 작성자 정보
			
			dto.setMeetlikecount(count); // 찜 갯수
			
			dto.setMeetLikeId(meetLikeList); // 찜 누른 인간들....
			
			return dto;
			
		}
		
		/**
		 * 모임 참여하기
		 * @param dto
		 * @return
		 */
		
		// 참여하기 클릭
		public int create(MeetPrtcpCreateDto dto) {
			log.info("create(dto={})");
			return meetPrtcpRepository.Prtcpinsert(dto.toEntity());
		}
		// 참여 취소
		public int delete(long mtid, String id) {
			log.info("delete(mtid={}, id = {})", mtid, id);
			return meetPrtcpRepository.Prtcpdelete(mtid, id);
		}
		
		/**
		 * 모임 찜하
		 */
		
		// 찜수 
		
		public int meetLikeCreate(MeetLikeDto dto) {
			log.info("likeCreate(dtos={})", dto);
			return meetLikeRepository.likeCreate(dto.toEntity());
		}
		
		public int meetLikeDelete(long mtid, String id) {
			log.info("LikeCountDelete(mtid = {}, id = {})", mtid, id);
			
			return meetLikeRepository.likeDelete(mtid, id);
		}
		
		
		


		
}
