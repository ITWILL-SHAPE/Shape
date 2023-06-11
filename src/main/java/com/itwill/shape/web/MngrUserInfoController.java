package com.itwill.shape.web;

import java.util.List;

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
	public void list(Model model) {
		log.info("userInfoList()");
		
		model.addAttribute("list", mngrUserInfoService.selectAllUser());
	}
	
	// 관리자 - 사용자 detail
	@GetMapping("/detail")
	public void detail(Model model, String id) {
		log.info("userInfoDetail(id = {})", id);
		
		model.addAttribute("user", mngrUserInfoService.selectUserDetail(id));
	}
	
	// 관리자 - 사용자 검색
	@PostMapping("/list")
	@ResponseBody
	public List<MngrUserInfoSelectDto> searchList(Model model, @RequestBody MngrUserInfoSearchListDto dto) {
		log.info("searchUserList(dto = {})", dto);
		
		// model.addAttribute("list", mngrUserInfoService.selectByKeyword(dto));
		
		return mngrUserInfoService.selectByKeyword(dto);
	}
	
	/*
	@RequestMapping("/list")
	public String mngrUserList(Model model, @RequestBody(required = false) MngrUserInfoSearchListDto dto) {
		log.info("mngrUserList()");
		
		List<MngrUserInfoSelectDto> list = mngrUserInfoService.selectByKeyword(dto);
		model.addAttribute("list", list);
		model.addAttribute("search", dto);
		
		return "/mngr/user/list";
	}
	*/
}
