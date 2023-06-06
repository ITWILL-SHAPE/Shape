package com.itwill.shape.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.shape.dto.MeetPrtcpCreateDto;
import com.itwill.shape.dto.MeetPrtcpReadDto;
import com.itwill.shape.repository.MeetPrtcpRepository;
import com.itwill.shape.service.MeetPrtcpService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/reply")
public class MeetControllerPrtcp {
	
	
	private final MeetPrtcpService meetPrtcpService;
	
	@PostMapping
	public ResponseEntity<Integer> createPrtcp(@RequestBody MeetPrtcpCreateDto dto) {
		log.info("createPrtcp(dto={})" , dto);
		
		int result = meetPrtcpService.create(dto);
		
		return ResponseEntity.ok(result);
	}
	
	@GetMapping("all/{mtid}")
	public ResponseEntity<List<MeetPrtcpReadDto>> readPrtcp(@PathVariable long mtid) {
		log.info("read(mtid= {})" , mtid);
		
		List<MeetPrtcpReadDto> list = meetPrtcpService.read(mtid);
		
		return ResponseEntity.ok(list);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Integer> deletePrtcp(@PathVariable String id) {
		log.info("deletePrtcp(id={})" , id);
		
		int result = meetPrtcpService.delete(id);
		
		return ResponseEntity.ok(result);
	}
}
