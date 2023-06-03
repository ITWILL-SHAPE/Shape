package com.itwill.shape.repository;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Assertions;
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
	@Autowired
	private PostCommentRepository postCommentRepository;
	
	//@Test
	public void testSelectById() {
		
		PostComment postComment = new PostComment(0,0,"테스트", "test", null, null);
		
		
		List<PostCommentSelectByIdDTO> list = postCommentService.selectById(postComment.getAuthor());
		//assertNotNull(list);
		log.info("list={}", list);
	}
	
//	@Test
    public void testReplyCount() {
        long result = postCommentRepository.selectCommentCountWithPid(1);
        log.info("result = {}", result);
    }
    
//    @Test
    public void testDelete() {
        int result = postCommentRepository.delete(3);
        log.info("result = {}", result);
    }
    
//    @Test
    public void testUpdate() {
        PostComment entity = PostComment.builder()
                .pcid(1)
                .content("update test")
                .build();
        int result = postCommentRepository.update(entity);
        log.info("result = {}", result);
    }
    
//    @Test
    public void testInsert() {
        PostComment entity = PostComment.builder()
                .content("test")
                .author("test")
                .pid(1)
                .build();
        int result = postCommentRepository.insert(entity);
        log.info("result = {}", result);
    }
    
//    @Test
    public void test() {
        Assertions.assertNotNull(postCommentRepository);
        log.info(postCommentRepository.toString());
        
        List<PostComment> list = postCommentRepository.selectByPid(1);
        for(PostComment comment : list) {
            log.info(comment.toString());
        }
    }
 }
