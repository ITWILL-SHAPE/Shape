package com.itwill.shape.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.PostComment;
import com.itwill.shape.dto.PostCommentCreateDto;
import com.itwill.shape.dto.PostCommentReadDto;
import com.itwill.shape.dto.PostCommentSelectByIdDTO;
import com.itwill.shape.dto.PostCommentUpdateDto;
import com.itwill.shape.dto.PostUpdateDto;
import com.itwill.shape.repository.PostCommentRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service					// -> 스프링 컨테이너에서 서비스 컴포넌트 객체를 생성하고 관리(필요한 곳에 주입).
@RequiredArgsConstructor	// PostCommentRepository를 가지는 생성자를 만들어줌.
@Slf4j
public class PostCommentService {

	private final PostCommentRepository postCommentRepository;
	
	/**
	 * 0601 손창민
	 * id와 일치하는 댓글 목록 불러오기
	 * @param id
	 * @return List<PostCommentSelectById> dto
	 */
	public List<PostCommentSelectByIdDTO> selectById(String author) {
		log.info("selectById()");
		log.info("author={}", author);
		
		List<PostComment> entity = postCommentRepository.selectById(author);
		
		// PostComment 타입의 객체를 PostCommentSelectByUserIdDTO 타입의 객체로
		// 리포지토리 계층의 메서드를 호출 - DB selectById
		return entity.stream().map(PostCommentSelectByIdDTO::fromEntity).toList();
	}
	
	/**
	 * 0603 지현 게시판 댓글 사용
	 * @param dto
	 * @return
	 */
	public int create(PostCommentCreateDto dto) {
		log.info("create(dto={})",dto);
		return postCommentRepository.insert(dto.toEntity());
	}
	
	public List<PostCommentReadDto> read(long pid){
		log.info("read(pid={})", pid);
		List<PostComment> list = postCommentRepository.selectByPid(pid);
		return list.stream().map(PostCommentReadDto::fromEntity).toList();
	}
	
	public PostCommentReadDto readByPcid(long pcid) {
		log.info("readByPcid(pcid= {})", pcid);
		PostComment entity = postCommentRepository.selectByPcid(pcid);
		return PostCommentReadDto.fromEntity(entity);
	}
	
	public int delete(long pcid) {
		log.info("delete(pcid={}", pcid);
		return postCommentRepository.delete(pcid);
	}
	
	public int update(long pcid, PostCommentUpdateDto dto) {
		log.info("update(pcid={}, dto={})", pcid, dto);
		
		PostComment entity = PostComment.builder()
				.pcid(pcid)
				.content(dto.getContent())
				.build();
		log.info("entity={}, entity");
		return postCommentRepository.update(entity);
	}
}