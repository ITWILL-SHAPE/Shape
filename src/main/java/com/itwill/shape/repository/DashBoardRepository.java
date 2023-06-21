package com.itwill.shape.repository;

import java.util.List;

import com.itwill.shape.dto.MngrAreaMeetDto;
import com.itwill.shape.dto.MngrCategoryDto;
import com.itwill.shape.dto.MngrMeetGraphDto;

public interface DashBoardRepository {
	
	List<MngrCategoryDto> categoryMeet(); // 카테고리
	
	MngrMeetGraphDto genderFemale(); // 여자회원수
	
	MngrMeetGraphDto genderMale(); // 남자회원수
	
	List<MngrAreaMeetDto> areaMeet(); // 지역별 모임 참가수

}
