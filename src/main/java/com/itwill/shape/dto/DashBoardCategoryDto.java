package com.itwill.shape.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class DashBoardCategoryDto {
	/*
	private int trip;
	private int ex;
	private int food;
	private int hob;
	private int st;
	private int art;
	private int oth;
	*/
	
	private String category;
	private long count; 

}
