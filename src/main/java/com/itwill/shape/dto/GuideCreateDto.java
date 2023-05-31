package com.itwill.shape.dto;

import com.itwill.shape.domain.Guide;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor	// 기본 생성자
@AllArgsConstructor	// 모든 필드값을 argument로 받는 생성자
@Builder			// builder() 메소드를 만들고 리턴 값은 현재 Class, Post 타입을 리턴해주는 build 메소드
@Getter				// getter 메서드들
@Setter				// setter 메서드들
@ToString			// toString 메서드
@Data				// Getter, Setter, toString, equals, hashCode
public class GuideCreateDto {
	
	// DTO 작명 방법
	// : Domain 이름 + Service 메소드 이름 + DTO
	// ex> GuideCreateDTO, GuideSelectUserByIdDTO, ..
	
	// DTO 작성 방법
	// : 자신이 사용할 DB의 DTO를 모두 확인 후
	//	 필요한 필드가 모두 없을 경우에 DTO 생성.
	// : DTO에 작성하는 메서드는 무슨 역할을 하는지 적고 작성자 이름 적기.
	
	
	private String title;
	private String content;
	private String author;
	
	
	/**
	 * 0531 하지윤
	 * GuideCreateDto 타입의 객체를 Guide 타입의 객체로 변환해서 리턴하는 메서드.
	 * 
	 * @return
	 */
	public Guide toEntity() {
		
		return Guide.builder()
				   .title(title)
				   .content(content)
				   .author(author)
				   .build();
	}
}
