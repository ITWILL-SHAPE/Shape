package com.itwill.shape.repository;

import com.itwill.shape.domain.MeetLike;

public interface MeetLikeRepository {

	long selectMeetlikeCountWithMtid(int mtid);

	/**
	 * MTID 테이블의 ID USER의 찜 수 +1
	 * @param mtLike -> mtid, id(모임 아이디 + 유저 아이디 필요)
	 * @return
	 */
	int likeCreate(long mtid, String id);

	/**
	 * MTID 테이블의 ID USER의 찜수 -1
	 * @param mtLike -> mtid, id(모임 아이디 + 유저 아이디 필요)
	 * @return
	 */
	int likeDelete(long mtid, String id);

}
