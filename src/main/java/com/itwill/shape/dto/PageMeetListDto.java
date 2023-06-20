package com.itwill.shape.dto;

import com.itwill.shape.domain.CriteriaMeet;

import lombok.Data;

@Data
public class PageMeetListDto {

	private int startPage, endPage;
	private boolean prev, next;
	
	private int total; //게시물 수
	private CriteriaMeet cri;
	
	public PageMeetListDto(CriteriaMeet cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/15.0))*10;
		
		this.startPage = endPage - 9;
		
		this.prev = this.startPage > 1;

		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		this.endPage = realEnd <= endPage? realEnd : endPage;
		
		this.next = this.endPage < realEnd;
	}
	
}
