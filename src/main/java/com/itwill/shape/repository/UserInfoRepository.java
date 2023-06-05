package com.itwill.shape.repository;

import org.apache.ibatis.annotations.Param;

import com.itwill.shape.domain.UserInfo;

public interface UserInfoRepository {
	/**
	 * 0605 손창민
	 * 비밀번호 변경
	 * 
	 * @param id
	 * @param inputPwd
	 * @return
	 */
	int modifyPwdById(@Param("id")String id, @Param("inputPwd")String inputPwd);
	
	
	/**
	 * 0604 손창민
	 * UserInfo Table에서 id와 일치하는 유저 객체 가져오기
	 */
	UserInfo selectPwdById(String id);
	
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
	
	/**
	 * 로그인한 id를 이용하여 user의 정보읽기
	 * @param id
	 * @return
	 */	
	UserInfo readUserInfoById(String id);
	
	
	/**
	 * 0602 김세이 
	 * 마이페이지 첫 페이지 
	 * 
	 * @param id 
	 * @return UserInfo 
	 */
	UserInfo selectById(String id);

	/**
	 * 0602 김세이 
	 * 마이페이지 프로필 사진 변경 
	 * 
	 * @param id 
	 * @param imageFile
	 * @return int (0/1)  
	 */
	int imageModify(String id, byte[] ImageData);
	
}