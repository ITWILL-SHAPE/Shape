package com.itwill.shape.repository;

import org.apache.ibatis.annotations.Param;

import com.itwill.shape.domain.MeetLike;

public interface MeetLikeRepository {

	
	// 찜 갯수 나오게 하기
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
	int likeDelete(long mtid, String id);

	/**
	 * 0613 정지언 특정 mtid의 좋아요 갯수 조회
	 * 
	 * @param mtid
	 * @return
	 */
	/*
	 * int getLikeCountByMtid(int mtid);
	 * 
	 *//**
		 * 0613 정지언 특정 mtid의 찜 개수를 가져옴
		 * 
		 * @param mtid
		 * @return
		 */
	/*
	 * int getCountByMtid(int mtid);
	 * 
	 *//**
		 * 0613 정지언 특정 mtid에 유저(id)가 찜을 했는 지의 여부 확인
		 * 
		 * @param mtid
		 * @param id
		 * @return
		 */
	/*
	 * boolean isLikedByUser(int mtid, String id);
	 * 
	 *//**
		 * 0613 정지언 특정 mtid에 유저의 찜 추가
		 * 
		 * @param mtid
		 * @param id
		 */
	/*
	 * void insertLike(int mtid, String id);
	 * 
	 *//**
		 * 0613 정지언 특정 mtid에 유저의 찜 삭제
		 * 
		 * @param mtid
		 * @param id
		 *//*
			 * void deleteLike(int mtid, String id);
			 */
}
