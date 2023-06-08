package com.itwill.shape.dto;

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
	
	public InfoNotice toEntity() {
		return InfoNotice.builder()
				.title(title)
				.content(content)
				.atchd_file("".getBytes()) //TODO: 나중에 ㅠ
				.fix(fix)
				.build();
	}
}
