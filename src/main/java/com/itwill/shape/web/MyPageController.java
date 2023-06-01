package com.itwill.shape.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwill.shape.dto.UserInfoSelectByIdDto;
import com.itwill.shape.service.UserInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MyPageController {
	private final UserInfoService userInfoService;
	
	
	// 마이페이지 - 회원정보 - 나의 프로필 /WEB-INF/views/memberinfo/myprofile.jsp

	@GetMapping("/myprofile")
	public String myProfile(String id, Model model) {
		log.info("myprofile()");
		
//		UserInfoSelectByIdDto dto = userInfoService.selectById(id);
//		
//		model.addAttribute("myPageUserInfo", dto);
		 return "/mypage/memberinfo/myprofile";
	}
	
	// 마이페이지 - 회원정보 - 비밀번호 수정
	@GetMapping("/pwdmodify")
	public String pwdModify() {
		log.info("pwdModify()");
		
		return "/mypage/memberinfo/pwdmodify";
	}
	
	// 마이페이지 - 회원정보 - 회원탈퇴
	@GetMapping("/withdrawal")
	public String withdrawal() {
		log.info("withdrawal()");
		
		return "/mypage/memberinfo/withdrawal";
	}
	
	// 마이페이지 - 모임 - 내가 참여 중인 모임
	@GetMapping("/active")
	public String active() {
		log.info("active()");
		
		return "/mypage/meet/active";
	}
	
	// 마이페이지 - 모임 - 내가 개설한 모임
	@GetMapping("/created")
	public String created() {
		log.info("created()");
		
		return "/mypage/meet/created";
	}
	
	// 마이페이지 - 모임 - 내가 찜한 모임
	@GetMapping("/interests")
	public String interests() {
		log.info("interests()");
		
		return "/mypage/meet/interests";
	}
	
	// 마이페이지 - 모임 - 최근 본 모임(beta)
	@GetMapping("/viewd")
	public String viewd() {
		log.info("viewd()");
		
		return "/mypage/meet/viewd";
	}
	
	// 마이페이지 - 게시판 - 내가 작성한 게시물
	@GetMapping("/myposts")
	public String myposts() {
		log.info("myposts()");
		
		return "/mypage/board/myposts";
	}
	
	// 마이페이지 - 게시판 - 내가 작성한 댓글
	@GetMapping("/mycomments")
	public String mycomments() {
		log.info("mycomments()");
		
		return "/mypage/board/mycomments";
	}
	
	@GetMapping("/asdf")
	public String asdf() {
		return "/mypage/memberinfo/asdf";
	}
}