package com.itwill.shape.domain;
import java.time.LocalDateTime;

//우수빈 notice
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
public class InfoNotice {
	private long nid;
	private String title;
	private String content;
	private byte[] atchd_file;
	private int views;
	private LocalDateTime created_date;
	private int fix;

}
