package com.itwill.shape.dto;

import com.itwill.shape.domain.PostComment;

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
public class PostCommentDeleteByPcidDto {
	
	private long pcid;
	
	/**
	 * 0608손창민
	 * PostCommentDeletDto 타입의 객체를 PostComment 타입의 객체로 변환
	 * @return PostComment
	 */
	public PostComment toEntity() {
		return PostComment.builder()
				.pcid(pcid)
				.build();
	}
}
