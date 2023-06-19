package com.itwill.shape.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MngrUserInfoSearchListDto {
	
	private String searchId;
	private String searchPhone;
	private String searchEmail;
	private String searchRegDateStart;
	private String searchRegDateEnd;
	private int pageNum;
	private int amount;
	
	
}
