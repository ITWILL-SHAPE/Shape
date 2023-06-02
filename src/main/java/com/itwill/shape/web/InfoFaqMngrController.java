package com.itwill.shape.web;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.shape.dto.InfoFaQCreateDto;
import com.itwill.shape.dto.InfoFaQDto;
import com.itwill.shape.service.InfoFaQService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/mngr/faq")
public class InfoFaqMngrController {
	
	private final InfoFaQService infoFaqService;
	/**
	 * faq 관리자 화면 리스트
	 */
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list()");
		
		List<InfoFaQDto> list = infoFaqService.read();
		log.info(list.toString());
		
		model.addAttribute("faqs", list);
	}
	
	/**
	 * faq 관리자 새 글 작성
	 */
	@GetMapping("/create")
	public void create() {
		log.info("GET: create()");
	}
	
	@PostMapping("/create")
	public String create(InfoFaQCreateDto dto) {
		log.info("POST: create({})", dto);
		
		int result = infoFaqService.create(dto);
		log.info("create result = {}", result);
		
		return "redirect:/faq/list";
	}
	
	/**
	 * faq 관리자 글 상세보기
	 */
	@GetMapping("/detail")
	public void detail(long fid, Model model) {
		log.info("detail({})", fid);
		
		InfoFaQDto dto = infoFaqService.read(fid);
		
		model.addAttribute("faq", dto);
	}
	
	
}
