package com.itwill.shape.dto;
import com.itwill.shape.domain.InfoQnA;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InfoQnACreateDto {

	private String title;
	private String content;
	private String writer;
	private String secret;
	
	public InfoQnA toEntity() {
		return InfoQnA.builder()
				.title(title)
				.content(content)
				.writer(writer)
				.secret(secret)
				.build();
	}
}
