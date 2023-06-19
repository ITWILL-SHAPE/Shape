package com.itwill.shape.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwill.shape.dto.MngrMeetGraphDto;
import com.itwill.shape.dto.MngrUserInfoSearchListDto;
import com.itwill.shape.dto.MngrUserInfoSelectDto;
import com.itwill.shape.dto.UserInfoSelectByIdDto;
import com.itwill.shape.repository.UserInfoRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MngrUserInfoService {
	
	private final UserInfoRepository userInfoRepository;
	
	
	/**
	 * 하지윤
	 * 관리자 - 사용자 상세보기
	 * 
	 * @param id
	 * @return
	 */
	public UserInfoSelectByIdDto selectUserDetail(String id) {
		log.info("selectUserDetail(id = {})", id);
		
		return UserInfoSelectByIdDto.fromEntity(userInfoRepository.readUserInfoById(id));
	}
	
	/**
	 * 해당 list 크기
	 * @param dto
	 * @return
	 */
	public int getListCount(MngrUserInfoSearchListDto dto) {
		return userInfoRepository.selectByKeyword(dto).size();
	}
	
	/**
	 * 하지윤
	 * 관리자 - 사용자 리스트
	 * 
	 * @param dto
	 * @return
	 */
	public Map<String, Object> selectByKeyword(MngrUserInfoSearchListDto dto) {
		log.info("selectByKeyword(dto = {})", dto);
		
		// list - 회원 정보
		if(dto.getPageNum() > 1) {
			dto.setAmount(dto.getPageNum() * 10);
			dto.setPageNum((dto.getPageNum() - 1) * 10);
		} else {
			dto.setPageNum(dto.getPageNum() - 1);
		}
		
		List<MngrUserInfoSelectDto> paging = userInfoRepository.selectByKeywordPaging(dto);		
		
		// list, paging, count
		Map<String, Object> result = new HashMap<>();
		result.put("list", paging);

		return result;
	}
	/**
	 * 배선영
	 * 관리자 - 그래프 만들기
	 * @param dto
	 * @return
	 */
	public int countGender(MngrMeetGraphDto dto) {
		return userInfoRepository.getFemaleUserCount(dto);
	}
}
