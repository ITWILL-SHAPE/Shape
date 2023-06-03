package com.itwill.shape.repository;

import java.util.List;

import com.itwill.shape.domain.PostInfo;
import com.itwill.shape.dto.PostListDto;

public interface PostInfoRepository {
	
	/**
	 * 0601 손창민
	 * Post_Info Table에서 아규먼트로 넘겨받은 id와 일치하는 작성글 전부 리턴
	 * @param id
	 * @return List<PostInfo>
	 */
	List<PostInfo> selectById(String author);

	/**
	 * 0603 지현 아래로는 게시판 사용자 페이지에서 보여주는 용
	 * 목록 불러오기
	 * @return
	 */
	List<PostListDto> selectWithCommentCount();

	PostInfo selectByPid(long pid);

	int insert(PostInfo entity);

	int updateTitleAndContent(PostInfo entity);

	int deleteByPid(long pid);
}
