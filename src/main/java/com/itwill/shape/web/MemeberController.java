package com.itwill.shape.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemeberController {
	
	/**
	 * 사용자 login
	 * @return
	 */
	@GetMapping("/login")
	public void login() {
		log.info("login()");
	}
	
}
