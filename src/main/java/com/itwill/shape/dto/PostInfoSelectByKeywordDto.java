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
public class PostInfoSelectByKeywordDto {
	
	private long pid;
	private long hrs_hd;
	private String title;
	private String author;
	private Timestamp created_date;
	
	private long rcnt; //댓글 
	
	public static PostInfoSelectByKeywordDto fromEntity(PostInfo entity) {
		return PostInfoSelectByKeywordDto.builder()
				.pid(entity.getPid())
				.title(entity.getTitle())
				.author(entity.getAuthor())
				.created_date(Timestamp.valueOf(entity.getCreated_date()))
				.build();
	}
	
}
