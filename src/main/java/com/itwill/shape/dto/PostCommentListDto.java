package com.itwill.shape.dto;

import java.sql.Timestamp;

import com.itwill.shape.domain.PostComment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostCommentListDto {

	// 또 뭐가져가냐 뭐필요하냐
		private long pcid;
		private long pid;
		private String content;
		private String author;
		private Timestamp modified_date;
		
		public static PostCommentListDto fromEntity(PostComment entity) {
			return PostCommentListDto.builder()
					.pcid(entity.getPcid())
					.pid(entity.getPid())
					.content(entity.getContent())
					.author(entity.getAuthor())
					.modified_date(Timestamp.valueOf(entity.getModified_date()))
					.build();
		}
	}
