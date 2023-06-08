package com.itwill.shape.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.shape.dto.PostCommentDeleteDto;
import com.itwill.shape.dto.PostInfoDeleteDto;
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
	 * post_comment table에서 id, content와 일치하는 댓글을 삭제
	 * @return
	 */
//	@ResponseBody
	@DeleteMapping("/deletecomments")	
	public ResponseEntity<Integer> postCommentDeleteDtoList(
			@RequestBody List<PostCommentDeleteDto> selectedComments) {
		log.info("postCommentDeleteDtoList()");
		log.info("PostCommentDeleteDtoList={}", selectedComments);
		
		
		for (PostCommentDeleteDto postCommentDeletDto : selectedComments) {
			String author = postCommentDeletDto.getAuthor();
			String content = postCommentDeletDto.getContent();
			log.info("commentAuthor={}", author);
			log.info("commentContent={}", content);
			
			// commentAuthor와 commentContent를 기반으로 post-comment 테이블에서 해당 댓글을 삭제하는 작업 수행
			postCommentService.deleteByAuthorAndContent(author, content);
		}
		
		return ResponseEntity.ok(1);
	}
	
	/**
	 * 0608 손창민
	 * post_info table에서 id, title와 일치하는 댓글을 삭제
	 * @return
	 */
	@DeleteMapping("/deleteposts")
	public ResponseEntity<Integer> postInfoDeleteDtoList(
			@RequestBody List<PostInfoDeleteDto> selectedTitles) {
		log.info("postInfoDeleteDtoList()");
		log.info("postInfoDeleteDtoList={}", selectedTitles);
		
		for (PostInfoDeleteDto postInfoDeletDto : selectedTitles) {
			String author = postInfoDeletDto.getAuthor();
			String title = postInfoDeletDto.getTitle();
			log.info("commentAuthor={}", author);
			log.info("commentContent={}", title);
			
			// commentAuthor와 commentContent를 기반으로 post-comment 테이블에서 해당 댓글을 삭제하는 작업 수행
			postInfoService.deleteByAuthorAndTitle(author, title);
		}
		
		return ResponseEntity.ok(1);
	} 
}