package com.itwill.shape.service;

import java.util.HashMap;
// 김지민_meet.list
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.dto.MeetInfoPrtcpLikeSelectByPrtcpIdDto;
import com.itwill.shape.dto.MeetListCountDto;
import com.itwill.shape.dto.MeetSearchListDto;
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
	 * 정지언
	 * 메인페이지 모임 최신순 보이기
	 * @return
	 */
	public List<MeetListCountDto> mainReadByRecent() {
		log.info("mainReadByRecent()");

		return meetInfoRepository.selectOrderByRecent();
	}
	
	/**
	 * 정지언
	 * 메인페이지 모임 인기순 보이기
	 * @return
	 */
	public List<MeetListCountDto> mainReadByPopularity() {
		log.info("mainReadByPopularity()");

		return meetInfoRepository.selectOrderByPopularity();
	}
	
	/**
	 * 0610 손창민
	 * 내가 참여한 모임 목록 불러오기
	 * @param prtcpId
	 * @return
	 */
	public List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> selectByPrtcpId(String prtcpId) {
		log.info("selectByPrtcpId(prtcpId={})", prtcpId);
		
		return meetInfoRepository.selectByPrtcpId(prtcpId);
	}
	/**
	 * 0610 손창민
	 * 내가 개설한 모임 목록 불러오기
	 * @param crtrId
	 * @return
	 */
	public List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> selectByCrtrId(String crtrId) {
		log.info("selectByPrtcpId(crtrId={})", crtrId);
		
		return meetInfoRepository.selectByCrtrId(crtrId);
	}
	/**
	 * 0610 손창민
	 * 내가 찜한 모임 목록 불러오기
	 * @param id
	 * @return
	 */
	public List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> selectById(String id) {
		log.info("selectById(id={})", id);
		
		return meetInfoRepository.selectById(id);
	}
	
	/**
	 * 김지민
	 * 모임 최신순으로 정렬
	 * @return
	 */
	public List<MeetListCountDto> readByCreateTime() {
		log.info("readByCreateTime()");

		return meetInfoRepository.selectOrderByRecent();
	}

	/**
	 * 김지민
	 * 모임 인기순(찜 순)으로 정렬
	 * @return
	 */
	public List<MeetListCountDto> readByPopularity() {
		log.info("readByCreateTime()");

		return meetInfoRepository.selectOrderByPopularity();
	}
	
	/**
	 * 김지민
	 * 모임 제목 검색
	 * @param title
	 * @return
	 */
	public List<MeetListCountDto> readByTitle(String title) {
		log.info("readByCreateTime(title = {})", title);

		return meetInfoRepository.selectByKeyword(title);
	}
	
	
	/**
	 * 김지민
	 * 모임 sido 검색
	 * @param sido
	 * @return
	 */
	public List<MeetListCountDto> readByLocation(String sido) {
		log.info("readByCreateTime(sido = {})", sido);

		return meetInfoRepository.selectByLocation(sido);
	}
	
	
	/**
	 * 김지민
	 * 모임 카테코리 검색
	 * @param category
	 * @return
	 */
	public List<MeetListCountDto> readByCategory(String category) {
		log.info("readByCreateTime(category = {})", category);

		return meetInfoRepository.selectByCategory(category);
	}
	
	
	
	/**
	 * 0612 김지민
	 * 모임 중 
	 * @return
	 */
	public List<MeetListCountDto> MozipIng() {
		log.info("MozipIng");
		
		return meetInfoRepository.selectOrderByMozipIng();
	}
	
	/**
	 * 0612 김지민
	 * 모임 종료
	 * @return
	 */
	public List<MeetListCountDto> MozipEnd() {
		log.info("MozipIng");
		
		return meetInfoRepository.selectOrderByMozipEnd();
	}
	
	/**
	 * 조건에 따른 개체 개수	
	 * @return
	 */
	public int getListCount() {
		return meetInfoRepository.meetInfoCount(); 
	}
	
	/**
	 * 조건에 따른 검색 결과 리스트 페이징
	 * @param dto
	 * @return
	 */
	public Map<String, Object> selectBySearch(MeetSearchListDto dto){
		log.info("selectBySearch(dto={})", dto);
		
		if(dto.getPageNum() > 1) {
			dto.setAmount(dto.getPageNum() * 15);
			dto.setPageNum((dto.getPageNum() -1) * 15);
		} else {
			dto.setPageNum(dto.getPageNum() -1);
		}
		
		List<MeetListCountDto> paging = meetInfoRepository.selectBySearchPaging(dto);
		Map<String, Object> result = new HashMap<>();
		result.put("list", paging);
		return result;
	}


}
