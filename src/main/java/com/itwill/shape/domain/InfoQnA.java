package com.itwill.shape.domain;
// 지현 qna 모델
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class InfoQnA {

	private long qid;
	private String title;
	private String content;
	private String writer;
	private String an_title;
	private String an_comment;
	private LocalDateTime created_date;
	private LocalDateTime answer_date;
	private String secret; //check Y or N
	
}
