package com.itwill.shape.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.shape.domain.PostComment;


public interface PostCommentRepository {
	/**
	 * 0608 손창민
	 * post_comment table에서 아규먼트로 넘겨받은 author, comment와 일치하는 댓글 삭제
	 * @param author
	 * @param content
	 * @return
	 */
	int deleteByPcid(long pcid);
	
	/**
	 * 0601 손창민
	 * post_comment table에서 아규먼트로 넘겨받은 id와 일치하는 댓글 전부 리턴
	 * @param id
	 * @return List<PostComment>
	 */
	List<PostComment> selectByAuthor(String author);
	
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

	
	int deleteCommentByPid(long pid);

}