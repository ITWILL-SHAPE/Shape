package com.itwill.shape.dto;
//지현 큐앤에이 사용자 상세 화면(답변이 없을떄)
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
	private String an_title;
	private String an_comment;
	private Timestamp created_date;
	private Timestamp answer_date;
	private String secret;
	
	public static InfoQnADetailDto fromEntity(InfoQnA entity) {
		return InfoQnADetailDto.builder()
				.qid(entity.getQid())
				.title(entity.getTitle())
				.content(entity.getContent())
				.writer(entity.getWriter())
				.an_title(entity.getAn_title())
				.an_comment(entity.getAn_comment())
				.created_date(Timestamp.valueOf(entity.getCreated_date()))
				.answer_date(Timestamp.valueOf(entity.getAnswer_date()))
				.secret(entity.getSecret())
				.build();
	}
}
