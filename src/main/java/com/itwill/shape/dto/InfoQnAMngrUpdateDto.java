package com.itwill.shape.dto;

import com.itwill.shape.domain.InfoQnA;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 관리자 답변 수정용
@NoArgsConstructor
@Setter
@Getter
@ToString
public class InfoQnAMngrUpdateDto {

	private long qid;
	private String anTitle;
	private String anComment;

	public InfoQnA toEntity() {
		return InfoQnA.builder()
				.qid(qid)
				.an_title(anTitle)
				.an_comment(anComment)
				.build();
	}
}
