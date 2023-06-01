package com.itwill.shape.repository;

import java.util.List;

import com.itwill.shape.domain.InfoFaQ;
import com.itwill.shape.dto.InfoFaQDto;

public interface InfoFaQRepository {
	
	int insert (InfoFaQ faq);
	
	List<InfoFaQDto> selectOrderByFid();
	
	int updateFaQ (InfoFaQ faq);
	
	int deleteByFid (long fid);	
}
