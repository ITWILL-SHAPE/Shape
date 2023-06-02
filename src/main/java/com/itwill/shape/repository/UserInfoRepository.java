package com.itwill.shape.repository;

import com.itwill.shape.domain.UserInfo;

public interface UserInfoRepository {
	
	/**
	 * 0601
	 * 관리자 유저 생성(id, pwd, name)
	 * 
	 * @param UserInfo
	 * @return 0 or 1
	 */
	int insertAdmin(UserInfo user);
	
	/**
	 * 0602
	 * 사용자 유저 생성
	 * @param user
	 * @return
	 */
	int insertMember(UserInfo user);
	
	
	UserInfo selectById(String id);


	int pwdModify(UserInfo entity);

	}
