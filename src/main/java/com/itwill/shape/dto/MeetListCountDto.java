package com.itwill.shape.dto;

import org.springframework.web.multipart.MultipartFile;

import com.itwill.shape.domain.MeetInfo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MeetListCountDto {

	private long mtid;
	private byte[] img_1;
	private String sido;
	private String mt_date;
	private String category;
	private long LCNT;
	private long PCNT;
	private long nm_ppl;
	private String title;
	private String CRTR_ID;

	// file 보낸 걸 받기
	private MultipartFile uploadFile;

	// 이미지를 보여주기 위한 byte[] to String
	private String file;

	public static MeetListCountDto fromEntity(MeetInfo entity) {

		return MeetListCountDto.builder().mtid(entity.getMtid()).sido(entity.getSido()).mt_date(entity.getMt_date())
				.category(entity.getCategory()).nm_ppl(entity.getNm_ppl()).title(entity.getTitle()).build();

	}

}
