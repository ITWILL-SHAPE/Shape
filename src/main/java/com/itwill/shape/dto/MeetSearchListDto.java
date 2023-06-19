package com.itwill.shape.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MeetSearchListDto {

	private String searchCategory;
	private String searchSidoValue;
	private String searchSortBy;
	private String searchTitle;
	private String searchMozipCheck;
	
	private int pageNum; //페이지 수
	private int amount; //현재 페이지에 뿌릴 게시글 수
	
	private int maleCount; // 남자 회원수
	private int feMaleCount; // 여자회원수
}
