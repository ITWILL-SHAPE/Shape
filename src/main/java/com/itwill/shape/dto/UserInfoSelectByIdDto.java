package com.itwill.shape.dto;

import java.time.LocalDate;
import java.util.Base64;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import com.itwill.shape.domain.UserInfo;


@NoArgsConstructor	// 기본 생성자
@AllArgsConstructor	// 모든 필드값을 argument로 받는 생성자
@Builder			// builder() 메소드를 만들고 리턴 값은 현재 Class, Post 타입을 리턴해주는 build 메소드
@Getter				// getter 메서드들
@Setter				// setter 메서드들
@ToString			// toString 메서드
@Data	
public class UserInfoSelectByIdDto {
	private String profileImageUrl;

	private byte[] profile;
	private String name; // 이름 
	private String gender; // 성별 
	private String id; // 아이디
	private String birth; // 생년월일  
	private String phone; // 핸드폰번호 
	private String email; // 이메일 

	


	
	/**
	 * 0601 김세이 
	 *  UserInfo 타입 객체를 UserInfoSelectByDto 타입으로 변환해서 리턴
	 * 
	 * @return
	 */
	public static UserInfoSelectByIdDto fromEntity(UserInfo entity) {
		
		System.out.println("dto");
		return UserInfoSelectByIdDto.builder()
				.name(entity.getName())
				.gender(entity.getGender())
				.id(entity.getId())
				.birth(entity.getBirth())
				.phone(entity.getPhone())
				.email(entity.getEmail())
				.build();
	}
	
	/**
	 * 0602 김세이 
	 *  UserInfoSelectByDto 타입 객체를 UserInfo 타입으로 변환해서 리턴
	 * 
	 * @return
	 */
	public UserInfo toEntity() {
		
		return UserInfo.builder()
				.name(name)
				.gender(gender)
				.id(id)
				.birth(birth)
				.phone(phone)
				.build();
	}
	
	/**
	 * 0612 김세이 
	 *  profile 필드를 기반으로 profileImageUrl을 생성 
	 *  프로필 이미지가 있는 경우에만 Base64 인코딩하여 이미지 URL을 생성
	 *  없는 경우에는 null로 설정
	 * 
	 * @return
	 */
	
	public static String generateProfileImageUrl(byte[] profile) {
		if (profile != null && profile.length > 0) {
			String base64Image = Base64.getEncoder().encodeToString(profile);
			return "data:image/png;base64," + base64Image;
		}
		return null;
	} 
	
	
}
