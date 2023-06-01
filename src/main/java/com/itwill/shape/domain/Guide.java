package com.itwill.shape.domain;

import java.time.LocalDateTime;

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
public class Guide {
	
	// Domain 작명 방법
	// : 해당 DB의 테이블 이름과 동일하게 작성.
	// : 카멜 표기법으로 작성.
	// : DB에 새로운 TABLE 생성 시 모두에게 알리기.
	
	// Domain 작성 방법
	// : 딱히...
	
	private long id;
	private String title;
	private String content;
	private String author;
	private LocalDateTime created_time;
	private LocalDateTime modified_time;
	
	
}
