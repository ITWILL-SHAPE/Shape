package com.itwill.shape.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.itwill.shape.domain.MeetInfo;
import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.domain.MeetPrtcp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MeetInfoPrtcpLikeSelectByPrtcpIdDto {
	
	private long mtid; // meet_info
	private String title; //meet_info
	private String mt_date; //meet_info
//	private byte[] image; // meet_info
	private String sido; //meet_info
	private String category; //meet_info
	private long nm_ppl; // 모집인원수, meet_info
	private long LCNT; // count(meet_like.mtid)
	private long PCNT; // count(meet_prtcp.prtcp_id)
	
	/**
	 * 0602 손창민
	 * 내가 참여중인 모임(prtcp_id), 내가 개설한 모임(crtr_id)에서 사용
	 * meet_info table, meet_prtcp table, meet_like table 에서 가져온(join) data를
	 *  MeetInfoJoPrtcpLikSelectByMtIdDto로 객체로 리턴하는 메서드
	 *  모임팀이 만든대서 보류!
	 */
//	public MeetInfoPrtcpLikeSelectByPrtcpIdDto fromEntity(MeetInfo meetInfo,
//			MeetLike meetLike, MeetPrtcp meetPrtcp) {
//		return MeetInfoPrtcpLikeSelectByPrtcpIdDto.builder()
//				.mtid(meetInfo.getMtid())
//				.title(meetInfo.getTitle())
////				.image(meetInfo.getImg())
//				.sido(meetInfo.getSido())
//				.category(meetInfo.getCategory())
//				.nm_ppl(meetInfo.getNm_ppl())
//				.lcnt(lcnt)
//				.pcnt(pcnt)
//				.build();
//	}
}