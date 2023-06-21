package com.itwill.shape.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwill.shape.dto.MngrAreaMeetDto;
import com.itwill.shape.dto.MngrCategoryDto;
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
	// 카테고리 리스트
	public List<MngrCategoryDto> categoryMeet() {
		return dashBoardRepository.categoryMeet();
	}
	// 여자 회원수
	public MngrMeetGraphDto genderFemaleMeet() {
		return dashBoardRepository.genderFemale();
	}
	// 남자 회원수
	public MngrMeetGraphDto genderMaleMeet() {
		return dashBoardRepository.genderMale();
	}
	// 지역별 리스트
	public List<MngrAreaMeetDto> areaMeet() {
		return dashBoardRepository.areaMeet();
	}
	
}
