package com.itwill.shape.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.shape.domain.MeetLike;

public interface MeetLikeRepository {

	
	/**
	 * MTID 테이블의  찜 갯수 나오게 하기
	 * @param mtid
	 * @return
	 */
	long selectMeetlikeCountWithMtid(long mtid);

	/**
	 * MTID 테이블의 ID USER의 찜 수 +1
	 * 
	 * @param mtLike -> mtid, id(모임 아이디 + 유저 아이디 필요)
	 * @return
	 */
	int likeCreate(MeetLike meetLike);

	/**
	 * MTID 테이블의 ID USER의 찜수 -1
	 * 
	 * @param mtLike -> mtid, id(모임 아이디 + 유저 아이디 필요)
	 * @return
	 */
	int likeDelete(@Param("mtid")long mtid,  @Param("id")String id);
	
	/**
	 *MTID 찜 리스트
	 * @param id
	 * @return
	 */
	List<MeetLike> selectMeetLikeListByMtid(@Param("mtid")long mtid );
	
}
