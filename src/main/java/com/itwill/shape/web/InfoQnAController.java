package com.itwill.shape.web;
// 지현 큐앤에이 사용자
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.shape.dto.InfoQnACreateDto;
import com.itwill.shape.dto.InfoQnADetailDto;
import com.itwill.shape.dto.InfoQnAListDto;
import com.itwill.shape.service.InfoQnAService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/info")
@Controller
public class InfoQnAController {
	
	private final InfoQnAService infoQnAService;
	
	/**
	 * 큐앤에이 사용자 메인 페이지 리스트 불러오기
	 * @param qid
	 * @param model
	 */
	@GetMapping("/qna")
	public void list(Model model) {
		log.info("list()");
		
		List<InfoQnAListDto> list = infoQnAService.read();
		model.addAttribute("infoQnAs", list);
	}
	
	@GetMapping("qna/create")
	public void create() {
		log.info("GET:create()");
	}
	
	/**
	 * 사용자 큐앤에이 등록
	 * @param dto
	 * @return
	 */
	@PostMapping("/qna/create")
	public String create(InfoQnACreateDto dto) {
		log.info("POST: create({})", dto);
		int result = infoQnAService.create(dto);
		log.info("큐앤에이 등록 결과 ={}", result);
		return "redirect:/qna";
	}
	
	/**
	 * 사용자 큐앤에이 디테일 보기
	 * @param qid
	 * @param model
	 */
	@GetMapping("/qna/detail")
	public void detail(long qid, Model model) {
		log.info("detail(qid={})", qid);
		InfoQnADetailDto dto = infoQnAService.read(qid);
		model.addAttribute("infoQnA", dto);
	}
	
	/**
	 * 사용자 큐앤에이 삭제 
	 * @param qid
	 * @return
	 */
	@PostMapping("/qna/delete")
	public String delete(long qid) {
		log.info("delete(id={})", qid);
		int result = infoQnAService.delete(qid);
		log.info("삭제 결과 = {}", qid);
		return "redirect:/info/qna";
	}
}
