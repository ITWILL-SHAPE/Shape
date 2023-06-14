package com.itwill.shape.service;

import org.springframework.stereotype.Service;

import com.itwill.shape.dto.MeetLikeCountDto;
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

	// 찜 등록
	public int likeInsert(long mtid, String id) {
		log.info("likeinsert(mtid={}, id={})", mtid, id);
		
		return meetLikeRepository.likeCreate(mtid, id);
	}
	
	// 찜 삭제
	public int likeDelete(long mtid, String id) {
		log.info("likeDelete(mtid={}, id={})", mtid, id);
		
		return meetLikeRepository.likeDelete(mtid, id);
	}
	
	
	// 지언 찜 도전 0613
    public int getLikeCountByMtid(int mtid) {
    	log.info("getLikeCountByMtid(mtid={})", mtid);
        return meetLikeRepository.getLikeCountByMtid(mtid);
    }

    public int getCountByMtid(int mtid) {
    	log.info("getCountByMtid(mtid={})", mtid);
        return meetLikeRepository.getCountByMtid(mtid);
    }

    public boolean isLikedByUser(int mtid, String id) {
    	log.info("isLikedByUser(mtid={}, id={})", mtid, id);
        return meetLikeRepository.isLikedByUser(mtid, id);
    }

    public void insertLike(int mtid, String id) {
    	log.info("insertLike(mtid={}, id={})", mtid, id);
    	meetLikeRepository.insertLike(mtid, id);
    }

    public void deleteLike(int mtid, String id) {
    	log.info("deleteLike(mtid={}, id={})", mtid, id);
    	meetLikeRepository.deleteLike(mtid, id);
    }
	
}