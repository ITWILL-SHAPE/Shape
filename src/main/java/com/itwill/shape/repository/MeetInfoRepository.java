package com.itwill.shape.repository;

import com.itwill.shape.domain.MeetInfo;

// meet_info의 repository.
public interface MeetInfoRepository {

	int insert(MeetInfo mtInfo);
	
	int delete(int i);
	
	int update(MeetInfo mtInfo);

	int deleteByMtid(long mtid);
	
	// mtid 모임 상세 페이지
	MeetInfo selectById(long mtid); 


}
