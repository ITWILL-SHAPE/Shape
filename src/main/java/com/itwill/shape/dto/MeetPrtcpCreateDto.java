package com.itwill.shape.dto;

import com.itwill.shape.domain.MeetPrtcp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
@Builder
@Getter
public class MeetPrtcpCreateDto { // 참여자 정보 insert
	private long mtid; // 참여한 모임 PK
	private String prtcp_id; // 참여자 아이다
	private String name; // 참여자 이름
	private String gender; // 참여자 성
	private String phone; // 참여자 폰
	private String email; // 참여자 이메일
	
		// 참여자 정보 넣기
		public MeetPrtcp toEntity() {
			return MeetPrtcp.builder()
					.mtid(mtid)
					.prtcp_id(prtcp_id)
					.name(name)
					.gender(gender)
					.phone(phone)
					.email(email)
					.build();
		}
}
