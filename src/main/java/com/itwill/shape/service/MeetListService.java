package com.itwill.shape.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
// 김지민_meet.list
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.Criteria;
import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.domain.MeetPrtcp;
import com.itwill.shape.dto.MeetInfoPrtcpLikeSelectByPrtcpIdDto;
import com.itwill.shape.dto.MeetListCountDto;
import com.itwill.shape.dto.MeetSearchListDto;
import com.itwill.shape.dto.PageMeetListDto;
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
	private final MeetPrtcpRepository meetPrtcpRepository;

	
	/**
	 * 정지언 메인페이지 모임 최신순 보이기
	 * 
	 * @return
	 */
	public List<MeetListCountDto> mainReadByRecent() {
	    log.info("mainReadByRecent()");

	    List<MeetListCountDto> meetList = meetInfoRepository.selectOrderByRecent();

	    for (MeetListCountDto mc : meetList) {
	        mc.setImg_1(meetInfoRepository.selectByMtid(mc.getMtid()).getImg_1());

	        if (mc.getImg_1() != null) {
	            byte[] byteEnc64 = Base64.getEncoder().encode(mc.getImg_1());
	            String imgStr = null;
	            try {
	                imgStr = new String(byteEnc64, "UTF-8");
	            } catch (UnsupportedEncodingException e) {
	                e.printStackTrace();
	            }

	            mc.setFile(imgStr);
	        }
	    }

	    return meetList;
	}

	/**
	 * 정지언 메인페이지 모임 인기순 보이기
	 * 
	 * @return
	 */
	public List<MeetListCountDto> mainReadByPopularity() {
		log.info("mainReadByPopularity()");

		List<MeetListCountDto> meetList = meetInfoRepository.selectOrderByPopularity();
		
	    for (MeetListCountDto mc : meetList) {
	        mc.setImg_1(meetInfoRepository.selectByMtid(mc.getMtid()).getImg_1());

	        if (mc.getImg_1() != null) {
	            byte[] byteEnc64 = Base64.getEncoder().encode(mc.getImg_1());
	            String imgStr = null;
	            try {
	                imgStr = new String(byteEnc64, "UTF-8");
	            } catch (UnsupportedEncodingException e) {
	                e.printStackTrace();
	            }

	            mc.setFile(imgStr);
	        }
	    }

	    return meetList;
	}

	/**
	 * 0610 손창민 내가 참여한 모임 목록 불러오기
	 * 
	 * @param prtcpId
	 * @return
	 */
	public List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> selectByPrtcpId(String prtcpId, Criteria cri) {
		log.info("selectByPrtcpId(crtrId={}, cri={})", prtcpId, cri);

		return meetInfoRepository.selectByPrtcpId(prtcpId, cri);
	}

	/**
	 * 0610 손창민 내가 개설한 모임 목록 불러오기
	 * 
	 * @param crtrId
	 * @return
	 */
	public List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> selectByCrtrId(String crtrId) {
		log.info("selectByPrtcpId(crtrId={})", crtrId);

		return meetInfoRepository.selectByCrtrId(crtrId);
	}

	/**
	 * 0610 손창민 내가 찜한 모임 목록 불러오기
	 * 
	 * @param id
	 * @return
	 */
	public List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> selectById(String id) {
		log.info("selectById(id={})", id);

		return meetInfoRepository.selectById(id);
	}

	/**
	 * 김지민 모임 최신순으로 정렬
	 * 
	 * @return
	 */
	public List<MeetListCountDto> readByCreateTime() {
		log.info("readByCreateTime()");

		return meetInfoRepository.selectOrderByRecent();
	}

	/**
	 * 김지민 모임 찜 리스트가져오기
	 * 
	 * @return
	 */
	public List<MeetLike> LikeList() {
		log.info("readByCreateTime()");

		return meetLikeRepository.selectMeetLikeList();
	}

	/**
	 * 조건에 따른 개체 개수
	 * 
	 * @return
	 */
	public int getListCount(MeetSearchListDto dto) {
		return meetInfoRepository.meetInfoCount(dto);
	}

	/**
	 * 조건에 따른 검색 결과 리스트 페이징
	 * 
	 * @param dto
	 * @return
	 */
	public Map<String, Object> selectBySearch(MeetSearchListDto dto) {
		log.info("selectBySearch(dto={})", dto);

		if (dto.getPageNum() > 1) {
			dto.setAmount(dto.getPageNum() * 15);
			dto.setPageNum((dto.getPageNum() - 1) * 15);
		} else {
			dto.setPageNum(dto.getPageNum() - 1);
			dto.setAmount(15);
		}

		if (dto.getSearchSortBy() == null || dto.getSearchSortBy().equals("")) {
			dto.setSearchSortBy("recent");
		}

		List<MeetListCountDto> paging = meetInfoRepository.selectBySearchPaging(dto);

		// 이미지 파일
		for (MeetListCountDto mc : paging) {
			mc.setImg_1(meetInfoRepository.selectByMtid(mc.getMtid()).getImg_1());

			if (mc.getImg_1() != null) {
				byte[] byteEnc64 = Base64.getEncoder().encode(mc.getImg_1());
				String imgStr = null;
				try {
					imgStr = new String(byteEnc64, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}

				mc.setFile(imgStr);
			}
		}

		Map<String, Object> result = new HashMap<>();
		result.put("list", paging);
		return result;
	}

}
