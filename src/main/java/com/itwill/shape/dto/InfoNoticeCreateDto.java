package com.itwill.shape.dto;

import org.springframework.web.multipart.MultipartFile;

import com.itwill.shape.domain.InfoNotice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
@Data
public class InfoNoticeCreateDto {
	
	private String title;
	private String content;
	private byte[] atchd_file;
	private int fix;
	private String file_name;
	
	private MultipartFile uploadFile; // file 보낸거 받기
	
	public InfoNotice toEntity() {
		return InfoNotice.builder()
				.title(title)
				.content(content)
				.atchd_file(atchd_file)
				.fix(fix)
				.file_name(file_name)
				.build();
	}
}
