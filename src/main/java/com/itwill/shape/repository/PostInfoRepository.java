package com.itwill.shape.repository;

import java.util.List;

import com.itwill.shape.domain.PostInfo;

public interface PostInfoRepository {
	
	/**
	 * 0601 손창민
	 * Post_Info Table에서 아규먼트로 넘겨받은 id와 일치하는 작성글 전부 리턴
	 * @param id
	 * @return List<PostInfo>
	 */
	List<PostInfo> selectById(String author);
}
