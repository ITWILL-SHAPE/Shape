package com.itwill.shape.dto;
//지현 postpage create
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
	private String hrs_hd;
	private long views;
	
	public PostInfo toEntity() {
		return PostInfo.builder()
				.title(title)
				.content(content)
				.author(author)
				.hrs_hd(hrs_hd)
				.views(views)
				.build();
	}
}
