package com.itwill.shape.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.shape.domain.InfoFaQ;
import com.itwill.shape.dto.InfoFaQDto;
import com.itwill.shape.service.InfoFaQService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/info")
public class InfoFaQController {
	
	private final InfoFaQService infoFaQService;
	
	@GetMapping("/faq")
	public void faq(Model model) {
		log.info("faq()");
		List<InfoFaQDto> list = infoFaQService.read();
		System.out.println(list);
		// view에 보여줄 데이터를 Model에 저장.
		model.addAttribute("faq", list);
	}
	
	
}
