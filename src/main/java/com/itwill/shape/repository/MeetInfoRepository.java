package com.itwill.shape.repository;

import java.util.List;

import com.itwill.shape.domain.MeetInfo;
import com.itwill.shape.dto.MeetListCountDto;
import com.itwill.shape.dto.MeetMainDetailDto;

// meet_info의 repository.
public interface MeetInfoRepository {

	int insert(MeetInfo entity); // create 모임 만들기
	int update(MeetInfo entity); // update 모임 수정하기
	int deleteByMtid(long mtid); // delete 모임 삭제하기
	int delete(int i);
	
	
	
	// MEET_list에서 사용할 코드들 - 김지민
	
	/**
	 * 최신순(기본)
	 * @return MeetListCountDto
	 */
	List<MeetListCountDto> selectOrderByRecent();
	
	/**
	 * 인기순
	 * @return
	 */
	List<MeetListCountDto> selectOrderByPopularity();

	/**
	 * 제목 키워드 검색 select문
	 * @param title (.value) 사용하기 
	 * @return
	 */
	List<MeetListCountDto> selectByKeyword(String title);
	
	/**
	 * 지역 검색
	 * @param sido (.value) 사용하기 
	 * @return
	 */
	List<MeetListCountDto> selectByLocation(String sido);
	
	/**
	 * 분야 검색
	 * @param category (.value) 사용하기 
	 * @return
	 */
	List<MeetListCountDto> selectByCategory(String category);
	
	
	/**
	 * mtid 모임 상세 페이지
	 * @param mtid
	 * @return
	 */
	
	// 작성 상세페이지
	List<MeetMainDetailDto> detailByMtid(long mtid);

	
	
	
	
}
