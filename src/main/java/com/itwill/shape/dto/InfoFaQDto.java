package com.itwill.shape.dto;

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
public class InfoFaQDto {
	
	private long fid;
	private String question;
	private String answer;
	
	public InfoFaQ fromEntity(InfoFaQ entity) {
		
		return InfoFaQ.builder()
				.fid(entity.getFid())
				.question(entity.getAnswer())
				.answer(entity.getAnswer())
				.build();
	}

	
}
