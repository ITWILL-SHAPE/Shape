package com.itwill.shape.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.shape.domain.UserInfo;
import com.itwill.shape.dto.MngrMeetGraphDto;
import com.itwill.shape.dto.MngrUserInfoSearchListDto;
import com.itwill.shape.dto.MngrUserInfoSelectDto;
import com.itwill.shape.dto.UserInfoFindDto;
import com.itwill.shape.dto.UserInfoSelectByIdDto;

public interface UserInfoRepository {
	/**
	 * 0605 손창민
	 * 비밀번호 변경
	 * 
	 * @param id
	 * @param inputPwd
	 * @return
	 */
	int modifyPwdById(@Param("id") String id, @Param("newPwd") String newPwd);
	
	
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
	 * 0606
	 * 사용자 아이디 중복 체크
	 */
	int idDupCheck(String id);
	
	/**
	 * 0608 하지윤
	 * 아이디 찾기
	 * 해당 이름과 이메일이 일치하는 사람의 ID 리턴
	 * @param name
	 * @param email
	 * @return id
	 */
	String findUserId(@Param("name") String name, @Param("email") String email);
	
	/**
	 * 0608 하지윤
	 * 해당 아이디, 이름, 이메일이 일치하는 사람이 있는지 확인
	 * @param dto
	 * @return int
	 */
	int checkUserExist(UserInfoFindDto dto);
	
	/**
	 * 0608 하지윤
	 * 비밀번호 새로 설정
	 * @param id
	 * @param pwd
	 * @return
	 */
	int updateUserPwd(@Param("id") String id, @Param("pwd") String pwd);
	
	/**
	 * 하지윤
	 * DB에 있는 pwd를 리턴
	 * @param id
	 * @return
	 */
	String findUserPwd(String id);
	
	
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
	 * 0619 김세이 
	 * 마이페이지 프로필 사진 변경 
	 * 
	 * @param dto 
	 * @return int (0/1)  
	 */
	int setProfile(UserInfoSelectByIdDto dto);
	
	//int imageModify(String id, byte[] ImageData);
	
	
	
	/**
	 * 하지윤
	 * 관리자 - 사용자 검색
	 * @param dto
	 * @return
	 */
	List<UserInfo> selectByKeyword(MngrUserInfoSearchListDto dto);
	
	// 관리자 - 사용자 리스트 페이징
	List<MngrUserInfoSelectDto> selectByKeywordPaging(MngrUserInfoSearchListDto dto);
	
	// 관리자 - 사용자 수 카운트
	int userInfoCount(MngrUserInfoSearchListDto dto);
	
	/**
	 * 0611손창민
	 * 회원탈퇴 - 유저 정보 삭제
	 * @param id
	 * @return
	 */
	int deleteUserInfoById(String id);
	
	/**
	 * 0618배선영
	 * 관리자 - 그래프 남 녀 유저 count 그래프
	 */
	int getMaleUserCount(MngrMeetGraphDto dto); //  관리자 남자 회원수
	
	int getFemaleUserCount(MngrMeetGraphDto dto); // 관리자 여자 회원수


}