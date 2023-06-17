package com.itwill.shape.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Test {
	
	private int t_idx;
    private String testTitle;
    private String testContent;
    private String testName;
    private String testDate;
	private String fileName;
	private MultipartFile uploadFile;

}
