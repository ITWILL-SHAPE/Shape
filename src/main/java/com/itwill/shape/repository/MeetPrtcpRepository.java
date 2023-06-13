package com.itwill.shape.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.shape.domain.MeetInfo;
import com.itwill.shape.domain.MeetPrtcp;
import com.itwill.shape.domain.UserInfo;
import com.itwill.shape.dto.MeetMainDetailDto;
import com.itwill.shape.dto.MeetPrtcpCreateDto;

public interface MeetPrtcpRepository {

	// 모임 참여 신청
	int Prtcpinsert(MeetPrtcp mtPrtcp);
	
	// mtid 모임 참여자 정보를 가져옴
	List<MeetPrtcp> selectPrtcpList(long mtid);

	// 모임 참여자 삭제(참여 신청 취소)
	int Prtcpdelete(long mtid);
	
	// mtid 글 작성자 
	UserInfo getUserInfo(String id);
	
	
	
	

	
	
	
}
