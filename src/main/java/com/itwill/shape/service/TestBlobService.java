package com.itwill.shape.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.Test;
import com.itwill.shape.repository.TestBlobRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class TestBlobService {
	
	private final TestBlobRepository testBlobRepository;
	
	public int insertTest(Test test) {
		log.info("testBlobService(test = {})", test);
		
		return testBlobRepository.insertTest(test);
	}
}
