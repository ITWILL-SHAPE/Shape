package com.itwill.shape.dto;

import com.itwill.shape.domain.UserInfo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class UserInfoSelectPwdByIdDto {
	
	String pwd;
	
	/**
	 * 0604 손창민
	 * 
	 * DB에서 select한 UserInfo 타입의 객체를 UserInfoSelectPwdByUserIdDTO 타입 객체로 변환해서 리턴.
	 * 
	 * @param entity
	 * @return
	 */
	public static UserInfoSelectPwdByIdDto fromEntity(UserInfo entity) {
		
		return UserInfoSelectPwdByIdDto.builder()
				.pwd(entity.getPwd())
				.build();
	}
	
}
