package com.itwill.shape.service;

import org.springframework.stereotype.Service;

import com.itwill.shape.dto.MeetInfoCreateDto;
import com.itwill.shape.dto.MeetInfoUpdateDto;
import com.itwill.shape.repository.MeetInfoRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MeetInfoService {
	private final MeetInfoRepository meetInfoRepository;

	// 모임 만들기 페이지
	public int create(MeetInfoCreateDto dto) {
		log.info("create({})", dto);

		return meetInfoRepository.insert(dto.toEntity());
	}
	
	// 모임 수정하기
	public int update(MeetInfoUpdateDto post) {
		log.info("update({})", post);
		
		return meetInfoRepository.update(post.updateEntity());
	}
	
	// 모임 삭제
	public int delete(long mtid) {
		log.info("delete(mtid={})", mtid);
		
		return meetInfoRepository.deleteByMtid(mtid);
		
	}
	
}
