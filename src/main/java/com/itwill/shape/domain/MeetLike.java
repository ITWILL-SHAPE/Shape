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
public class MeetLike {
	
	// 지언 0613
	private String like_no; // 찜 여부 = (찜 번호 - MEET_LIKE 테이블에 추가할지 말지?)
	
	private long mtid;
	private String id;
}