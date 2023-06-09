package com.itwill.shape.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MeetInfo { //작성내용

	private long mtid;
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
	private long views;
	private LocalDateTime created_date;
	
}
