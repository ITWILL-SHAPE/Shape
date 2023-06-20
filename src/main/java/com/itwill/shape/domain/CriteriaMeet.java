package com.itwill.shape.domain;

import lombok.Data;

@Data
public class CriteriaMeet {

	private int pageNum;
	private int amount;
	
	private String keyword;
	
	public CriteriaMeet() {
		this(1,15);
	}
	
	public CriteriaMeet(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
