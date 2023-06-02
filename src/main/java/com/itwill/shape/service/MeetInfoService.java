package com.itwill.shape.service;

import org.springframework.stereotype.Service;

import com.itwill.shape.dto.MeetInfoCreateDto;
import com.itwill.shape.repository.MeetInfoRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MeetInfoService {
	private final MeetInfoRepository meetInfoRepository;
	

//	 public int create(MeetInfoCreateDto dto) {
//	        log.info("create({})", dto);
//	        
//	        return meetInfoRepository.insert(dto.toEntity());
//	    }

}
