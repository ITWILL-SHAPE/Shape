package com.itwill.shape.repository;

import java.util.List;

import com.itwill.shape.domain.PostComment;
import com.itwill.shape.dto.PostCommentSelectByIdDTO;


public interface PostCommentRepository {

	/**
	 * 손창민
	 * Post_Comment Table에서 아규먼트로 넘겨받은 id와 일치하는 댓글 전부 리턴
	 * @param id
	 * @return List<PostCommentSelectByIdDTO>
	 */
	List<PostComment> selectById(String author);
}