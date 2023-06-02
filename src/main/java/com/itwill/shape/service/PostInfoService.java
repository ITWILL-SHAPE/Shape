package com.itwill.shape.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.PostInfo;
import com.itwill.shape.dto.GuideCreateDto;
import com.itwill.shape.dto.PostInfoSelectByIdDTO;
import com.itwill.shape.repository.PostInfoRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class PostInfoService {
	
	private final PostInfoRepository postInfoRepository;
	

	/**
	 * 0601 손창민
	 * id와 일치하는 작성글 목록 불러오기
	 * @param id
	 * @return
	 */
	public List<PostInfoSelectByIdDTO> selectById(String author) {
		log.info("selectById()");
		log.info("author={}", author);
		
		List<PostInfo> entity = postInfoRepository.selectById(author);
		
		// PostInfo 타입의 객체를 PostInfoSelectByIdDTO 타입 객체로
		// 리포지토리 계층의 메서드를 호출 - DB selectById
		return entity.stream().map(PostInfoSelectByIdDTO::fromEntity).toList();
	}
}
