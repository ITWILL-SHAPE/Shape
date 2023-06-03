package com.itwill.shape.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.itwill.shape.domain.MeetInfo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
public class MeetMainDetailDto {
	private long mtid; // 상세보기 페이지 아이디
	private String crtr_id; // 주최자 아이디
	private String title;
	private String category;
	private String sido;
	private String sigungu;
	private String location;
	private String mt_date;
	private String mt_time;
	private String ed_date;
	private long nm_ppl;
	private String mt_cost;
	private String mt_cost_info;
	private byte[] img;
	private String content;
//	private long views; //
	private Timestamp created_date;
	private String uEmail; // 주최자 이메일 
		
	
//		public static MeetMainDetailDto fromEntity(MeetInfo entity) {
//			return MeetMainDetailDto.builder()
//		            .mtid(entity.getMtid())
//		            .crtr_id(entity.getCrtr_id())
//		            .title(entity.getTitle())
//		            .category(entity.getCategory())
//		            .sido(entity.getSido())
//		            .sigungu(entity.getSigungu())
//		            .location(entity.getLocation())
//		            .mt_date(entity.getMt_date())
//		            .mt_time(entity.getMt_time())
//		            .ed_date(entity.getEd_date())
//		            .nm_ppl(entity.getNm_ppl())
//		            .img(entity.getImg())
//		            .content(entity.getContent())
//		            .created_date(Timestamp.valueOf(entity.getCreated_date()))
//		            .build();
//			
//		            
//		            
//		}
	
}
	

	
