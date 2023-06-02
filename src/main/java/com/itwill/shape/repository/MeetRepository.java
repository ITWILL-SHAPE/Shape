package com.itwill.shape.repository;

import com.itwill.shape.domain.MeetInfo;

public interface MeetRepository {

	int insert(MeetInfo mtInfo);
	int delete(int i);
	int update(MeetInfo mtInfo);

}
