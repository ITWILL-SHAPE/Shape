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
public class MeetPrtcp { // 참여자 정보
	
	private long mtid;
	private String prtcp_id;
	private String name;
	private String gender;
	private long phone;
	private String email;
	
	
}
