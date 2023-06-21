package com.itwill.shape.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.itwill.shape.domain.Criteria;
import com.itwill.shape.domain.InfoQnA;
import com.itwill.shape.domain.PostInfo;
import com.itwill.shape.dto.PostListDto;

public interface PostInfoRepository {

	//마이페이지
	/**
	 * 0601 손창민
	 * post_info table에서 아규먼트로 넘겨받은 author(id)와 일치하는 작성글 전부 리턴
	 * @param id
	 * @return List<PostInfo>
	 */
	List<PostInfo> selectByAuthor(String author);

	/**
	 * 0608 손창민
	 * post_info table에서 아규먼트로 넘겨받은 pid와 일치하는 작성글 삭제
	 * @param pid
	 * @return
	 */
	int deleteByPid(long pid);
	
	/**
	 * 0615 손창민
	 * post_info table에서 아규먼트로 넘겨받은 author(id)와 일치하는 작성글 전부 리턴 with paging
	 */
	List<PostInfo> selectByAuthorWithPaging(@Param("author") String author, @Param("cri") Criteria cri);
	
	/**
	 * 0616 손창민
	 * post_info table에서 아규먼트로 넘겨받은 author(id), keyword와 일치하는 작성글 개수 불러오기
	 */
	int countPosts(@Param("author")String author,  @Param("cri") Criteria cri);
	
	/**
	 * 0616 손창민
	 * post_info table에서 author(id), keyword와 일치하는 작성글 불러오기 with Paging
	 */
	List<PostInfo> selectByAuthorAndKeywordWithPaging(@Param("author") String author,  @Param("cri") Criteria cri);
	
	// 마이페이지 끝
	
	/**
	 * 사용 안함
	 * 0603 지현 아래로는 게시판 사용자 페이지에서 보여주는 용
	 * 목록 불러오기
	 * @return
	 */
	List<PostListDto> selectWithCommentCount();
	
	/**
	 * 게시판 상세보기
	 * @param pid
	 * @return
	 */
	PostInfo selectByPid(long pid);
	
	/**
	 * 조회수
	 * @param pid
	 * @return
	 */
	int viewCount(long pid);
	
	/**
	 * 새 글 작성
	 * @param entity
	 * @return
	 */
	int insert(PostInfo entity);
	
	/**
	 * 수정
	 * @param entity
	 * @return
	 */
	int updateTitleAndContent(PostInfo entity);

	/**
	 * 사용안함
	 * 검색
	 * @param keyword
	 * @return
	 */
	List<PostListDto> selectWithKeyword(String keyword);
	
	/**
	 * 메인 리스트 페이지 페이징과 함께 리스트 출력
	 * @param cri
	 * @return
	 */
	List<PostListDto> getListWithPaging(Criteria cri);

	/**
	 * 페이징을 위한 전체 게시글 카운트
	 * @return
	 */
	int listCount();
	
	/**
	 * 페이징을 위한 검색 게시글 카운트
	 * @param keyword
	 * @return
	 */
	int listCountWithKeyword(String keyword);
	
	/**
	 * 검색 리스트 페이지 페이징과 함께 리스트 출력
	 * @param args
	 * @return
	 */
	List<PostListDto> selectWithKeywordAndPaging(Map<String, Object> args);

}
