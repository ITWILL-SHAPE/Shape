package com.itwill.shape.web;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.shape.dto.PostCommentCreateDto;
import com.itwill.shape.dto.PostCommentReadDto;
import com.itwill.shape.dto.PostCommentUpdateDto;
import com.itwill.shape.service.PostCommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/reply")
public class PostCommentController {
    
    private final PostCommentService postCommentService;
    
	/*
	 * @PostMapping public ResponseEntity<Integer> createComment(@RequestBody
	 * PostCommentCreateDto dto) { log.info("createComment(dto={})", dto);
	 * 
	 * int result = postCommentService.create(dto);
	 * 
	 * return ResponseEntity.ok(result); }
	 */

    @GetMapping("/all/{pid}")
    public ResponseEntity<List<PostCommentReadDto>> read(@PathVariable long pid) {
        log.info("read(pid={})", pid);
        
        List<PostCommentReadDto> list = postCommentService.read(pid);
        log.info("# of Comments = {}", list.size());
        
        return ResponseEntity.ok(list);
    }
    
    @DeleteMapping("/{pcid}")
    public ResponseEntity<Integer> deleteComment(@PathVariable long pcid) {
        log.info("deleteComment(pcid={})", pcid);
        
        int result = postCommentService.delete(pcid);
        
        return ResponseEntity.ok(result);
    }
    
    @GetMapping("/{pcid}")
    public ResponseEntity<PostCommentReadDto> readByPcid(@PathVariable long pcid) {
        log.info("readByPcid(pcid={})", pcid);
        
        PostCommentReadDto dto = postCommentService.readByPcid(pcid);
        log.info("dto={}", dto);
        
        return ResponseEntity.ok(dto);
    }
    
    @PutMapping("/{pcid}")
    public ResponseEntity<Integer> updateComment(
            @PathVariable long pcid,
            @RequestBody PostCommentUpdateDto dto) {
        log.info("updateComment(pcid={}, dto={})", pcid, dto);
        
        int result = postCommentService.update(pcid, dto);
        
        return ResponseEntity.ok(result);
    }
    
}