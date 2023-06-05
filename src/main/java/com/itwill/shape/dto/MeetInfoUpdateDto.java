package com.itwill.shape.dto;

import org.springframework.security.access.annotation.Secured;

import com.itwill.shape.domain.MeetInfo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class MeetInfoUpdateDto {
	
	// jsp 폼안에 name속성과 맞추면 됨.
 private String crtr_id;
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
	
	public MeetInfo updateEntity() {
		
		return MeetInfo.builder()
				.crtr_id(crtr_id)
				.title(title)
				.category(category)
				.sido(sido)
				.sigungu(sigungu)
				.location(location)
				.mt_date(mt_date)
				.mt_time(mt_time)
				.ed_date(ed_date)
				.nm_ppl(nm_ppl)
				.mt_cost(mt_cost)
				.mt_cost_info(mt_cost_info)
				.img(img)
				.content(content)
				.build();
		
	}

}
