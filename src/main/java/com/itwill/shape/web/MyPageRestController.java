package com.itwill.shape.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.shape.dto.PostCommentDeleteDto;
//import com.itwill.shape.dto.PostCommentDeleteDto;
import com.itwill.shape.service.PostCommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequiredArgsConstructor
//@RequestMapping("/user/guide")
@RestController
public class MyPageRestController {

	private PostCommentService postCommentService;
	
	/**
	 * 0608 손창민
	 * post_comment table에서 id, content와 일치하는 댓글을 삭제
	 * @return
	 */
//	@ResponseBody
	@DeleteMapping("/deleteComments")	
	public ResponseEntity<Integer> postCommentDeleteDtoList(
			@RequestBody List<PostCommentDeleteDto> selectedComments
			) {
		log.info("postCommentDeleteDtoList()");
		log.info("PostCommentDeleteDtoList={}", selectedComments);
		
		
		for (PostCommentDeleteDto postCommentDeletDto : selectedComments) {
			String commentAuthor = postCommentDeletDto.getAuthor();
			String commentContent = postCommentDeletDto.getContent();
			log.info("commentAuthor={}", commentAuthor);
			log.info("commentContent={}", commentContent);
			
			// commentAuthor와 commentContent를 기반으로 post-comment 테이블에서 해당 댓글을 삭제하는 작업 수행
			postCommentService.deleteByAuthorAndContent(commentAuthor, commentContent);
		}
		
		return ResponseEntity.ok(1);
	}

}
