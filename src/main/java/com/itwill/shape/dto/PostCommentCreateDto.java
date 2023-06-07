package com.itwill.shape.dto;

import com.itwill.shape.domain.PostComment;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class PostCommentCreateDto {

	private long pid;
	private String content;
	private String author;
	
	public PostComment toEntity() {
		return PostComment.builder()
				.pcid(pid)
				.content(content)
				.author(author)
				.build();
	}
}
