package com.itwill.shape.dto;
import com.itwill.shape.domain.InfoQnA;

import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@Data
public class InfoQnAMngrUpdateDto {

	private long qid;
	private String an_title;
	private String an_comment;

	public InfoQnA toEntity() {
		return InfoQnA.builder()
				.qid(qid)
				.an_title(an_title)
				.an_comment(an_comment)
				.build();
	}
}
