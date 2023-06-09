package com.itwill.shape.web;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommonController {
	
	/**
	 * 사용자 main page
	 * @return
	 */
	@GetMapping("/")
	public String home() {
		log.info("home()");
		
		return "/common/main";
	}
	
	
	/**
	 * 관리자 home page 
	 * @return
	 */
	@GetMapping("/mngr")
	public String mngr() {
		log.info("mngr()");
		
 		return "/common/home";
	}
	
	@GetMapping("/test/testHandler")
	public void test() {
		log.info("test()");
	}
	
	@PostMapping("/attach/file")
	@ResponseBody
	public ResponseEntity<Integer> fileAttach(Map<Integer, Object> data) {
		System.out.println(data);
		
		return ResponseEntity.ok(1);
	}
	
}
