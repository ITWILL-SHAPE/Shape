package com.itwill.shape.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.shape.service.MngrUserInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/mngr/user")
@Controller
public class MngrUserInfoController {
	
	private final MngrUserInfoService mngrUserInfoService;
	
	// 관리자 - 사용자 관리 list
	@GetMapping("/list")
	public void list(Model model) {
		log.info("userInfoList()");
		
		model.addAttribute("list", mngrUserInfoService.selectAllUser());
	}
}
