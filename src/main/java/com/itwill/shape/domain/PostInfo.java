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
public class PostInfo {
	
	private long pid;
	private String title;
	private String content;
	private String author;
	private String hrs_hd;
	private LocalDateTime created_date;
	private LocalDateTime modified_date;
	private long views;
	
}
