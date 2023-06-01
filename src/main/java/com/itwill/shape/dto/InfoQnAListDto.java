package com.itwill.shape.dto;
//지현 큐앤에이 사용자, 관리자 목록 호출
import java.sql.Timestamp;

import com.itwill.shape.domain.InfoQnA;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InfoQnAListDto {
	
	private long qid;
	// 비밀글 체크시 제목은 비밀글입니다.로 노출
	private String title;
	private Timestamp created_date;
	private String secret;
	
	// 답변 완료 되었는지 아닌지 알아야함	
//	private String an_title이 있으면 답변완료, 없으면 확인중
	
	public static InfoQnAListDto fromEntity(InfoQnA entity) {
		return InfoQnAListDto.builder()
				.qid(entity.getQid())
				.title(entity.getTitle())
				.created_date(Timestamp.valueOf(entity.getCreated_date()))
				.secret(entity.getSecret())
				.build();
	}
}
