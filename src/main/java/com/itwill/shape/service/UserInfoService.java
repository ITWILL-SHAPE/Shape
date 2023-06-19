package com.itwill.shape.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.shape.domain.Please;
import com.itwill.shape.domain.UserInfo;
import com.itwill.shape.dto.UserCreateDto;
import com.itwill.shape.dto.UserInfoFindDto;
import com.itwill.shape.dto.UserInfoSelectByIdDto;
import com.itwill.shape.dto.UserInfoSelectPwdByIdDto;
import com.itwill.shape.repository.UserInfoRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserInfoService {
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	private final UserInfoRepository userInfoRepository;
	
	/**
	 * 관리자 생성을 위한 메소드
	 * dto={id, pwd, name}
	 * 
	 * @param dto
	 * @return
	 */
	@Transactional
	public int createAdmin(UserCreateDto dto) {
		log.info("createAdmin(dto = {})", dto);
		dto.setPwd(passwordEncoder.encode(dto.getPwd()));
		
		return userInfoRepository.insertAdmin(dto.toEntityAdmin());
	}
	
	/**
	 * 하지윤
	 * 사용자 생성을 위한 메소드
	 * @param dto
	 * @return
	 */
	public int createMember(UserCreateDto dto) {
		log.info("createMember(dto = {})", dto);
		dto.setPwd(passwordEncoder.encode(dto.getPwd()));
		
		return userInfoRepository.insertMember(dto.toEntityMember());
	}
	
	/**
	 * 하지윤
	 * 사용자 id 중복체크
	 * @param id
	 * @return
	 */
	public int idDupCheck(String id) {
		log.info("idDupCheck(id = {})", id);
		
		return userInfoRepository.idDupCheck(id);
	}
	
	/**
	 * 0606 손창민
	 * DB에서 아규먼트로 전달받은 id와 일치하는 user_info table의 pwd를 inputPwd로 변경
	 */
	public int modifyPwdById(String id, String newPwd) {
		log.info("modifyPwdById(id={}, inputPwd={})", id, newPwd);
		
		return userInfoRepository.modifyPwdById(id, newPwd);
	}
	
	
	/**
	 * 0604 손창민
	 * DB에서 아규먼트로 전달받은 id와 일치하는 UserInfo 객체를 가져온 뒤 비밀번호 필드만을 가지고 있는 dto 타입으로 반환
	 */
	public UserInfoSelectPwdByIdDto selectPwdById(String id) {
		log.info("selectPwdById()");
		log.info("selectPwdbyId(id={})", id);
		
		UserInfo entity = userInfoRepository.selectPwdById(id);
		log.info("entity={}", entity);
		
		UserInfoSelectPwdByIdDto dto = UserInfoSelectPwdByIdDto.fromEntity(entity);
		log.info("dto={}", dto);
		
		return dto;
	}
	
	/**
	 * 김세이 06.01
	 * 마이페이지 첫 화면 개인정보를 위한 메소드
	 * dto={name, gender, id, birth, phone, email}
	 * 
	 * @param id
	 * @return
	 */
	public UserInfoSelectByIdDto selectById(String id) {
		log.info("selectById()");
		log.info("id={}", id);
		
		UserInfo entity = userInfoRepository.selectById(id);
		log.info("entity={}", entity);
		
		UserInfoSelectByIdDto dto = UserInfoSelectByIdDto.fromEntity(entity);
		log.info("dto={}", dto);
		
		return dto;
	}
	
	/**
	 * 김세이 06.19 
	 * 마이페이지 프로필 사진 변경을 위한 메서드 
	 * @param dto
	 * @return int 
	 */
	
	public int setProfile(UserInfoSelectByIdDto dto) {
		log.info("setProfile(dto = {})");
		
		return userInfoRepository.setProfile(dto);
	}
	
	
	
//	public int imageModify(String id, MultipartFile profile) throws IOException {
//		log.info("imageModify({})", id);
//		
//		        // 이미지 파일을 읽어서 byte 배열로 변환
//		        byte[] imageData = profile.getBytes();
//
//		        // 변환된 byte 배열을 데이터베이스에 저장
//		    return userInfoRepository.imageModify(id,imageData);
//	}
	
	
	/**
	 * 하지윤
	 * 해당 이름과 이메일이 일치하는 user의 ID 리턴
	 * @param name
	 * @param email
	 * @return
	 */
	public String findUserId(String name, String email) {
		log.info("findUserId(name = {}, email = {})", name, email);
		
		return userInfoRepository.findUserId(name, email);
	}
	
	/**
	 * 하지윤
	 * 해당 아이디, 이름, 이메일이 일치하는 유저가 있는지 확인
	 * @param dto
	 * @return 0 or 1
	 */
	public int checkUserExist(UserInfoFindDto dto) {
		log.info("checkUserExist(dto = {})", dto);
		
		return userInfoRepository.checkUserExist(dto);
	}
	
	/**
	 * 하지윤
	 * 비밀번호 새로 설정
	 * @param id
	 * @param pwd
	 * @return
	 */
	public int updateUserPwd(String id, String pwd) {
		log.info("updateUserPwd(id = {}, pwd = {})", id, pwd);
		
		return userInfoRepository.updateUserPwd(id, passwordEncoder.encode(pwd));
	}
	
	
	/**
	 * 하지윤
	 * 비밀번호 확인
	 * User의 id와 pwd를 받으면 해당 아이디에 인코드된 패스워드를 들고와
	 * 비교한 후 boolean 리턴
	 * 
	 * @param id
	 * @param pwd
	 * @return boolean
	 */
	public boolean confirmUser(String id, String inputPwd) {
		log.info("confirmUser(id = {}, inputPwd = {})", id, inputPwd);	
		
		// 해당 아이디에 있는 User 비밀번호를 찾음.
		String dbPassword = userInfoRepository.findUserPwd(id);
		log.info("confirmUser(dbPassword{})", dbPassword);
		
		return passwordEncoder.matches(inputPwd, dbPassword);
	}
	/**
	 * 0611손창민
	 * 회원탈퇴 유저정보 삭제
	 * @param id
	 * @return
	 */
	public int deleteUserInfoById(String id) {
		log.info("deleteUserInfoById(id={})", id);
		
		return userInfoRepository.deleteUserInfoById(id);
	}

	public void insertBlob(UserInfoSelectByIdDto dto) {
		// TODO Auto-generated method stub
		
	}

}
