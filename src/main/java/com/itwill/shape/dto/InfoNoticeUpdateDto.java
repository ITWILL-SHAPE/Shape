package com.itwill.shape.dto;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

import com.itwill.shape.domain.InfoNotice;

// 우수빈 notice 관리자 수정
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class InfoNoticeUpdateDto {
	
	private long nid;
	private String title;
	private String content;
	private byte[] atchd_file;
	private int fix;
	private String file_name;
	
	private MultipartFile uploadFile; // file 보낸거 받기
	
	public InfoNotice toEntity() {
		return InfoNotice.builder()
				.nid(nid)
				.title(title)
				.content(content)
				.atchd_file(atchd_file) //TODO: 나중에
				.fix(fix)
				.file_name(file_name)
				.build();
	}
	
}
