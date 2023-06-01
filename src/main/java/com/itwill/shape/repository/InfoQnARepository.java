package com.itwill.shape.repository;

import java.util.List;

import com.itwill.shape.domain.InfoQnA;

public interface InfoQnARepository {

	List<InfoQnA> selectOrderByQidDesc();

	InfoQnA selectByQid(long qid);

	int insert(InfoQnA entity);

	int updateAnswerToQnA(InfoQnA entity);

	int deleteByQid(long qid);

	
}
