package com.itwill.shape.repository;

import java.util.List;

import com.itwill.shape.domain.Please;

public interface PleaseRepository {
	
	List<Please> selectBlobList();
	
	int insertBlob(Please please);
}
