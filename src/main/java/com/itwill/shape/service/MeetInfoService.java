package com.itwill.shape.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwill.shape.domain.MeetInfo;
import com.itwill.shape.dto.MeetInfoCreateDto;
import com.itwill.shape.dto.MeetInfoUpdateDto;
import com.itwill.shape.dto.MeetMainDetailDto;
import com.itwill.shape.repository.MeetInfoRepository;
import com.itwill.shape.repository.MeetPrtcpRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MeetInfoService {
	private final MeetInfoRepository meetInfoRepository;
	
	// 모임 만들기
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

	// 모임 상세보기 페이지
	public MeetMainDetailDto read(long mtid) {
		log.info("read(mtid={})", mtid);
		
		MeetInfo entity = meetInfoRepository.selectByMtid(mtid);
		
		MeetMainDetailDto dto = MeetMainDetailDto.fromEntity(entity);
		
		return dto;
	}
	
}
