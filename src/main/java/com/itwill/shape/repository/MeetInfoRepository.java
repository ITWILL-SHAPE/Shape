package com.itwill.shape.repository;

import java.util.List;
import java.util.Map;

import com.itwill.shape.domain.MeetInfo;
import com.itwill.shape.dto.MeetInfoPrtcpLikeSelectByPrtcpIdDto;
import com.itwill.shape.dto.MeetListCountDto;
import com.itwill.shape.dto.MeetMainDetailDto;
import com.itwill.shape.dto.MeetSearchListDto;
import com.itwill.shape.dto.PageMeetListDto;

// meet_info의 repository.
public interface MeetInfoRepository {

	/**
	 * 0602 정지언
	 * @param entity
	 * @return
	 */
	int insert(MeetInfo entity); // create 모임 만들기
	int update(MeetInfo entity); // update 모임 수정하기
	int deleteByMtid(long mtid); // delete 모임 삭제하기
	MeetInfo selectByMtid(long mtid); // modify
	int delete(int i);
	
	//메인페이지
	/**
	 * 메인페이지 최신순
	 * @return MeetListCountDto
	 */
	/*List<MeetListCountDto> mainSelectByRecent();*/
	
	/**
	 * 인기순
	 * @return
	 */
	/* List<MeetListCountDto> mainSelectByPopularity(); */

	
	//마이페이지
	/**
	 * 0610 손창민
	 * 내가 참여 중인 모임 목록 불러오기
	 * @param prtcpId
	 * @return
	 */
	List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> selectByPrtcpId(String prtcpId);
	
	/**
	 * 0610 손창민
	 * 내가 개설한 모임 목록 불러오기
	 * @param crtrId
	 * @return
	 */
	List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> selectByCrtrId(String crtrId);
	
	/**
	 * 0610 손창민
	 * 내가 찜한 모임 목록 불러오기
	 * @param id
	 * @return
	 */
	List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> selectById(String id);
	
	//마이페이지 끝
	
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
	 * 0612 김지민
	 * 모집 완료
	 * @return
	 */
	List<MeetListCountDto> selectOrderByMozipEnd();
	
	/**
	 * 0612 김지민
	 * 모집 중
	 * @return
	 */
	List<MeetListCountDto> selectOrderByMozipIng();
	
	/**
	 * mtid 모임 상세 페이지
	 * 배선영
	 * @param mtid
	 * @return
	 */
	// 작성 상세페이지
	MeetInfo detailByMtid(long mtid);
	
	
	List<PageMeetListDto> selectByidWithPaging(PageMeetListDto dto);
	
	// 리스트 페이징
	List<MeetListCountDto> selectBySearchPaging(MeetSearchListDto dto);
	// 페이징을 위한 개체수 카운트
	int meetInfoCount(MeetSearchListDto dto);
	
	// img_1
	//Map<byte[], Long> selectImg();
	
	List<MeetListCountDto> selectImg(long mtid);
	
}
