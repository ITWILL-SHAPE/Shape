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
		
		public MeetLike toEntity() {
			
			return MeetLike.builder()
					.mtid(mtid)
					.id(id)
					.build();
		}
}
