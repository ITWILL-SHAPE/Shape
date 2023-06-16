package com.itwill.shape.web;

import java.time.LocalDate;
import java.util.ArrayList;
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
		
		LocalDate currentDate = LocalDate.now();

		List<LocalDate> targetDate = new ArrayList<>();

		List<MeetListCountDto> filteredDto = new ArrayList<>();
		for (MeetListCountDto item : rdto) {
			String date = item.getMt_date();
			log.info("확인 = {}", date);
			LocalDate parsedDate = LocalDate.parse(date);
			targetDate.add(parsedDate);
			log.info(parsedDate.toString());
			int isPast = currentDate.compareTo(parsedDate); // 현재 시간과 비교하여 지난 시간인지 확인

			if (isPast <= 0) { // 모집날짜가 미래일 경우
				filteredDto.add(item);
				
			} else {
				log.info("떨구는 것 확인 = {}", item);
			}
		}
		
		List<MeetListCountDto> filteredDto2 = new ArrayList<>();
		for (MeetListCountDto item : pdto) {
			String date = item.getMt_date();
			log.info("확인 = {}", date);
			LocalDate parsedDate = LocalDate.parse(date);
			targetDate.add(parsedDate);
			log.info(parsedDate.toString());
			int isPast = currentDate.compareTo(parsedDate); // 현재 시간과 비교하여 지난 시간인지 확인
			
			if (isPast <= 0) { // 모집날짜가 미래일 경우
				filteredDto2.add(item);
				
			} else {
				log.info("떨구는 것 확인 = {}", item);
			}
		}

		if (!filteredDto.isEmpty() && !filteredDto2.isEmpty()) {
			// 뷰에 PostDetailDto를 전달.
			model.addAttribute("listRecent", filteredDto);
			model.addAttribute("listPopularity", filteredDto2);
			
			for (MeetListCountDto c : filteredDto) {
				log.info("확인 = {}", c);
			}
		} else {
			log.info("{} 이후로 존재하는 mt_date는 존재하지 않습니다. DB를 확인해보세요...", targetDate.toString());
		}
		// 뷰에 PostDetailDto를 전달.
		
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
