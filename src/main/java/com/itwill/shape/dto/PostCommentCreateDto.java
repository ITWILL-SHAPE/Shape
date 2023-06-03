package com.itwill.shape.dto;

import com.itwill.shape.domain.PostComment;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class PostCommentCreateDto {

	private long pcid;
	private String content;
	private String author;
	
	public PostComment toEntity() {
		return PostComment.builder()
				.pcid(pcid)
				.content(content)
				.author(author)
				.build();
	}
}
