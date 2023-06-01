package com.itwill.shape.service;

import org.springframework.stereotype.Service;

import com.itwill.shape.dto.GuideCreateDto;
import com.itwill.shape.repository.GuideRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service					// -> 스프링 컨테이너에서 서비스 컴포넌트 객체를 생성하고 관리(필요한 곳에 주입).
@RequiredArgsConstructor	// GuideRepository를 가지는 생성자를 만들어줌.
@Slf4j
public class GuideService {
	
	// Service 작명 방법
	// : Domain에 추가 되는 DB TABLE 개수만큼 추가.
	// : TABLE 이름 + Service
	// ex> GuideService	
	
	// Service 작성 방법
	// : 해당 메소드 작성할 때, 필요한 필드가 모두 있는 DTO가 있는지 잘 확인.
	// : 해당 메소드 작성자 및 해당 메소드의 역할 작성.
	
	private final GuideRepository guideRepository;
	
	/**
	 * 0531 하지윤
	 * - 새로운 Guide 생성
	 * 
	 * @param dto
	 * @return
	 */
	public int create(GuideCreateDto dto) {
		log.info("create{}", dto);
		 
		// GuideCreateDto 타입을 Guide 타입으로 변환해서
		// 리포지토리 계층의 메서드를 호출 - DB Insert.
		return guideRepository.insert(dto.toEntity());
	}
}
