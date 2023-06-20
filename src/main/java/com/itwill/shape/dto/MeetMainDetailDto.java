package com.itwill.shape.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.itwill.shape.domain.MeetInfo;
import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.domain.MeetPrtcp;
import com.itwill.shape.domain.UserInfo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MeetMainDetailDto { // 상세페이지
	private long mtid; // 상세보기 페이지 아이디
	private String crtr_id; // 아이디
	private String title; // 제목
	private String category; // 카테고리
	private String sido; // 시도
	private String sigungu; //시군구
	private String location; // 상세주소
	private String mt_date; // 모집일정
	private String mt_time; // 모집시간
	private String ed_date; // 참여종료
	private long nm_ppl; //모집인원
	private String mt_cost; // 참가비
	private String mt_cost_info; // 참가비용 정보
	private byte[] img_1; //이미지 1
	private byte[] img_2; //이미지 2
	private byte[] img_3; // 이미지 3
	private byte[] img_4; // 이미지 4
	private byte[] img_5; // 이미지 5
	private String content; // 모임내용
	private long views;  // 조회수 (안함)
	private Timestamp created_date; // 작성한 시간
	private List<MeetPrtcp> prtcpDtoList; // 참여자 리스트 불러오기 (GUEST)
	private UserInfo userHost; // USER 작성자
	private long meetlikecount; // 찜 갯수
	private List<MeetLike> meetLikeId; // 찜 한 아이디
	private long meetNumberPrtcp; // 참여자 인원수

	// 사진
	private String file1;
	private String file2;
	private String file3;
	private String file4;
	private String file5;
	private String file6;
	
	
	
	
		
	
	
		
		public static MeetMainDetailDto fromEntity(MeetInfo entity) {
			return MeetMainDetailDto.builder()
		            .mtid(entity.getMtid())
		            .crtr_id(entity.getCrtr_id())
		            .title(entity.getTitle())
		            .category(entity.getCategory())
		            .sido(entity.getSido())
		            .sigungu(entity.getSigungu())
		            .location(entity.getLocation())
		            .mt_date(entity.getMt_date())
		            .mt_time(entity.getMt_time())
		            .ed_date(entity.getEd_date())
		            .nm_ppl(entity.getNm_ppl())
		            .mt_cost(entity.getMt_cost())
		            .mt_cost_info(entity.getMt_cost_info())
		            .img_1(entity.getImg_1())
		            .img_2(entity.getImg_2())
		            .img_3(entity.getImg_3())
		            .img_4(entity.getImg_4())
		            .img_5(entity.getImg_5())
		            .content(entity.getContent())
		            .views(0)
		            .created_date(Timestamp.valueOf(entity.getCreated_date()))
		            .build();

		}


	

	
	
}
	

	
