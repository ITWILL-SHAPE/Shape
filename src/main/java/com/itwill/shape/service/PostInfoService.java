package com.itwill.shape.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.PostInfo;
import com.itwill.shape.dto.GuideCreateDto;
import com.itwill.shape.dto.PostCreateDto;
import com.itwill.shape.dto.PostDetailDto;
import com.itwill.shape.dto.PostInfoSelectByAuthorDto;
import com.itwill.shape.dto.PostInfoSelectByKeywordDto;
import com.itwill.shape.dto.PostListDto;
import com.itwill.shape.dto.PostUpdateDto;
import com.itwill.shape.repository.PostCommentRepository;
import com.itwill.shape.repository.PostInfoRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class PostInfoService {
	
	private final PostInfoRepository postInfoRepository;
	private final PostCommentRepository postCommentRepository;

	/**
	 * 0601 손창민
	 * id와 일치하는 작성글 목록 불러오기
	 * @param id
	 * @return
	 */
	public List<PostInfoSelectByAuthorDto> selectByAuthor(String author) {
		log.info("selectById()");
		log.info("author={}", author);
		
		List<PostInfo> entity = postInfoRepository.selectByAuthor(author);
		log.info("entity={}", entity);
		
		// PostInfo 타입의 객체를 PostInfoSelectByIdDTO 타입 객체로
		// 리포지토리 계층의 메서드를 호출 - DB selectById
		return entity.stream().map(PostInfoSelectByAuthorDto::fromEntity).toList();
	}
	
	/**
	 * 0603 지현
	 * 목록 키워드로 불러오기
	 * @return
	 */
	public List<PostInfoSelectByKeywordDto> readByKeyword(String keyword){
		log.info("readByKeyword(keyword={})",keyword);
		List<PostInfo> entity = postInfoRepository.selectWithKeyword(keyword);
		log.info("entity= {}", entity);
		return entity.stream().map(PostInfoSelectByKeywordDto::fromEntity).toList();
	}
	
	public List<PostListDto> read(){
		log.info("read()");
		return postInfoRepository.selectWithCommentCount();
	}
	
	/**
	 * 상세보기 페이지
	 * @param pid
	 * @return
	 */
	public PostDetailDto read(long pid) {
		log.info("read(pid={})",pid);
		
		PostInfo entity = postInfoRepository.selectByPid(pid);
		PostDetailDto dto = PostDetailDto.fromEntity(entity);
		
		long count = postCommentRepository.selectCommentCountWithPid(pid);
		dto.setCommentCount(count);
		return dto;
	}
	
	/**
	 * 새 포스트 작성
	 * @param dto
	 * @return
	 */
	public int create(PostCreateDto dto) {
		log.info("create({})", dto);
		return postInfoRepository.insert(dto.toEntity());
	}
	
	/**
	 * 포스트 업데이트
	 * @param post
	 * @return
	 */
	public int update(PostUpdateDto post) {
		log.info("update({})", post);
		return postInfoRepository.updateTitleAndContent(post.toEntity());
	}
	
	public int delete(long pid) {
		log.info("delete(pid={})", pid);
		return postInfoRepository.deleteByPid(pid);
	}
}
