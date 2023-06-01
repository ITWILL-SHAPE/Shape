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
public class MeetInfo {

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
	private int nm_ppl;
	private String mt_cost;
	private String mt_cost_info;
	private byte[] img;
	private String content;
	private int views;
	private LocalDateTime created_date;
	
}
