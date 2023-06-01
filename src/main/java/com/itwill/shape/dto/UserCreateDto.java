package com.itwill.shape.dto;

import com.itwill.shape.domain.UserInfo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserCreateDto {
	
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String birth;
	private long phone;
	private String email;
	private byte[] profile;
	private String joinDate;
	private String division;
	
	/**
	 * 0601 하지윤
	 * User - 관리자 생성을 위한 메소드
	 * 
	 * UserCreateDto 타입의 객체를
	 * UserInfo 타입의 객체로 변환해서 리턴하는 메서드.
	 * 
	 * @return
	 */
	public UserInfo toEntityAdmin() {
		return UserInfo.builder()
						.id(id)
						.pwd(pwd)
						.name(name)
						.build();
	}
	
}
