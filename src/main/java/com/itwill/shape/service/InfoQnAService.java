package com.itwill.shape.service;
// 지현 큐앤에이
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.InfoQnA;
import com.itwill.shape.dto.InfoQnACreateDto;
import com.itwill.shape.dto.InfoQnADetailDto;
import com.itwill.shape.dto.InfoQnAListDto;
import com.itwill.shape.dto.InfoQnAMngrUpdateDto;
import com.itwill.shape.repository.InfoQnARepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class InfoQnAService {
	private final InfoQnARepository infoQnARepository;
	
	// (관리자, 사용자) qna 메인페이지(리스트)
	public List<InfoQnAListDto> read(){
		log.info("read()");
		List<InfoQnA> list = infoQnARepository.selectOrderByQidDesc();
		List<InfoQnAListDto> result = new ArrayList<>();
		for(InfoQnA q:list) {
			InfoQnAListDto dto = InfoQnAListDto.fromEntity(q);
			result.add(dto);
		}
		return result;
	}
	
	// (사용자) qna 상세보기 페이지
	public InfoQnADetailDto read(long qid) {
		log.info("read(id={})", qid);
		InfoQnA entity = infoQnARepository.selectByQid(qid);
		InfoQnADetailDto dto = InfoQnADetailDto.fromEntity(entity);
		return dto;
	}
	
	// (사용자) qna 작성 페이지
	public int create(InfoQnACreateDto dto) {
		log.info("create({})", dto);
		return infoQnARepository.insert(dto.toEntity());
	}
	
	// (관리자) qna 답변 페이지(수정이랑 등록이 동일하지 않나 테이블이하나고 엡데이트쓰는거니까 생성아니고
	public int update(InfoQnAMngrUpdateDto infoQnA) {
		log.info("update({})", infoQnA);
		return infoQnARepository.updateAnswerToQnA(infoQnA.toEntity());
	}
	
	// (사용자) qna 삭제
	public int delete(long qid) {
		log.info("delete(qid={})",qid);
		return infoQnARepository.deleteByQid(qid);
	}
}
