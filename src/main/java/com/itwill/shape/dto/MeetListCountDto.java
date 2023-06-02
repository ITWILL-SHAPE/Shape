package com.itwill.shape.dto;

import com.itwill.shape.domain.MeetInfo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class MeetListCountDto {
	
	private long mtid;
//	private byte[] img_1;
	private String sido;
	private String mt_date;
	private String category;
	private long lcnt;
	private long pcnt;
	private long nm_ppl;
	private String title;

	public static MeetListCountDto fromEntity(MeetInfo entity) {
		
		return MeetListCountDto.builder()
				.mtid(entity.getMtid())
				.sido(entity.getSido())
				.mt_date(entity.getMt_date())
				.category(entity.getCategory())
				.nm_ppl(entity.getNm_ppl())
				.title(entity.getTitle())
				.build();
		
	}
		
}
