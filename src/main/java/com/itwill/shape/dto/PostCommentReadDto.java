package com.itwill.shape.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.itwill.shape.domain.PostComment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
@Builder
public class PostCommentReadDto {

	private long pcid;
	private long pid;
    private String content;
    private String author;
    private Timestamp modifiedDate;
    
    private byte[] profile;
    private String file;

    // DB에서 select한 Reply 타입 객체를 ReplyReadDto 타입 객체로 변환해서 리턴.
    public static PostCommentReadDto fromEntity(PostComment entity) {
        return PostCommentReadDto.builder()
                .pcid(entity.getPcid())
                .pid(entity.getPid())
                .content(entity.getContent())
                .author(entity.getAuthor())
                .modifiedDate(Timestamp.valueOf(entity.getModified_date()))
                .profile(entity.getProfile())
                .build();
    }
    
}
