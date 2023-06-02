package com.itwill.shape.dto;

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
public class MeetInfoPrtcpLikeSelectByMtIdDTO {
	
	private long mtid; // meet_info
	private String title; //meet_info
	private String mt_date; //meet_info
	private byte[] image; // meet_info
	private String sido; //meet_info
	private String category; //meet_info
	private int nm_ppl; // 모집인원수, meet_info
	private int lcnt; // count(meet_like.mtid)
	private int pcnt; // count(meet_prtcp.prtcp_id)
	
	/**
	 * 0602 손창민
	 * meet_info table, meet_prtcp table, meet_like table 에서 가져온(join) data를
	 *  MeetInfoJoPrtcpLikSelectByMtIdDTO로 객체로 리턴하는 메서드
	 *  모임팀이 만든대서 보류!
	 */
//	public MeetInfoPrtcpLikeSelectByMtIdDTO fromEntity(MeetInfo meetInfo,
//			MeetLike meetLike, MeetPrtcp, meetPrtcp) {
//		return MeetInfoPrtcpLikeSelectByMtIdDTO.builder()
//				.mtid(meetInfo.getMtid())
//				.title(meetInfo.getTitle())
//				.image(meetInfo.getImg())
//				.sido(meetInfo.getSido())
//				.category(meetInfo.getCategory())
//				.nm_ppl(meetInfo.getNm_ppl())
//				.lnct(meetLike.get)
//				.build()
//	}
}