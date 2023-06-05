package com.itwill.shape.web;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@Controller
public class MemeberController {
	
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
	
}
