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
public class MeetLikeDto {

		private long mtid;
		private String id;
		
		// 지언 0613
		private String like_no; // 찜 여부 = (찜 번호 - MEET_LIKE 테이블에 추가할지 말지?)
		
		public MeetLike toEntity() {
			
			return MeetLike.builder()
					.mtid(mtid)
					.id(id)
					.build();
		}
}
