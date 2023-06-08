package com.itwill.shape.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.service.MeetListService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // final 변수 초기화
@RestController
@RequestMapping("/api/meet")
public class MeetRestController {
	
	  private final MeetListService meetListService;
	
	  @PostMapping("/list/{mtid}")
	    public ResponseEntity<Integer> createLike(@PathVariable long mtid, @RequestBody String id) { // @RequestBody 안에 ReplyCreateDto dto이 존재.
	        log.info("createReply(mtid = {}, id = {})", mtid, id);
	        
	        int result = meetListService.LikeCountUpdate(mtid, id) ;
	        
//	        ResponseEntity.status(500).build(); // httpStatusCode를 보내서 에러 처리
	        
	        return ResponseEntity.ok(result); 
	    }
	  
	  @DeleteMapping("/list/{mtid}")
	    public ResponseEntity<Integer> deleteReply(@PathVariable long mtid, @RequestBody String id) {
	        log.info("deleteReply(mtid = {}, id = {})", mtid, id);
	        
	        int result = meetListService.LikeCountDelete(mtid,id);
	        
	        return ResponseEntity.ok(result);
	    }
}
