package com.itwill.shape.repository;

import java.util.List;
import java.util.Map;

import com.itwill.shape.domain.Criteria;
import com.itwill.shape.domain.InfoQnA;
import com.itwill.shape.domain.PostInfo;
import com.itwill.shape.dto.PostListDto;

public interface PostInfoRepository {

	//마이페이지
	/**
	 * 0601 손창민
	 * post_info table에서 아규먼트로 넘겨받은 id와 일치하는 작성글 전부 리턴
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
	// 마이페이지 끝
	
	/**
	 * 0603 지현 아래로는 게시판 사용자 페이지에서 보여주는 용
	 * 목록 불러오기
	 * @return
	 */
	List<PostListDto> selectWithCommentCount();

	PostInfo selectByPid(long pid);

	int viewCount(long pid);
	
	int insert(PostInfo entity);

	int updateTitleAndContent(PostInfo entity);

	List<PostListDto> selectWithKeyword(String keyword);
	
	List<PostListDto> getListWithPaging(Criteria cri);

	int listCount();

	int listCountWithKeyword(String keyword);

	List<PostListDto> selectWithKeywordAndPaging(Map<String, Object> args);
}
