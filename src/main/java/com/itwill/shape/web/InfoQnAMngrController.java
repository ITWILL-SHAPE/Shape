package com.itwill.shape.web;
// 지현 큐앤에이 관리
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.shape.dto.InfoQnADetailDto;
import com.itwill.shape.dto.InfoQnAListDto;
import com.itwill.shape.dto.InfoQnAMngrUpdateDto;
import com.itwill.shape.service.InfoQnAService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/mngr/qna")
public class InfoQnAMngrController {
	private final InfoQnAService infoQnAService;
	
	/**
	 * 큐앤에이 관리자 리스트 불러오기
	 * @param qid
	 * @param model
	 */
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list()");
		
		List<InfoQnAListDto> list = infoQnAService.read();
		model.addAttribute("infoQnAs", list);
	}
	
	@GetMapping("/modify")
	public void modify(long qid, Model model) {
		log.info("modify(qid={})", qid);
		InfoQnADetailDto dto = infoQnAService.read(qid);
		model.addAttribute("infoQnA", dto);
	}
	
	/**
	 * 관리자 큐앤에이 답변 화면인데
	 * 수정과 동일함, 상세화면에서 그대로 머무름. 상세화면 필요한지 모르겠.
	 * @param dto
	 * @return
	 */
	@PostMapping("/update")
	public String update(InfoQnAMngrUpdateDto dto) {
		log.info("update(dto={})", dto);
		int result = infoQnAService.update(dto);
		log.info("답변 업데이트 결과 ={}", result);
		return "redirect:/mngr/qna/list";
	}
	
	
}
