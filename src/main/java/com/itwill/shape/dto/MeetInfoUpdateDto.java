package com.itwill.shape.dto;

import org.springframework.security.access.annotation.Secured;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.shape.domain.MeetInfo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class MeetInfoUpdateDto {
	
	// jsp 폼안에 name속성과 맞추면 됨.
	private long mtid;
	private String crtr_id;
	private String title;
	private String category;
	private String sido;
	private String sigungu;
	private String location;
	private String mt_date;
	private String mt_time;
	private String ed_date;
	private long nm_ppl;
	private String mt_cost;
	private String mt_cost_info;
	private byte[] img_1;
	private byte[] img_2;
	private byte[] img_3;
	private byte[] img_4;
	private byte[] img_5;
	private String content;
	
	private MultipartFile formFile1;
	private MultipartFile formFile2;
	private MultipartFile formFile3;
	private MultipartFile formFile4;
	private MultipartFile formFile5;
	
	// 이미지를 보여주기 위한 byte[] to String
	private String file1;
	private String file2;
	private String file3;
	private String file4;
	private String file5;
	
	public MeetInfo updateEntity() {
		
		return MeetInfo.builder()
				.mtid(mtid)
				.crtr_id(crtr_id)
				.title(title)
				.category(category)
				.sido(sido)
				.sigungu(sigungu)
				.location(location)
				.mt_date(mt_date)
				.mt_time(mt_time)
				.ed_date(ed_date)
				.nm_ppl(nm_ppl)
				.mt_cost(mt_cost)
				.mt_cost_info(mt_cost_info)
				.img_1(img_1)
				.img_2(img_2)
				.img_3(img_3)
				.img_4(img_4)
				.img_5(img_5)
				.content(content)
				.build();
		
	}

}
