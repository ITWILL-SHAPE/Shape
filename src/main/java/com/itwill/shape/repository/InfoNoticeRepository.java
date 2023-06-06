package com.itwill.shape.repository;

import java.util.List;

import com.itwill.shape.domain.InfoNotice;
import com.itwill.shape.dto.InfoNoticeListDto;

// 우수빈 notice repository
public interface InfoNoticeRepository {
	
	int insert (InfoNotice notice);
	
	InfoNotice selectByNid (long nid);
	
	List<InfoNoticeListDto> selectOrderByNidDesc();
	
	int uupdateNotice (InfoNotice notice);
	
	int deleteByNid (long nid);
}
