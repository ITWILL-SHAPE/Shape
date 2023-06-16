package com.itwill.shape.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwill.shape.dto.MeetListCountDto;
import com.itwill.shape.service.MeetDetailService;
import com.itwill.shape.service.MeetInfoService;
import com.itwill.shape.service.MeetListService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class CommonController {

	private final MeetInfoService meetInfoService;
	private final MeetListService meetListService;
	private final MeetDetailService meetDetailService;

	/**
	 * 사용자 main page
	 * @return
	 */
	@GetMapping("/")
	public String home(Model model) {
		log.info("home()");
		
		List<MeetListCountDto> rdto = meetListService.mainReadByRecent();
		List<MeetListCountDto> pdto = meetListService.mainReadByPopularity();
		
		// 뷰에 PostDetailDto를 전달.
		model.addAttribute("listRecent", rdto);
		model.addAttribute("listPopularity", pdto);
		
		return "/common/main";
	}
	
	
	/**
	 * 관리자 home page 
	 * @return
	 */
	@GetMapping("/mngr")
	public String mngr() {
		log.info("mngr()");
		
 		return "/common/home";
	}
	
	@GetMapping("/test/testHandler")
	public void test() {
		log.info("test()");
	}
	
}
