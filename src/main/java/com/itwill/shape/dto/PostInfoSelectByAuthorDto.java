package com.itwill.shape.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.itwill.shape.domain.Guide;
import com.itwill.shape.domain.PostInfo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@ToString
@Getter
@Setter
public class PostInfoSelectByAuthorDto {
	
	long pid;
	private String title;
	private Timestamp created_date;
	
	/**
	 * 0601 손창민
	 * DB에서 select한 PostInfo 타입의 객체를 PostInfoSelectByID 타입의 객체로 변환해서 리턴.
	 * 
	 * @return
	 */
	public static PostInfoSelectByAuthorDto fromEntity(PostInfo entity) {
		
		return PostInfoSelectByAuthorDto.builder()
				.pid(entity.getPid())
				.title(entity.getTitle())
				.created_date(Timestamp.valueOf(entity.getCreated_date()))
				.build();
	}
	
}
