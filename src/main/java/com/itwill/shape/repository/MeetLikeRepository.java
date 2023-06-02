package com.itwill.shape.repository;

import com.itwill.shape.domain.MeetLike;

public interface MeetLikeRepository {

	long selectMeetlikeCountWithMtid(int i);

	int likeCreate(MeetLike mtLike);

	int likeDelete(int i);

}
