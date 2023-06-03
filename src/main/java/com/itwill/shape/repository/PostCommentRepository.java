package com.itwill.shape.repository;

import java.util.List;

import com.itwill.shape.domain.PostComment;
import com.itwill.shape.dto.PostCommentSelectByIdDTO;


public interface PostCommentRepository {

	/**
	 * 0601 손창민
	 * Post_Comment Table에서 아규먼트로 넘겨받은 id와 일치하는 댓글 전부 리턴
	 * @param id
	 * @return List<PostComment>
	 */
	List<PostComment> selectById(String author);
	
	
	/**
	 * 0603 지현
	 * 아래로 게시판 댓글 사용
	 * @param pid
	 * @return
	 */
	long selectCommentCountWithPid(long pid);


	int insert(PostComment entity);


	List<PostComment> selectByPid(long pid);


	PostComment selectByPcid(long pcid);


	int delete(long pcid);


	int update(PostComment entity);
}