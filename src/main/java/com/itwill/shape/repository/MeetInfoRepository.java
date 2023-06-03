package com.itwill.shape.repository;

import com.itwill.shape.domain.MeetInfo;

// meet_info의 repository.
public interface MeetInfoRepository {

	int insert(MeetInfo entity); // create 모임 만들기
	int update(MeetInfo entity); // update 모임 수정하기
	int deleteByMtid(long mtid); // delete 모임 삭제하기
	int delete(int i);

}
