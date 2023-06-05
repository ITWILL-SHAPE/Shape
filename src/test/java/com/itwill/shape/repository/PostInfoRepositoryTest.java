package com.itwill.shape.repository;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.itwill.shape.domain.PostInfo;
import com.itwill.shape.dto.PostListDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/application-context.xml" })
public class PostInfoRepositoryTest {
	@Autowired
	private PostInfoRepository postInfoRepository;
	

	
	@Test
    public void testSelectWithKeyword() {
        List<PostInfo> result = postInfoRepository.selectWithKeyword("te");
        log.info("result = {}", result);
    }
	
//	@Test
    public void testReplyCount() {
        List<PostListDto> result = postInfoRepository.selectWithCommentCount();
        log.info("result = {}", result);
    }

	//@Test
	public void testDelete() {
		int result = postInfoRepository.deleteByPid(3);
		Assertions.assertEquals(1, result);
	}

	//@Test
	public void testUpdate() {
		PostInfo post = PostInfo.builder().pid(1) // 업데이트할 포스트 아이디
				.title("update test") // 업데이트할 제목
				.content("update test") // 업데이트할 내용
				.hrs_hd(2)
				.build();
		int result = postInfoRepository.updateTitleAndContent(post);
		Assertions.assertEquals(1, result);
	}

	//@Test
	public void testSelectById() {
		PostInfo result = postInfoRepository.selectByPid(1);
		Assertions.assertNotNull(result);
		log.info(result.toString());

		result = postInfoRepository.selectByPid(-1);
		Assertions.assertNull(result);
	}

	//@Test
	public void testPostRepository() {
		Assertions.assertNotNull(postInfoRepository);
		log.info("postRepository = {}", postInfoRepository);

		PostInfo post = PostInfo
				.builder()
				.title("insert test")
				.content("insert test")
				.author("test")
				.hrs_hd(1)
				.build();
		log.info(post.toString());

		int result = postInfoRepository.insert(post);
		Assertions.assertEquals(1, result);
		log.info("result = {}", result);

	}

}