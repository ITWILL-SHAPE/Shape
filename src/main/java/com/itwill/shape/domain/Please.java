package com.itwill.shape.domain;

import java.sql.Blob;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Please {
	
	private int idx;
	private String fileName;
	private byte[] blob;
	// file 보낸 걸 받기
	private MultipartFile uploadFile;
	
}
