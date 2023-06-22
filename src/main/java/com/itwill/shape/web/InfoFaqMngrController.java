package com.itwill.shape.web;
//우수빈 faq 관리자 화면
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.shape.dto.InfoFaQCreateDto;
import com.itwill.shape.dto.InfoFaQDto;
import com.itwill.shape.dto.InfoFaQUpdateDto;
import com.itwill.shape.service.InfoFaQService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/mngr/faq")
public class InfoFaqMngrController {
	
	private final InfoFaQService infoFaqService;
	/**
	 * faq 관리자 화면 리스트
	 */
	@GetMapping("/list")
	public void list(Model model) {
		//log.info("list()");
		
		List<InfoFaQDto> list = infoFaqService.read();
		//log.info(list.toString());
		
		model.addAttribute("faqs", list);
	}
	
	/**
	 * faq 관리자 새 글 작성
	 */
	@GetMapping("/create")
	public void create() {
		//log.info("GET: create()");
	}
	
	@PostMapping("/create")
	public String create(InfoFaQCreateDto dto) {
		//log.info("POST: create({})", dto);
		
		int result = infoFaqService.create(dto);
		//log.info("create result = {}", result);
		
		return "redirect:/mngr/faq/list";
	}
	
	/**
	 * faq 관리자 글 상세보기
	 */
	@GetMapping("/detail")
	public void detail(long fid, Model model) {
		//log.info("detail({})", fid);
		
		InfoFaQDto dto = infoFaqService.read(fid);
		
		model.addAttribute("faq", dto);
	}
	
	/**
	 * faq 관리자 글 수정 화면
	 * @param fid
	 * @param model
	 */
	@GetMapping("/modify")
	public void modify(long fid, Model model) {
		//log.info("modify({})", fid);
		
		InfoFaQDto dto = infoFaqService.read(fid);
		
		model.addAttribute("faq", dto);
	}
	
	@PostMapping("/delete")
	public String delete(long fid) {
		//log.info("delete({})", fid);
		
		int result = infoFaqService.delete(fid);
		
		return "redirect:/mngr/faq/list";
	}
	
	@PostMapping("/update")
	public String update(InfoFaQUpdateDto dto) {
		//log.info("update({})", dto);
		
		int result = infoFaqService.update(dto);
		return "redirect:/mngr/faq/list";
	}
}
