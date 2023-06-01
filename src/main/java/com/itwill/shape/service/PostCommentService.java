package com.itwill.shape.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.PostComment;
import com.itwill.shape.dto.PostCommentSelectByIdDTO;
import com.itwill.shape.repository.PostCommentRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service					// -> 스프링 컨테이너에서 서비스 컴포넌트 객체를 생성하고 관리(필요한 곳에 주입).
@RequiredArgsConstructor	// PostCommentRepository를 가지는 생성자를 만들어줌.
@Slf4j
public class PostCommentService {

	private final PostCommentRepository postCommentRepository;
	
	/**
	 * 손창민
	 * id와 일치하는 댓글 목록 불러오기
	 * @param id
	 * @return List<PostCommentSelectById> dto
	 */
	public List<PostCommentSelectByIdDTO> read(String author) {
		log.info("read()");
		log.info("author={}", author);
		
		List<PostComment> entity = postCommentRepository.selectById(author);
		
		// PostComment 타입 객체를 PostCommentSelectByUserIdDTO 타입 객체로
		// 리포지토리 계층의 메서드를 호출 - DB selectByPostId
		return entity.stream().map(PostCommentSelectByIdDTO::fromEntity).toList();
	}
}