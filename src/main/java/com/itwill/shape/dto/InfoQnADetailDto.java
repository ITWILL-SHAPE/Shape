package com.itwill.shape.dto;
//사용자
import java.sql.Timestamp;

import com.itwill.shape.domain.InfoQnA;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class InfoQnADetailDto {

	private long qid;
	private String title;
	private String content;
	private String writer;
	private String anTitle;
	private String anComment;
	private Timestamp createdDate;
	private Timestamp answerDate;
	private String secret;
	
	public static InfoQnADetailDto fromEntity(InfoQnA entity) {
		return InfoQnADetailDto.builder()
				.qid(entity.getQid())
				.title(entity.getTitle())
				.content(entity.getContent())
				.writer(entity.getWriter())
				.createdDate(Timestamp.valueOf(entity.getCreated_date()))
				.answerDate(Timestamp.valueOf(entity.getAnswer_date()))
				.secret(entity.getSecret())
				.build();
	}
}
