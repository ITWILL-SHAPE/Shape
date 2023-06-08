package com.itwill.shape.web;

//import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//import com.itwill.shape.dto.PostCommentDeleteDto;
import com.itwill.shape.service.PostCommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
//@RequiredArgsConstructor
//@RequestMapping("/user/guide")	// 클래스의 메서드들은 요청 주소가 "/..."로 시작.
@RestController
public class MyPageRestController {

	
//	@PostMapping("/deleteComments")
//	  public ResponseEntity<String> deleteComments(@RequestBody List<PostCommentDeleteDto> PostCommentDeleteDtoList) {
//	    for (PostCommentDeleteDto postCommentDeletDto : PostCommentDeleteDtoList) {
//	      String commentAuthor = postCommentDeletDto.getAuthor();
//	      String commentContent = postCommentDeletDto.getContent();
//
//	      commentAuthor와 commentContent를 기반으로 post-comment 테이블에서 해당 댓글을 삭제하는 작업 수행
//	      PostCommentService.deleteComment(commentAuthor, commentContent);
//	    }
//
//	    return ResponseEntity.ok().build();
//	  }
//
//	}

	
}
