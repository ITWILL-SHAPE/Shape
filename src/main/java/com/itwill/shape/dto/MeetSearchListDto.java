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
	
	private int pageNum;
	private int amount;
}
