package com.itwill.shape.service;

import org.springframework.stereotype.Service;

import com.itwill.shape.dto.MeetLikeDto;
import com.itwill.shape.repository.MeetInfoRepository;
import com.itwill.shape.repository.MeetLikeRepository;
import com.itwill.shape.repository.UserInfoRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MeetLikeService {

	private final MeetLikeRepository meetLikeRepository;
	private final MeetInfoRepository meetInfoRepository;
	private final UserInfoRepository userInfoRepository;
	
	// 찜 등록
	public int likeInsert(long mtid, String id) {
		log.info("likeinsert(mtid={}, id={})", mtid, id);
		
		return meetLikeRepository.likeInsert(mtid, id);
	}
	
	// 찜 삭제
	public int likeDelete(long mtid, String id) {
		log.info("likeDelete(mtid={}, id={})", mtid, id);
		
		return meetLikeRepository.likeDelete(mtid, id);
	}
	
}