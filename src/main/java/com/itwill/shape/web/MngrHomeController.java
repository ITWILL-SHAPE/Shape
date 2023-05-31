package com.itwill.shape.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/mngr")
@Controller
public class MngrHomeController {
	
	/**
	 * 관리자 main page 
	 * @return
	 */
	@GetMapping({"/", ""})
	public String mngr() {
		log.info("mngr()");
		
 		return "/mngr/home";
	}
	
	
}
