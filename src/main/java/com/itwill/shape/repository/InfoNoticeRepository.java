package com.itwill.shape.repository;

import java.util.List;

import com.itwill.shape.domain.Criteria;
import com.itwill.shape.domain.InfoNotice;
import com.itwill.shape.dto.InfoNoticeListDto;
import com.itwill.shape.dto.InfoNoticeUpdateDto;

// 우수빈 notice repository
public interface InfoNoticeRepository {
	
	int insert (InfoNotice notice);
	
	InfoNotice selectByNid (long nid);
	
	int viewCount (long nid);
	
	List<InfoNoticeListDto> selectfixed();
	
	int updateNotice (InfoNotice dto);
	
	int deleteByNid (long nid);
	
	List<InfoNoticeListDto> selectWithPaging(Criteria cri);
	
	int listCount();
}
