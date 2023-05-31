package com.itwill.shape.web;

<<<<<<< HEAD
public class MyPageController {

}
=======
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyPageController {

	// 마이페이지 - 회원정보 - 나의 프로필
	@GetMapping("/myprofile")
	public String myProfile() {
		log.info("myprofile()");
		
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
	
}
>>>>>>> branch 'main' of https://github.com/ITWILL-SHAPE/Shape.git
