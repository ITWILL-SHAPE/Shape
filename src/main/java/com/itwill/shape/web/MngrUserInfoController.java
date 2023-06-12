package com.itwill.shape.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.shape.dto.MngrUserInfoSearchListDto;
import com.itwill.shape.dto.MngrUserInfoSelectDto;
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
	public void list(Model model, MngrUserInfoSearchListDto dto) {
		log.info("userInfoList()");
		
		model.addAttribute("list", mngrUserInfoService.selectByKeyword(dto));
		model.addAttribute("search", dto);
	}
	
	// 관리자 - 사용자 detail
	@GetMapping("/detail")
	public void detail(Model model, String id) {
		log.info("userInfoDetail(id = {})", id);
		
		model.addAttribute("user", mngrUserInfoService.selectUserDetail(id));
	}
	
}
