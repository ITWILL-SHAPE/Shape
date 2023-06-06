package com.itwill.shape.dto;
import java.security.Timestamp;

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
	private String fix; // 고정여부
	
	public static InfoNoticeListDto fromEntiry(InfoNotice entity) {
		
		return InfoNoticeListDto.builder()
				.nid(entity.getNid())
				.title(entity.getTitle())
				.build();
				// TODO: created_date 뭐가 틀렸지
	}
}
