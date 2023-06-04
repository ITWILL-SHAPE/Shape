package com.itwill.shape.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.dto.MeetListCountDto;
import com.itwill.shape.repository.MeetInfoRepository;
import com.itwill.shape.repository.MeetLikeRepository;
import com.itwill.shape.repository.MeetPrtcpRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MeetListService {

	private final MeetInfoRepository meetInfoRepository;
	private final MeetLikeRepository meetLikeRepository;
	
	/**
	 * 모임 최신순으로 정렬
	 * @return
	 */
	public List<MeetListCountDto> readByCreateTime() {
		log.info("readByCreateTime()");

		return meetInfoRepository.selectOrderByRecent();
	}

	/**
	 * 모임 인기순(찜 순)으로 정렬
	 * @return
	 */
	public List<MeetListCountDto> readByPopularity() {
		log.info("readByCreateTime()");

		return meetInfoRepository.selectOrderByPopularity();
	}
	
	/**
	 * 모임 제목 검색
	 * @param title
	 * @return
	 */
	public List<MeetListCountDto> readByTitle(String title) {
		log.info("readByCreateTime(title = {})", title);

		return meetInfoRepository.selectByKeyword(title);
	}
	
	
	/**
	 * 모임 sido 검색
	 * @param sido
	 * @return
	 */
	public List<MeetListCountDto> readByLocation(String sido) {
		log.info("readByCreateTime(sido = {})", sido);

		return meetInfoRepository.selectByLocation(sido);
	}
	
	
	/**
	 * 모임 카테코리 검색
	 * @param category
	 * @return
	 */
	public List<MeetListCountDto> readByCategory(String category) {
		log.info("readByCreateTime(category = {})", category);

		return meetInfoRepository.selectByCategory(category);
	}
	
	/**
	 * MTID 테이블의 ID USER의 찜 수 +1
	 * @param mtlike -> mtid, id 둘 다 필요 + 넘기기
	 * @return
	 */
	public int LikeCountUpdate(MeetLike mtlike) {
		log.info("LikeCountUpdate(mtlike = {})", mtlike);
		
		
		return meetLikeRepository.likeCreate(mtlike);
	}
	
	/**
	 * mtid 모임에 like count 감소
	 * @param mtLike -> mtid, id
	 * @return
	 */
	public int LikeCountDelete(MeetLike mtLike) {
		log.info("LikeCountDelete(mtLike = {})", mtLike);
		
		
		return meetLikeRepository.likeDelete(mtLike);
	}
	
	// 모임별 찜 수 
	public long LikeCountMtid(int mtid) {
		log.info("LikeCountMtid(mtid = {})", mtid);
		
		
		return meetLikeRepository.selectMeetlikeCountWithMtid(mtid);
	}
}
