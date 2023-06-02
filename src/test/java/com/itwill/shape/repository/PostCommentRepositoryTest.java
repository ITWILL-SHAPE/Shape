package com.itwill.shape.repository;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.itwill.shape.domain.PostComment;
import com.itwill.shape.dto.PostCommentSelectByIdDTO;
import com.itwill.shape.service.PostCommentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
	locations = { "file:src/main/webapp/WEB-INF/application-context.xml" }
)
public class PostCommentRepositoryTest {
	
	@Autowired
	private PostCommentService postCommentService;
//	private PostCommentRepository postCommentRepository;
	
	@Test
	public void testSelectById() {
		
		PostComment postComment = new PostComment(0,0,"테스트", "test", null, null);
		
		
		List<PostCommentSelectByIdDTO> list = postCommentService.selectById(postComment.getAuthor());
		//assertNotNull(list);
		log.info("list={}", list);
	}
 }
