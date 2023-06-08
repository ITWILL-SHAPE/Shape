package com.itwill.shape.dto;

import java.sql.Timestamp;

import com.itwill.shape.domain.PostInfo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostListDto {
// 또 뭐가져가냐 뭐필요하냐
	private long pid;
	private String hrs_hd;
	private String title;
	private String author;
	private Timestamp created_date;
	
	private long rcnt; //댓글 
	
	public static PostListDto fromEntity(PostInfo entity) {
		return PostListDto.builder()
				.pid(entity.getPid())
				.title(entity.getTitle())
				.author(entity.getAuthor())
				.created_date(Timestamp.valueOf(entity.getCreated_date()))
				.build();
	}
}
