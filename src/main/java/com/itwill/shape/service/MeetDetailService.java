package com.itwill.shape.service;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
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
	private final MeetInfoRepository meetInfoRepository; // 작성한 내용 
	private final MeetLikeRepository meetLikeRepository; // 찜수
	private final MeetPrtcpRepository meetPrtcpRepository; // 참여자 정보 
	
		/**
		 * 리스트 페이지
		 */
		public MeetMainDetailDto detailByMtid(long mtid) { // 상세페이지
			log.info("detail(mtid={})" , mtid);
			
			MeetMainDetailDto dto = MeetMainDetailDto.fromEntity(meetInfoRepository.detailByMtid(mtid)); // 작성한 글 상세페이지
			log.info("dto={}", dto);
			
			List<MeetPrtcp> list = meetPrtcpRepository.selectPrtcpList(mtid); // 참여자 정보 리스트
			log.info(list.toString());
			
			UserInfo result = meetPrtcpRepository.getUserInfo(dto.getCrtr_id()); // 작성자 USER 정보
			log.info(result.toString());
			
			long count = meetLikeRepository.selectMeetlikeCountWithMtid(mtid); // 찜 개수
			
			List<MeetLike> meetLikeList = meetLikeRepository.selectMeetLikeListByMtid(mtid); // 찜 누른 사람들 리스트
			
			long prtcpcount = meetPrtcpRepository.selectNumberPrtcpMtid(mtid); // 참여자 인원수

			dto.setPrtcpDtoList(list); // 참여자 정보	
			
			dto.setUserHost(result); // 작성자 정보
			
			dto.setMeetlikecount(count); // 찜 갯수
			
			dto.setMeetLikeId(meetLikeList); // 찜 누른 인간들....
			
			dto.setMeetNumberPrtcp(prtcpcount); // 참여자 인원수
			
			// 바이트를 인코딩한 String으로 반환
			if(dto.getImg_1() != null) {
				byte[] imgByte1 = Base64.getEncoder().encode(dto.getImg_1());
				try {
					dto.setFile1(new String(imgByte1, "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			if(dto.getImg_2() != null) {
				byte[] imgByte2 = Base64.getEncoder().encode(dto.getImg_2());
				try {
					dto.setFile2(new String(imgByte2, "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			if(dto.getImg_3() != null) {
				byte[] imgByte3 = Base64.getEncoder().encode(dto.getImg_3());
				try {
					dto.setFile3(new String(imgByte3, "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			if(dto.getImg_4() != null) {
				byte[] imgByte4 = Base64.getEncoder().encode(dto.getImg_4());
				try {
					dto.setFile4(new String(imgByte4, "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			if(dto.getImg_5() != null) {
				byte[] imgByte5 = Base64.getEncoder().encode(dto.getImg_5());
				try {
					dto.setFile5(new String(imgByte5, "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			
			/*
			byte[] imgByte2 = Base64.getEncoder().encode(dto.getImg_2());
			byte[] imgByte3 = Base64.getEncoder().encode(dto.getImg_3());
			byte[] imgByte4 = Base64.getEncoder().encode(dto.getImg_4());
			byte[] imgByte5 = Base64.getEncoder().encode(dto.getImg_5());
			*/
			/*
			try {
				dto.setFile1(new String(imgByte1, "UTF-8"));
				/*
				dto.setFile2(new String(imgByte2, "UTF-8"));
				dto.setFile3(new String(imgByte3, "UTF-8"));
				dto.setFile4(new String(imgByte4, "UTF-8"));
				dto.setFile5(new String(imgByte5, "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			*/
			
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
		
		// 찜수 +1	
		public int meetLikeCreate(MeetLikeDto dto) {
			log.info("likeCreate(dtos={})", dto);
			return meetLikeRepository.likeCreate(dto.toEntity());
		}
		// 찜수 -1	
		public int meetLikeDelete(long mtid, String id) {
			log.info("LikeCountDelete(mtid = {}, id = {})", mtid, id);
			
			return meetLikeRepository.likeDelete(mtid, id);
		}
		
		
		


		
}
