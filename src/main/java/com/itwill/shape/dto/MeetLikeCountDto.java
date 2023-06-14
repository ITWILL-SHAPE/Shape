package com.itwill.shape.dto;

import com.itwill.shape.domain.MeetLike;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MeetLikeCountDto {

		private long mtid;
		private String id;
		private long like_count;
		

}
