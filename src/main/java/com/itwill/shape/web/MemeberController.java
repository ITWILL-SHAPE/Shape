package com.itwill.shape.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.shape.dto.UserCreateDto;
import com.itwill.shape.dto.UserInfoFindDto;
import com.itwill.shape.service.MailSendService;
import com.itwill.shape.service.UserInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@RequiredArgsConstructor
@Controller
public class MemeberController {
	
	@Autowired
	private MailSendService mailService;
	
	private final UserInfoService userInfoService;
	
	
	/**
	 * 사용자 login
	 * @return
	 */	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		//log.info("login()");
		//log.info("error = {}", error);
		//log.info("logout = {}", logout);
		
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
		//log.info("access denied = {}", auth);
		model.addAttribute("msg", "Access Denied");
	}
	
	/**
	 * 로그아웃
	 */
	@GetMapping("/logout")
	public void logoutGET() {
		//log.info("custom logout");		
	}
	
	
	/**
	 * 회원가입
	 */
	@GetMapping("/signUp")
	public void signUp() {
		//log.info("signUp()");		
	}
	
	/**
	 * 사용자 회원가입
	 */
	@PostMapping("/signUp")
	public void createUser(@RequestBody UserCreateDto data) {
		//log.info("createUser(dto = {})", data);
		
		int result = userInfoService.createMember(data);
		//log.info("result = {}", result);
	}
	
	/**
	 * 사용자 id 중복체크
	 * @param id
	 * @return
	 */
	@PostMapping("/idDupCheck/{id}")
	public ResponseEntity<Integer> idDupCheck(@PathVariable String id) {
		//log.info("idDupCheck(id = {})", id);
		
		int toCnt = userInfoService.idDupCheck(id);
		
		return ResponseEntity.ok(toCnt);
	}
	
	/**
	 * 사용자 회원가입 성공
	 */
	@GetMapping("/signUpSuccess")
	public void signUpSuccess() {
		//log.info("signUpSuccess()");
	}
	
	/**
	 * 사용자 아이디 및 패스워드 찾기
	 */
	@GetMapping("/findIdOrPwd")
	public void findIdOrPwd() {
		//log.info("findIdOrPwd()");
	}
	
	/**
	 * 인증번호 전송
	 * @param email
	 * @return
	 */
	@GetMapping("/mailCheck/{email}")
	@ResponseBody
	public String authNumberSend(@PathVariable String email) {
		//log.info("authNumberSend(email = {})", email);
		
		return mailService.authNumberContent(email);
	}
	
	
	/**
	 * 해당 정보로 검색했을 때 사용자가 있는지 확인
	 * @param data
	 * @return
	 */
	@PostMapping("/findUser")
	@ResponseBody
	public int findUser(@RequestBody UserInfoFindDto dto) {
		//log.info("findUser(dto = {})", dto);
		
		return userInfoService.checkUserExist(dto);
	}
	
	/**
	 * 해당 검색 결과로 나온 유저 아이디
	 * @param data
	 * @return
	 */
	@PostMapping("/findUserId")
	@ResponseBody
	public String findUserId(@RequestBody UserInfoFindDto dto) {
		//log.info("findUserId(dto={})", dto);
		
		return userInfoService.findUserId(dto.getName(), dto.getEmail());
	}
	
	/**
	 * 인증 후 임시 비밀번호 발급
	 * @param dto
	 * @return
	 */
	@PostMapping("/randomPwd")
	@ResponseBody
	public ResponseEntity<Integer> randomPwd(@RequestBody UserInfoFindDto dto) {
		//log.info("randomPwd(dto={})", dto);
		
		String pwd = mailService.tmpryPwdContent(dto.getEmail());
		int result = userInfoService.updateUserPwd(dto.getId(), pwd);
		
		return ResponseEntity.ok(result);
	}	
	
}
