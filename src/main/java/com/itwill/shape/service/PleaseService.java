package com.itwill.shape.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.Please;
import com.itwill.shape.repository.PleaseRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class PleaseService {
	
	private final PleaseRepository pleaseRepository;
		
	public int insertBlob(Please please) {
		// log로 byte[]을 찍으니 시간이 너무 오래걸림
		log.info("insertBlob(please = {})");
		
		return pleaseRepository.insertBlob(please);
	}
	
	public List<Please> selectBlobList() {
		log.info("selectBlobList()");
		
		List<Please> list = pleaseRepository.selectBlobList();
		
		return pleaseRepository.selectBlobList();
	}

}
