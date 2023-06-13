package com.itwill.shape.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.shape.dto.PostCommentDeleteByPcidDto;
import com.itwill.shape.dto.PostInfoDeleteByPidDto;
//import com.itwill.shape.dto.PostCommentDeleteDto;
import com.itwill.shape.service.PostCommentService;
import com.itwill.shape.service.PostInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequiredArgsConstructor
//@RequestMapping("/user/guide")
@RestController
public class MyPageRestController {

	private final PostCommentService postCommentService;
	private final PostInfoService postInfoService;
	
	/**
	 * 0608 손창민
	 * post_info table에서 pid와 일치하는 작성글을 삭제
	 * @return
	 */
	@DeleteMapping("/deleteposts")
	public ResponseEntity<Integer> postInfoDeleteByPidDtoList(
			@RequestBody List<PostInfoDeleteByPidDto> selectedPids) {
		log.info("postInfoDeleteByPidDtoList(selectedPids={})", selectedPids);
		
		for (PostInfoDeleteByPidDto postInfoDeleteByPidDto : selectedPids) {
			long pid = postInfoDeleteByPidDto.getPid();
			log.info("pcid={}", pid);
			
			postInfoService.deleteByPid(pid);
		}
		return ResponseEntity.ok(1);
	} 
	
	/**
	 * 0608 손창민
	 * post_comment table에서 pcid와 일치하는 댓글을 삭제
	 * @return
	 */
	@DeleteMapping("/deletecomments")	
	public ResponseEntity<Integer> postCommentDeleteByPcidDtoList(
			@RequestBody List<PostCommentDeleteByPcidDto> selectedPcids) {
		log.info("postCommentDeleteDtoList(selectedPcids={})", selectedPcids);
		
		for (PostCommentDeleteByPcidDto postCommentDeleteByPcidDto : selectedPcids) {
			long pcid = postCommentDeleteByPcidDto.getPcid();
			log.info("pcid={}", pcid);
			
			postCommentService.deleteByPcid(pcid);
		}
		return ResponseEntity.ok(1);
	}
}