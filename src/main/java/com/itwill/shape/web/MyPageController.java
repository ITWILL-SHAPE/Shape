package com.itwill.shape.web;

import java.io.IOException;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.shape.dto.MeetInfoPrtcpLikeSelectByPrtcpIdDto;
import com.itwill.shape.dto.MeetListCountDto;
import com.itwill.shape.dto.PostCommentSelectByAuthorDto;
import com.itwill.shape.dto.PostInfoSelectByAuthorDto;
import com.itwill.shape.service.MeetListService;
import com.itwill.shape.service.PostCommentService;
import com.itwill.shape.service.PostInfoService;
import com.itwill.shape.dto.UserInfoSelectByIdDto;
import com.itwill.shape.dto.UserInfoSelectPwdByIdDto;
import com.itwill.shape.service.UserInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j // 로그
@RequiredArgsConstructor // 생성자에 의한 의존성 주입
@Controller
//@RequestMapping("/user")
public class MyPageController {

	private final PasswordEncoder passwordEncoder;
	private final PostCommentService postCommentsService;
	private final PostInfoService postInfoService;
	private final UserInfoService userInfoService;
	private final MeetListService meetListService;

	/**
	 * 0601 김세 나의프로필 정보 불러오기
	 * 
	 * @param id
	 * @param model
	 * @return "/mypage/memberinfo/myprofile"
	 */
	// 마이페이지 > 회원정보 > 나의 프로필
	@GetMapping("/myprofile")
	public String myProfile(String id, Model model) {
		log.info("myprofile()");
		log.info("id={}", id);

		UserInfoSelectByIdDto dto = userInfoService.selectById("test0000");
		model.addAttribute("myPageUserInfo", dto);
		return "/mypage/memberinfo/myprofile";
	}

	/**
	 * 0601 김세이 마이페이지 이미지 수정
	 * 
	 * @param id
	 * @param model
	 * @return "/mypage/memberinfo/myprofile"
	 * @throws IOException
	 */
	@GetMapping("/imagemodify")
	public String imageModify(String id, @RequestParam("profile") MultipartFile profile) throws IOException {
		log.info("imageModify()");

		int result = userInfoService.imageModify(id, profile);
		log.info("imageModify 결과 = {}", result);

		return "/mypage/memberinfo/myprofile";
	}

	/**
	 * 0604 손창민 비밀번호 수정 전 비밀번호 재입력
	 * 
	 * @param pwd, inputPwd
	 * @return
	 */
	// 마이페이지 > 회원정보 > 비밀번호 수정 > 비밀번호 재입력
//	@GetMapping("/confirmpwd")
//	public String confirmPwd(String id, String inputPwd, Model model) {
//		log.info("confirmPwd(id={}, inputPwd={})", id, inputPwd);
//
//		//UserInfoSelectPwdByIdDto dto = userInfoService.selectPwdById("drj9812");
//		//log.info("confirmPwd(dto={})", dto);
//
//		//String userPwd = dto.getPwd();
//		//log.info("confirmPwd(userPwd={})", userPwd);
//		
//		//model.addAttribute("userPwd", userPwd);
//		
//		boolean isTrue = userInfoService.confirmUser("drj9812", "drj9812");	
//		log.info("confirmPwd(isTrue={})",isTrue);
//		
//		model.addAttribute("isTrue", isTrue);
//		
//		return "/mypage/memberinfo/confirmPwd";
//	}

	/**
	 * 0604 손창민 비밀번호 수정 전 비밀번호 재입력 페이지
	 * 
	 * @param id
	 * @return
	 */
	@GetMapping("/confirmpwdpage")
	public String confirmPwdPage(String id) {
		log.info("confirmPwdPage(id={})", id);

		return "/mypage/memberinfo/confirmPwd";
	}

	/**
	 * 06010 손창민 비밀번호 수정 전 비밀번호 재입력
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@PostMapping("/confirmpwd")
	public String confirmPwd(String id, @RequestBody String inputPwd) {
		// public String confirmPwd(@RequestParam("inputPwd") String inputPwd) {
		log.info("confirmPwd(id={}, inputPwd={})", null, inputPwd.substring(0, inputPwd.length() - 1));
		// log.info("confirmPwd(id={}, inputPwd={})", null, inputPwd);

		// 유저의 비밀번호와 입력한 비밀번호 비교 로직 수행
		boolean isPasswordMatched = userInfoService.confirmUser("test2",
				inputPwd.substring(0, inputPwd.length() - 1));
		// boolean isPasswordMatched = userInfoService.confirmUser("drj9812", inputPwd);
		log.info("confirmPwd(isPasswordMatched={})", isPasswordMatched);
		if (isPasswordMatched) {
			return "true";
		} else {
			return "false";
		}
	}

	/**
	 * 0604 손창민 비밀번호 수정 페이지
	 * 
	 * @param
	 * @return
	 */
	// 마이페이지 > 회원정보 > 비밀번호 수정
	@GetMapping("/modifypwdpage")
//		public String modifyPwdPage(String id, String inputPwd, Model model) {
	public String modifyPwdPage() {
		log.info("modifyPwdPage()");
//			log.info("modifyPwd(id={}, inputPwd={})", id, inputPwd);
//
//			int result = userInfoService.modifyPwdById("drj9812", passwordEncoder.encode("drj9812"));
//			log.info("modifyPwd(result={})", result);
//
//			UserInfoSelectPwdByIdDto dto = userInfoService.selectPwdById("drj9812");
//			log.info("modifyPwd(dto={})", dto);
//
//			String userPwd = dto.getPwd();
//			log.info("modifyPwd(userPwd={}", userPwd);
//
//			model.addAttribute("userPwd", userPwd);

		return "/mypage/memberinfo/modifyPwd";
	}

	// 마이페이지 > 회원정보 > 비밀번호 수정
	@ResponseBody
	@PostMapping("/modifypwd")
	public String modifyPwd(String id, @RequestBody String newPwd) {
		log.info("modifyPwd(id={}, inputPwd={})", id, newPwd.substring(0, newPwd.length() - 1));

		int result = userInfoService.modifyPwdById("drj9812",
				passwordEncoder.encode(newPwd.substring(0, newPwd.length() - 1)));
		log.info("modifyPwd(result={})", result);

		if (result == 1) {
			return "true";
		} else {
			return "false";
		}
	}
	
	/**
	 * 0611 손창민
	 * 회워탈퇴 페이지
	 * @return
	 */
	// 마이페이지 > 회원정보 > 회원탈퇴(beta)
	@GetMapping("/withdrawalpage")
	public String withdrawalPage(String id, Model model) {
		log.info("withdrawalPage(id={})", id);
		
		model.addAttribute("id", "test2");
		
		return "/mypage/memberinfo/withdrawal";
	}
	
	/**
	 * 0611 손창민
	 * 회원 탈퇴 처리 메서드
	 * @return
	 */
	@ResponseBody
	@PostMapping("/withdrawal")
	public String withdrawal(@RequestBody String id) {
		log.info("withdrawal(id={})", id);
		
		int result = userInfoService.deleteUserInfoById("test2");
		
		if (result == 1) {
			return "회원탈퇴되었습니다.";
		} else {
			return "error";
		}
	}

	
	/**
	 * 0604 손창민 내가 참여 중인 모임
	 * 
	 * @param prticpId(id)
	 * @param model
	 * @return
	 */
	// 마이페이지 > 모임 > 내가 참여 중인 모임
	@GetMapping("/active")
	public String readActiveMeet(String prtcpId, Model model) {
		log.info("readActiveMeet(prtcpId={})", prtcpId);

		List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> dto = meetListService.selectByPrtcpId("test2");
		log.info("readActiveMeet(dto={})", dto);

		model.addAttribute("activeList", dto);

		return "/mypage/meet/active";
	}

	/**
	 * 0610 손창민 내가 개설한 모임
	 * 
	 * @Param prtcpId(id)
	 * @return
	 */
	// 마이페이지 > 모임 > 내가 개설한 모임
	@GetMapping("/created")
	public String readCreatedMeet(String crtrId, Model model) {
		log.info("readCreatedMeet(prtcpId={})", crtrId);

		List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> dto = meetListService.selectByCrtrId("test");
		log.info("readCreatedMeet(dto={})", dto);

		model.addAttribute("createdList", dto);

		return "/mypage/meet/created";
	}

	/**
	 * 0610 손창민 내가 찜한 모임
	 * 
	 * @param id
	 * @return
	 */
	// 마이페이지 > 모임 > 내가 찜한 모임
	@GetMapping("/interests")
	public String readInterestsMeet(String id, Model model) {
		log.info("readInterestsMeet(id={})", id);

		List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> dto = meetListService.selectById("test");
		log.info("readInterestsMeet(dto={})", dto);

		model.addAttribute("interestsList", dto);

		return "/mypage/meet/interests";
	}

	// 마이페이지 > 모임 > 최근 본 모임(beta)
	@GetMapping("/viewed")
	public String readViewedMeet() {
		log.info("viewed()");

		return "/mypage/meet/viewed";
	}

	/**
	 * 0601 손창민 내가 작성한 글 불러오기
	 * 
	 * @param model
	 * @param author(id)
	 * @return "/mypage/board/myPosts"
	 */
	// 마이페이지 > 게시판 > 내가 작성한 게시물
	@GetMapping("/myposts")
	public String readMyposts(Model model, String author) {
		log.info("myposts(author(id)={})", author);

		List<PostInfoSelectByAuthorDto> myposts = postInfoService.selectByAuthor("test");
		log.info("readMyposts(myposts={})", myposts);

		model.addAttribute("myposts", myposts);

		return "/mypage/board/myPosts";
	}

	/**
	 * 0601 손창민 내가 작성한 댓글 불러오기
	 * 
	 * @param model
	 * @param author(id)
	 * @return "/mypage/board/myComments"
	 */
	// 마이페이지 > 게시판 > 내가 작성한 댓글
	@GetMapping("/mycomments")
	public String readMycomments(Model model, String author) {
		log.info("readMycomments(author(id)={})", author);

		// 컨트롤러는 서비스 계층의 메서드를 호출해서 서비스 기능을 수행
		List<PostCommentSelectByAuthorDto> mycomments = postCommentsService.selectByAuthor("test");
		log.info("readMycomments(mycomments={})", mycomments);

		model.addAttribute("mycomments", mycomments);

		return "/mypage/board/myComments";
	}
}