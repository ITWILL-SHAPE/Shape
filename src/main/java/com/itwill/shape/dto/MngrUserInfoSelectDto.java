package com.itwill.shape.dto;

import com.itwill.shape.domain.UserInfo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MngrUserInfoSelectDto {
	
	private int rn;
	private String id;
	private String name;
	private String phone;
	private String join_date;
	
	public static MngrUserInfoSelectDto fromEntity(UserInfo entity) {
		return MngrUserInfoSelectDto.builder()
				.id(entity.getId())
				.name(entity.getName())
				.phone(entity.getPhone())
				.join_date(entity.getJoin_date())
				.build();
				
	}	
}
