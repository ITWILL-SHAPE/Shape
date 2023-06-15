package com.itwill.shape.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import com.itwill.shape.domain.MeetInfo;
import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.domain.MeetPrtcp;
import com.itwill.shape.domain.UserInfo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MeetMainDetailDto {
	private long mtid; // 상세보기 페이지 아이디
	private String crtr_id; // 아이디
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
	private byte[] img_1;
	private byte[] img_2;
	private byte[] img_3;
	private byte[] img_4;
	private byte[] img_5;
	private String content;
	private long views; 
	private Timestamp created_date;
	private List<MeetPrtcp> prtcpDtoList; // 참여자 리스트 불러오기 (GUEST)
	private UserInfo userHost; // Host 작성자
	private long meetlikecount; // 찜 갯수 
	
		
		public static MeetMainDetailDto fromEntity(MeetInfo entity) {
			return MeetMainDetailDto.builder()
		            .mtid(entity.getMtid())
		            .crtr_id(entity.getCrtr_id())
		            .title(entity.getTitle())
		            .category(entity.getCategory())
		            .sido(entity.getSido())
		            .sigungu(entity.getSigungu())
		            .location(entity.getLocation())
		            .mt_date(entity.getMt_date())
		            .mt_time(entity.getMt_time())
		            .ed_date(entity.getEd_date())
		            .nm_ppl(entity.getNm_ppl())
		            .mt_cost(entity.getMt_cost())
		            .mt_cost_info(entity.getMt_cost_info())
		            .img_1(entity.getImg_1())
		            .img_2(entity.getImg_2())
		            .img_3(entity.getImg_3())
		            .img_4(entity.getImg_4())
		            .img_5(entity.getImg_5())
		            .content(entity.getContent())
		            .views(0)
		            .created_date(Timestamp.valueOf(entity.getCreated_date()))
		            .build();

		}


	

	
	
}
	

	
