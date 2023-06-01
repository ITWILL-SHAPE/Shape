package com.itwill.shape.web;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwill.shape.dto.PostCommentSelectByIdDTO;
import com.itwill.shape.dto.UserInfoSelectByIdDto;
import com.itwill.shape.service.PostCommentService;
import com.itwill.shape.service.UserInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j // 로그
@RequiredArgsConstructor // 생성자에 의한 의존성 주입
@Controller
public class MyPageController {

	private final PostCommentService postCommentsService;

	private final UserInfoService userInfoService;
	
	
	// 마이페이지 > 회원정보 > 나의 프로필

	@GetMapping("/myprofile")
	public String myProfile(String id, Model model) {
		log.info("myprofile()");
		log.info("id={}", id);
		
		UserInfoSelectByIdDto dto = userInfoService.selectById(id);
		model.addAttribute("myPageUserInfo", dto);
		 return "/mypage/memberinfo/myprofile";
	}
	
	// 마이페이지 > 회원정보 > 비밀번호 수정
	@GetMapping("/pwdmodify")
	public String pwdModify() {
		log.info("pwdModify()");
		
		return "/mypage/memberinfo/pwdmodify";
	}
	
	// 마이페이지 > 회원정보 > 회원탈퇴
	@GetMapping("/withdrawal")
	public String withdrawal() {
		log.info("withdrawal()");
		
		return "/mypage/memberinfo/withdrawal";
	}
	
	// 마이페이지 > 모임 > 내가 참여 중인 모임
	@GetMapping("/active")
	public String active() {
		log.info("active()");
		
		return "/mypage/meet/active";
	}
	
	// 마이페이지 > 모임 > 내가 개설한 모임
	@GetMapping("/created")
	public String created() {
		log.info("created()");
		
		return "/mypage/meet/created";
	}
	
	// 마이페이지 > 모임 > 내가 찜한 모임
	@GetMapping("/interests")
	public String interests() {
		log.info("interests()");
		
		return "/mypage/meet/interests";
	}
	
	// 마이페이지 > 모임 > 최근 본 모임(beta)
	@GetMapping("/viewed")
	public String viewed() {
		log.info("viewed()");
		
		return "/mypage/meet/viewed";
	}
	
	// 마이페이지 > 게시판 > 내가 작성한 게시물
	@GetMapping("/myposts")
	public String myposts() {
		log.info("myposts()");
		
		return "/mypage/board/myposts";
	}
	
	/**
	 * 손창민
	 * 내가 작성한 댓글 불러오기
	 */
	// 마이페이지 > 게시판 > 내가 작성한 댓글
	@GetMapping("/mycomments")
	public String mycomments(Model model, long id) {
		log.info("mycomments()");
		log.info("id={}", id);
		
		//컨트롤러는 서비스 계층의 메서드를 호출해서 서비스 기능을 수행
		List<PostCommentSelectByIdDTO> mycomments = postCommentsService.read(id);
		
		model.addAttribute("mycomments", mycomments);
		
		return "/mypage/board/mycomments";
	}
}