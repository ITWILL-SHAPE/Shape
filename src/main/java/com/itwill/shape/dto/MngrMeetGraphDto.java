package com.itwill.shape.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MngrMeetGraphDto {
	private int maleCount; // 남자 회원수
	private int feMaleCount; // 여자회원수
}
