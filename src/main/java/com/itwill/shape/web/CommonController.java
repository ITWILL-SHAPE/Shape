package com.itwill.shape.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommonController {
	
	/**
	 * 사용자 main page
	 * @return
	 */
	@GetMapping({"/", ""})
	public String home() {
		log.info("home()");
		
		return "/common/main";
	}
	
	/**
	 * 관리자 home page 
	 * @return
	 */
	@GetMapping({"/mngr", "/mngr/"})
	public String mngr() {
		log.info("mngr()");
		
 		return "/common/home";
	}
	
}
