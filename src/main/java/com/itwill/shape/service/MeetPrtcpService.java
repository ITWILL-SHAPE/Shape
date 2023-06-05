package com.itwill.shape.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.itwill.shape.domain.MeetPrtcp;
import com.itwill.shape.dto.MeetPrtcpCreateDto;
import com.itwill.shape.dto.MeetPrtcpReadDto;
import com.itwill.shape.repository.MeetInfoRepository;
import com.itwill.shape.repository.MeetLikeRepository;
import com.itwill.shape.repository.MeetPrtcpRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MeetPrtcpService {
	
	private final MeetPrtcpRepository meetPrtcpRepository;
	
	/**
	 * 참여자 정보 
	 */
	
	// 참여자가 참여하기를 누른 경우
		public int create(MeetPrtcpCreateDto dto) {
		log.info("create(dto={})");
				
		return meetPrtcpRepository.Prtcpinsert(dto.toEntity());
	}
		
	// MTID 참여한 소모임에서 참여자 리스트 보기
		public List<MeetPrtcpReadDto> read(long mtid) {
			log.info("read(={}" , mtid);
			
			List<MeetPrtcp> list = meetPrtcpRepository.selectPrtcpList(mtid);
			
			return list.stream().map(MeetPrtcpReadDto::fromEntity).toList();
		}
		
		// MTID 참여자 취소
		public int delete(String id) {
			log.info("delete(id={})" ,id);
			
			return meetPrtcpRepository.Prtcpdelete(id);
		}
		
}
