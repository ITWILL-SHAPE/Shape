package com.itwill.shape.web;
import java.sql.Timestamp;
import java.util.List;

// 우수빈 notice 관리자 controller
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.shape.domain.InfoNotice;
import com.itwill.shape.dto.InfoNoticeListDto;
import com.itwill.shape.dto.InfoNoticeCreateDto;
import com.itwill.shape.dto.InfoNoticeUpdateDto;
import com.itwill.shape.service.InfoNoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/mngr/notice")
public class InfoNoticeMngrController {
	
	private final InfoNoticeService infoNoticeService;
	
	/**
	 * 관리자 notice list
	 * @param model
	 */
	@GetMapping("/list")
	public void listNoticeMngr(Model model) {
		log.info("list()");
		List<InfoNoticeListDto> list = infoNoticeService.read();
		System.out.println(list);
		log.info(list.toString());
		model.addAttribute("notices", list);
	}
	
	/**
	 * 관리자 notice detail
	 * @param nid
	 * @param model
	 */
	@GetMapping("/detail")
	public void detail(long nid, Model model) {
		log.info("detail({})", nid);
		InfoNotice notice = infoNoticeService.read(nid);
		Timestamp time = Timestamp.valueOf(notice.getCreated_date());
		
		model.addAttribute("notices", notice);
		model.addAttribute("times", time);
	}
	
	/**
	 * 관리자 notice create
	 */
	@GetMapping("/create")
	public void create() {
		log.info("GET: create()");
	}
	
	@PostMapping("/create") 
	public String create(InfoNoticeCreateDto dto) {
		log.info("POST: create({})", dto);
		int result = infoNoticeService.create(dto);
		log.info("create result = {}", result);
		return "redirect:/mngr/notice/list";
		
	}
	
	/**
	 * 관리자 notice 글 수정화면
	 */
	@GetMapping("/modify")
	public void modify(long nid, Model model) {
		log.info("modify({})", nid);
		
		InfoNotice notice = infoNoticeService.read(nid);
		Timestamp time = Timestamp.valueOf(notice.getCreated_date());
		
		model.addAttribute("notices", notice);
		model.addAttribute("times", time);
	}
	
	/**
	 * 관리자 notice 글 수정
	 * @param dto
	 * @return
	 */
	@PostMapping("/update")
	public String update(InfoNoticeUpdateDto dto) {
		log.info("update({})", dto);
		
		int result = infoNoticeService.update(dto);
		return "redirect:/mngr/notice/list";
	}
	
	@PostMapping("/delete")
	public String detele(long nid) {
		log.info("delete({})", nid);
		int result = infoNoticeService.delete(nid);
		return "redirect:/mngr/notice/list";
	}
}
