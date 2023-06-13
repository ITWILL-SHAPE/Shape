package com.itwill.shape.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserInfo {
	private String profileImageUrl;
 
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String birth;
	private String phone;
	private String email;
	private byte[] profile;
	private String join_date;
	private String division;

}
