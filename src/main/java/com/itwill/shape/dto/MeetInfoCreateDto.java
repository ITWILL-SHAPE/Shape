package com.itwill.shape.dto;

import org.springframework.web.multipart.MultipartFile;

import com.itwill.shape.domain.MeetInfo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MeetInfoCreateDto {
	
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
	private byte[] img_1;
	private byte[] img_2;
	private byte[] img_3;
	private byte[] img_4;
	private byte[] img_5;
	private String content;
	
	// 사진
	private MultipartFile formFile1;
	private MultipartFile formFile2;
	private MultipartFile formFile3;
	private MultipartFile formFile4;
	private MultipartFile formFile5;
	
	public MeetInfo toEntity() {
		
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
				.img_1(img_1)
				.img_2(img_2)
				.img_3(img_3)
				.img_4(img_4)
				.img_5(img_5)
				.content(content)
				.build();
		
	}
}
