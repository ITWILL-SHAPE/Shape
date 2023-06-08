package com.itwill.shape.dto;

import java.sql.Timestamp;

import com.itwill.shape.domain.InfoNotice;

// 우수빈 notice 리스트
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
// 우수빈 notice list
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class InfoNoticeListDto {
	
	private long nid;
	private String title;
	private Timestamp created_date;
	private int fix; // 고정여부
	private int views;
	
	public static InfoNoticeListDto fromEntiry(InfoNotice entity) {
		
		return InfoNoticeListDto.builder()
				.nid(entity.getNid())
				.fix(entity.getFix())
				.title(entity.getTitle())
				.views(entity.getViews())
				.created_date(Timestamp.valueOf(entity.getCreated_date()))
				.build();
				// TODO: created_date 뭐가 틀렸지
	}
}
