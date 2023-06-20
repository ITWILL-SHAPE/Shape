package com.itwill.shape.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

import com.itwill.shape.domain.MeetInfo;
import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.domain.MeetPrtcp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MeetInfoPrtcpLikeSelectByPrtcpIdDto {

	private long mtid; // meet_info
	private String title; // meet_info
	private String mt_date; // meet_info
	private byte[] img_1; // meet_info
	private String sido; // meet_info
	private String category; // meet_info
	private long nm_ppl; // 모집인원수, meet_info
	private long LCNT; // count(meet_like.mtid)
	private long PCNT; // count(meet_prtcp.prtcp_id)
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