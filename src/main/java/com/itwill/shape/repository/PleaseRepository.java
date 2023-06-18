package com.itwill.shape.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.shape.domain.Please;

public interface PleaseRepository {
	
	List<Please> selectBlobList();
	
	int insertBlob(Please please);
	
	void deleteBlob(@Param("idx") int idx);
	
	Please selectBlobByIdx(@Param("idx") long idx);
}
