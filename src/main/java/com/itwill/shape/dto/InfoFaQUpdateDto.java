package com.itwill.shape.dto;
//우수빈 faq 관리자 수정
import com.itwill.shape.domain.InfoFaQ;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class InfoFaQUpdateDto {
	
	private long fid;
	private String question;
	private String answer;
	
	public InfoFaQ toEntity() {
		
		return InfoFaQ.builder()
				.fid(fid)
				.question(question)
				.answer(answer)
				.build();
	}
}
