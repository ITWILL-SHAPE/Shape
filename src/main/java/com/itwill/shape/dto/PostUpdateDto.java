package com.itwill.shape.dto;

import com.itwill.shape.domain.PostInfo;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class PostUpdateDto {

	private long pid;
	private String title;
	private String content;
	private String hrs_hd;
	
	public PostInfo toEntity() {
		return PostInfo.builder()
				.pid(pid)
				.title(title)
				.content(content)
				.hrs_hd(hrs_hd)
				.build();
	}
}
