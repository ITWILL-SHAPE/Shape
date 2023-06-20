package com.itwill.shape.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.shape.dto.DashBoardCategoryDto;
import com.itwill.shape.dto.MngrMeetGraphDto;
import com.itwill.shape.repository.DashBoardRepository;
import com.itwill.shape.repository.UserInfoRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MngrDashBoardService {
	
	private final DashBoardRepository dashBoardRepository;

	/**
	 * 배선영
	 * 관리자 - 카테고리 별 모임 수
	 * @param dto
	 * @return
	 */
	public List<DashBoardCategoryDto> countGender(MngrMeetGraphDto dto) {
		return dashBoardRepository.categoryMeet();
	}
	
	
}
