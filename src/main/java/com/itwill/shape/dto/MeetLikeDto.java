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
public class MeetLikeDto { // 찜

		private long mtid; // 작성한 글 번호 PK
		private String id; // 찜한 USER 아이디 PK
		
		public MeetLike toEntity() {
			
			return MeetLike.builder()
					.mtid(mtid)
					.id(id)
					.build();
		}
}
