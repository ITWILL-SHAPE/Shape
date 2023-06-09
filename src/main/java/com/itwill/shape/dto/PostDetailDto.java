package com.itwill.shape.dto;
//지현 postpage detail
import java.sql.Timestamp;

import com.itwill.shape.domain.PostInfo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class PostDetailDto {

	private long pid;
	private String title;
	private String content;
	private String author;
	private String hrs_hd;
	private Timestamp created_date;
	private Timestamp modified_date;
	private long commentCount;
	private long views;
	
	public static PostDetailDto fromEntity(PostInfo entity) {
		return PostDetailDto.builder()
				.pid(entity.getPid())
				.title(entity.getTitle())
				.content(entity.getContent())
				.author(entity.getAuthor())
				.hrs_hd(entity.getHrs_hd())
				.created_date(Timestamp.valueOf(entity.getCreated_date()))
				.modified_date(Timestamp.valueOf(entity.getModified_date()))
				.views(entity.getViews())
				.build();
	}
}
