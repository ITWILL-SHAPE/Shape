package com.itwill.shape.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.shape.domain.Criteria;
import com.itwill.shape.dto.MngrMeetGraphDto;
import com.itwill.shape.dto.MngrUserInfoSearchListDto;
import com.itwill.shape.dto.PageDto;
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
		log.info("userInfoList(dto = {})", dto);
		
		int total = mngrUserInfoService.getListCount(dto);
		log.info("listCount = {}", total);
		
		Criteria cri = new Criteria();
		if(dto.getPageNum() != 0) {
			cri.setPageNum(dto.getPageNum());
		} else {
			dto.setPageNum(cri.getPageNum());
			dto.setAmount(cri.getAmount());
		}
		
		Map<String, Object> map = mngrUserInfoService.selectByKeyword(dto);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("paging", new PageDto(cri, total));
		model.addAttribute("search", dto);
	}
	
	// 관리자 - 사용자 detail
	@GetMapping("/detail")
	public void detail(Model model, String id) {
		log.info("userInfoDetail(id = {})", id);
		
		model.addAttribute("user", mngrUserInfoService.selectUserDetail(id));
	}
	
	
}
