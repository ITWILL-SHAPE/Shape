package com.itwill.shape.repository;
// 지현 큐앤에이
import java.util.List;

import com.itwill.shape.domain.Criteria;
import com.itwill.shape.domain.InfoQnA;

public interface InfoQnARepository {

	List<InfoQnA> selectOrderByQidDesc();

	InfoQnA selectByQid(long qid);

	int insert(InfoQnA entity);

	int deleteByQid(long qid);

	int updateAnswerToQnA(InfoQnA entity);

	int listCount();

	List<InfoQnA> getListWithPaging(Criteria cri);

}
