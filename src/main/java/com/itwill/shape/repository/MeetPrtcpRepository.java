package com.itwill.shape.repository;

import java.util.List;

import com.itwill.shape.domain.MeetInfo;
import com.itwill.shape.domain.MeetPrtcp;

public interface MeetPrtcpRepository {

	// 모임 참여 신청
	int prtcpInsert(MeetPrtcp mtPrtcp);

	// mtid 모임 참여자 리스트
	List<MeetPrtcp> prtcpList(long mtid);

	// 모임 참여자 삭제(참여 신청 취소)
	int prtcpDelete(String id);
	
	
}
