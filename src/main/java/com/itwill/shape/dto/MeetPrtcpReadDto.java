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
public class MeetPrtcpReadDto {
	
	private long mtid;
	private String prtcp_id;
	private String name;
	private String gender;
	private long phone;
	private String email; 
	
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
