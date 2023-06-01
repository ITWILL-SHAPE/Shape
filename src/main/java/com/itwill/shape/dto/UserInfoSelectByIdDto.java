package com.itwill.shape.dto;

import java.time.LocalDate;
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

	private String name; // 이름 
	private String gender; // 성별 
	private String id; // 아이디
	private String birth; // 생년월일  
	private long phone; // 핸드폰번호 
	private String email; // 이메일 
	


	
	/**
	 * 0601 김세이 
	 *  UserMember 타입 객체를 UserMemeberDto 타입으로 변환해서 리턴
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
}
