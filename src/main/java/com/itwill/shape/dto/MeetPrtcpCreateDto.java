package com.itwill.shape.dto;

import com.itwill.shape.domain.MeetPrtcp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
@Builder
public class MeetPrtcpCreateDto {
	private long mtid;
	private String prtcp_id;
	private String name;
	private String gender;
	private String phone;
	private String email;
	
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
