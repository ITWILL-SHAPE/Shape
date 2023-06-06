package com.itwill.shape.web;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.shape.dto.UserCreateDto;
import com.itwill.shape.service.UserInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@RequiredArgsConstructor
@Controller
public class MemeberController {
	
	private final UserInfoService userInfoService;
	
	/**
	 * 사용자 login
	 * @return
	 */	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("login()");
		log.info("error = {}", error);
		log.info("logout = {}", logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
		
	}
	
	/**
	 * 사용자 로그인 에러
	 * 
	 */
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access denied = {}", auth);
		model.addAttribute("msg", "Access Denied");
	}
	
	/**
	 * 로그아웃
	 */
	@GetMapping("/logout")
	public void logoutGET() {
		log.info("custom logout");		
	}
	
	
	/**
	 * 회원가입
	 */
	@GetMapping("/signUp")
	public void signUp() {
		log.info("signUp()");		
	}
	
	/**
	 * 사용자 회원가입
	 */
	@PostMapping("/signUp")
	public void createUser(@RequestBody UserCreateDto data) {
		log.info("createUser(dto = {})", data);
		
		int result = userInfoService.createMember(data);
		log.info("result = {}", result);
	}
	
	/**
	 * 사용자 id 중복체크
	 * @param id
	 * @return
	 */
	@PostMapping("/idDupCheck/{id}")
	public ResponseEntity<Integer> idDupCheck(@PathVariable String id) {
		log.info("idDupCheck(id = {})", id);
		
		int toCnt = userInfoService.idDupCheck(id);
		
		return ResponseEntity.ok(toCnt);
	}
	
	/**
	 * 사용자 회원가입 성공
	 */
	@GetMapping("/signUpSuccess")
	public void signUpSuccess() {
		log.info("signUpSuccess()");
	}
	
}
