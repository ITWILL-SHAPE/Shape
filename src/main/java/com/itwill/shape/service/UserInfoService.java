package com.itwill.shape.service;

import org.springframework.stereotype.Service;

import com.itwill.shape.dto.UserCreateDto;
import com.itwill.shape.repository.GuideRepository;
import com.itwill.shape.repository.UserInfoRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserInfoService {
	
	private final UserInfoRepository userInfoRepository;
	
	/**
	 * 관리자 생성을 위한 메소드
	 * dto={id, pwd, name}
	 * 
	 * @param dto
	 * @return
	 */
	public int create(UserCreateDto dto) {
		log.info("create(dto = {})", dto);
		
		return userInfoRepository.insertAdmin(dto.toEntityAdmin());
	}

}
