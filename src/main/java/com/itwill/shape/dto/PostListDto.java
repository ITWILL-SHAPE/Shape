package com.itwill.shape.dto;
//지현
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
	private long pid;
	private String hrs_hd;
	private String title;
	private String author;
	private Timestamp created_date;
	private Timestamp modified_date;
	
	private long rcnt; //댓글 
	
	public static PostListDto fromEntity(PostInfo entity) {
		return PostListDto.builder()
				.pid(entity.getPid())
				.title(entity.getTitle())
				.author(entity.getAuthor())
				.created_date(Timestamp.valueOf(entity.getCreated_date()))
				.modified_date(Timestamp.valueOf(entity.getModified_date()))
				.build();
	}
}
