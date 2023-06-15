package com.itwill.shape.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwill.shape.domain.Criteria;
import com.itwill.shape.domain.PostInfo;
import com.itwill.shape.dto.PostCreateDto;
import com.itwill.shape.dto.PostDetailDto;
import com.itwill.shape.dto.PostInfoSelectByAuthorDto;
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
	 * 0608 손창민
	 * post_info table에서 pid와 일치하는 작성글 삭제
	 * @param pid
	 * @return
	 */
	public int deleteByPid(long pid) {
		log.info("deleteByPid(pid={})", pid);
		
		return postInfoRepository.deleteByPid(pid);
	}
	
	/**
	 * 0601 손창민
	 * post_info table에서 author(id)와 일치하는 작성글 불러오기
	 * @param author(id)
	 * @return
	 */
	public List<PostInfoSelectByAuthorDto> selectByAuthor(String author) {
		log.info("selectById(author(id)={})", author);
		
		List<PostInfo> entity = postInfoRepository.selectByAuthor(author);
		log.info("entity={}", entity);
		
		// PostInfo 타입의 객체를 PostInfoSelectByIdDTO 타입 객체로
		// 리포지토리 계층의 메서드를 호출 - DB selectById
		return entity.stream().map(PostInfoSelectByAuthorDto::fromEntity).toList();
	}
	
	/**
	 * 0615 손창민
	 * post_info table에서 author(id)와 일치하는 작성글 불러오기 with Paging
	 */
	public List<PostInfoSelectByAuthorDto> selectByAuthorWithPaging(String author, Criteria cri) {
		log.info("selectByAuthorWithPaging(author(id)={}, cri={})", author, cri);
		
		List<PostInfo> entity = postInfoRepository.selectByAuthorWithPaging(author, cri);
		log.info("selectByAuthorWithPaging(entity={})", entity);
		
		return entity.stream().map(PostInfoSelectByAuthorDto::fromEntity).toList();
		
	}
	/**
	 * 0603 지현
	 * 사용 안함!
	 * 목록 키워드로 불러오기
	 * @return
	 */
	public List<PostListDto> read(String keyword){
		log.info("read(keyword={})",keyword);
		return postInfoRepository.selectWithKeyword(keyword);
	}
	
	/**
	 * 지현
	 * 검색, 페이징 불러오기
	 * @param keyword
	 * @param cri
	 * @return
	 */
	public List<PostListDto> read(String keyword, Criteria cri){
		log.info("read(keyword={})",keyword);
		Map<String, Object> args = new HashMap<>();
		args.put("keyword", keyword);
		args.put("pageNum", cri.getPageNum()+"");
		args.put("amount", cri.getAmount()+"");
		return postInfoRepository.selectWithKeywordAndPaging(args);
	}
	
	/**
	 * 지현
	 * 목록 페이징 처리해서 불러오
	 * @param cri
	 * @return
	 */
	public List<PostListDto> read(Criteria cri){
		log.info("read(cri={})",cri);
		return postInfoRepository.getListWithPaging(cri);
	}
	
	/**
	 * 지현
	 * 사용 안함!read
	 * 목록 불러오기 
	 * @return
	 */
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
	
	public int viewCount(long pid) {
		log.info("viewCount({})", pid);
		return postInfoRepository.viewCount(pid);
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

	public int getListCount() {
		return postInfoRepository.listCount();
	}

	public int getListCountWithKeyword(String keyword) {
		return postInfoRepository.listCountWithKeyword(keyword);
	}
}
