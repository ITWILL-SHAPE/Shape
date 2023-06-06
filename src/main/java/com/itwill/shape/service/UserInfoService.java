package com.itwill.shape.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.shape.domain.UserInfo;
import com.itwill.shape.dto.UserCreateDto;
import com.itwill.shape.dto.UserInfoSelectByIdDto;
import com.itwill.shape.dto.UserInfoSelectPwdByIdDto;
import com.itwill.shape.repository.UserInfoRepository;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserInfoService {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder passwordEncoder;
	
	private final UserInfoRepository userInfoRepository;
	
	/**
	 * 관리자 생성을 위한 메소드
	 * dto={id, pwd, name}
	 * 
	 * @param dto
	 * @return
	 */
	public int createAdmin(UserCreateDto dto) {
		log.info("createAdmin(dto = {})", dto);
		dto.setPwd(passwordEncoder.encode(dto.getPwd()));
		
		return userInfoRepository.insertAdmin(dto.toEntityAdmin());
	}
	
	/**
	 * 0606 손창민
	 * DB에서 아규먼트로 전달받은 id와 일치하는 user_info table의 pwd를 inputPwd로 변경
	 */
	public int modifyPwdById(String id, String inputPwd) {
		log.info("id={}", id);
		log.info("inputPwd={}", inputPwd);
		
		return userInfoRepository.modifyPwdById(id, inputPwd);
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
	 * 사용자 id 중복체크
	 * @param id
	 * @return
	 */
	public int idDupCheck(String id) {
		log.info("idDupCheck(id = {})", id);
		
		return userInfoRepository.idDupCheck(id);
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
	 * 김세이 06.02 
	 * 마이페이지 프로필 사진 변경을 위한 메서드 
	 * @param id, imageFile 
	 * @return int 
	 */
	public int imageModify(String id, MultipartFile profile) throws IOException {
		log.info("imageModify({})", id);
		
		        // 이미지 파일을 읽어서 byte 배열로 변환
		        byte[] imageData = profile.getBytes();

		        // 변환된 byte 배열을 데이터베이스에 저장
		    return userInfoRepository.imageModify(id,imageData);
	}

}
