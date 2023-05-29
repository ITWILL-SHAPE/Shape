package com.itwill.shape.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	/**
	 * 사용자 home
	 * @return
	 */
	@GetMapping("/")
	public String home() {
		log.info("home()");
		
//		return "/common/header";
//		return "/common/footer";
		return "main";
	}
	
	@GetMapping("/mngr")
	public String mngr() {
		log.info("mngr()");
		
 		return "/mngr/home";
//		return "/common/sidebar";
	}
	
	
}
