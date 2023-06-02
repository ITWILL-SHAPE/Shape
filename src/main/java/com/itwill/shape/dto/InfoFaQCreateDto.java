package com.itwill.shape.dto;
//우수빈 faq 관리자 작성
import com.itwill.shape.domain.InfoFaQ;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
@Data
public class InfoFaQCreateDto {
	
	private String question;
	private String answer;
	
	public InfoFaQ toEntity() {
		
		return InfoFaQ.builder()
				.question(question)
				.answer(answer)
				.build();
				
	}
}
