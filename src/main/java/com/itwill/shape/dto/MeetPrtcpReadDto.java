package com.itwill.shape.dto;

import com.itwill.shape.domain.MeetInfo;
import com.itwill.shape.domain.MeetPrtcp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
@Builder
public class MeetPrtcpReadDto { // 참여자 정보 불러오기
	
	private long mtid; // 참여자가 참여한 PK
	private String prtcp_id; // 참여자 아이디
	private String name; // 참여자 이름
	private String gender; // 참여자 성
	private String phone; // 참여자 번호
	private String email;  // 참여자 이메일
	
		public static MeetPrtcpReadDto fromEntity(MeetPrtcp entity) {
			return MeetPrtcpReadDto.builder()
					.mtid(entity.getMtid())
					.prtcp_id(entity.getPrtcp_id())
					.name(entity.getName())
					.gender(entity.getGender())
					.phone(entity.getPhone())
					.email(entity.getEmail())
					.build();
					
		}
}
