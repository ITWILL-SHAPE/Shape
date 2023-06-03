package com.itwill.shape.dto;

import com.itwill.shape.domain.PostInfo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostCreateDto {

	private String title;
	private String content;
	private String author;
	private long hrs_hd;
	
	public PostInfo toEntity() {
		return PostInfo.builder()
				.title(title)
				.content(content)
				.author(author)
				.hrs_hd(hrs_hd)
				.build();
	}
}
