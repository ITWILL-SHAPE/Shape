package com.itwill.shape.web;
// 우수빈 noitce 사용자 controller
import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.shape.domain.Criteria;
import com.itwill.shape.domain.InfoNotice;
import com.itwill.shape.dto.InfoNoticeListDto;
import com.itwill.shape.dto.PageDto;
import com.itwill.shape.service.InfoNoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/info/notice")
public class InfoNoticeController {
	
	private final InfoNoticeService infoNoticeService;
	
	/**
	 * notice list
	 * @param model
	 */
	/*@GetMapping("/list")
	public void noticeList(Model model) {
		log.info("noticeList()");
		List<InfoNoticeListDto> list = infoNoticeService.read();
		System.out.println(list);
		log.info(list.toString());
		model.addAttribute("notices", list);
	}*/
	
	/**
	 * notice detail
	 */
	@GetMapping("/detail")
	public void datailNotice(long nid, Model model) {
		log.info("detailNotice({})", nid);
		infoNoticeService.viewCount(nid);
		InfoNotice notice = infoNoticeService.read(nid);
		Timestamp time = Timestamp.valueOf(notice.getCreated_date());
		model.addAttribute("notices", notice);
		model.addAttribute("times", time);
	}
	
	/**
	 * 리스트 페이징 출력
	 */
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list()");
		
		int total = infoNoticeService.getListCount();
		log.info("listCount={}", total);
		
		List<InfoNoticeListDto> list = infoNoticeService.read(cri);
		
		model.addAttribute("notices", list);
		model.addAttribute("paging", new PageDto(cri, total));
	}
	
}
