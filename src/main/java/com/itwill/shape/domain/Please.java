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
	
	// 이미지를 보여주기 위한 byte[] to String
	private String file;
	
}
