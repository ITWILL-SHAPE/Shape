package com.itwill.shape.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.shape.dto.InfoFaQCreateDto;
import com.itwill.shape.dto.InfoFaQDto;
import com.itwill.shape.dto.InfoFaQUpdateDto;
import com.itwill.shape.repository.InfoFaQRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class InfoFaQService {
	
	private final InfoFaQRepository infoFaQRepository;
	
	/**
	 * faq 페이지
	 * @return faq 리스트
	 */
	public List<InfoFaQDto> read() {
		log.info("read()");
		return infoFaQRepository.selectOrderByFid();
	}
	
	/**
	 * faq 작성 (admin)
	 * @param dto
	 * @return
	 */
	public int create(InfoFaQCreateDto dto) {
		log.info("create({})", dto);
		return infoFaQRepository.insert(dto.toEntity());
	}
	
	/**
	 * faq 수정 (admin)
	 * @param dto
	 * @return
	 */
	public int update(InfoFaQUpdateDto dto) {
		log.info("update({})", dto);
		return infoFaQRepository.updateFaQ(dto.toEntity());
	}
	
	public int delete(long fid) {
		log.info("delete({})", fid);
		return infoFaQRepository.deleteByFid(fid);
	}
	
}
