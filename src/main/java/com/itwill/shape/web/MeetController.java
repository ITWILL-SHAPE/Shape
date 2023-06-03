package com.itwill.shape.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.shape.dto.MeetInfoCreateDto;
import com.itwill.shape.dto.MeetInfoUpdateDto;
import com.itwill.shape.dto.MeetMainDetailDto;
import com.itwill.shape.service.MeetInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/meet")
@Controller
public class MeetController {
	
	private final MeetInfoService meetInfoService;
	
	@GetMapping("/create")
	public void create() {
		log.info("GET: create()");
	}
	
	/**
	 * 0604 정지언
	 * 모임 만들기(모임 등록)
	 * @param dto
	 * @return
	 */
	@PostMapping("/create")
	public String create(MeetInfoCreateDto dto) {
		log.info("POST: create({})", dto);
		
		int result = meetInfoService.create(dto);
		log.info("모임 만들기 결과 = {}", result);
		
		return "redirect:/meet/list";
		
		// 여기에 blob에 저장하기 위해 url을 byte로 변환하는 코드를 넣어야하는 지?
	}
	
	/**
	 * 0604 정지언
	 * 수정할 모임의 정보를 불러옴.
	 * @param mtid
	 * @param model
	 */
	@GetMapping("/modify")
	public void modify(long mtid, Model model) {
		log.info("modify(mtid={})", mtid);
		
		MeetMainDetailDto dto = meetInfoService.read(mtid);
		model.addAttribute("meet", dto);
		
	}
	
	/**
	 * 0604 정지언
	 * 모임 수정(모임 업데이트)
	 * @param dto
	 * @return
	 */
	@PostMapping("/update")
	public String update(MeetInfoUpdateDto dto) {
		log.info("update(dto={})", dto);
		
		int result = meetInfoService.update(dto);
		log.info("모임 수정 결과 = {}", result);
		
		return "redirect:/meet/maindetail";
	}
	
	/**
	 * 0604 정지언
	 * 모임 삭제
	 * @param mtid
	 * @return
	 */
	@PostMapping("/delete")
	public String delete(long mtid) {
		log.info("delete(mtid={})", mtid);
		
		int result = meetInfoService.delete(mtid);
		log.info("모임 삭제 결과 = {}", result);
		
		return "redirect:/meet/list";
		
	}
	
}
