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
import org.springframework.web.multipart.MultipartFile;

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
	 * @param pwd, inputPwd
	 * @return
	 */
	// 마이페이지 > 회원정보 > 비밀번호 수정 > 비밀번호 재입력
	@GetMapping("/confirmpwd")
	public String confirmPwd(String id, String inputPwd, Model model) {
		log.info("confirmPwd()");
		log.info("id={}", id);
		log.info("inputPwd={}", inputPwd);

		UserInfoSelectPwdByIdDto dto = userInfoService.selectPwdById("drj9812");
		log.info("dto={}", dto);

		String userPwd = dto.getPwd();
		log.info("pwd={}", userPwd);

		model.addAttribute("userPwd", userPwd);
		
		return "/mypage/memberinfo/confirmPwd";
	}

	/**
	 * 0604 손창민 비밀번호 수정
	 * @param pwd, inputPwd
	 * @return
	 */
	// 마이페이지 > 회원정보 > 비밀번호 수정
	@PostMapping("/modifypwd")
	public String modifyPwd(String id, String inputPwd, Model model) {
		log.info("modifyPwd()");
		log.info("id={}", id);
		log.info("inputPwd={}", inputPwd);

		int result = userInfoService.modifyPwdById("drj9812", passwordEncoder.encode("drj9812"));
		log.info("result={}", result);
		
		UserInfoSelectPwdByIdDto dto = userInfoService.selectPwdById("drj9812");
		log.info("dto={}", dto);

		String userPwd = dto.getPwd();
		log.info("pwd={}", userPwd);

		model.addAttribute("userPwd", userPwd);
		
		return "/mypage/memberinfo/modifyPwd";
	}

	// 마이페이지 > 회원정보 > 회원탈퇴(beta)
	@GetMapping("/withdrawal")
	public String withdrawal() {
		log.info("withdrawal()");

		return "/mypage/memberinfo/withdrawal";
	}

	/**
	 * 0604 손창민 내가 참여 중인 모임
	 * @param prticpId(id)
	 * @param model
	 * @return 
	 */
	// 마이페이지 > 모임 > 내가 참여 중인 모임
	@GetMapping("/active")
	public String readActiveMeet(String prtcpId, Model model) {
		log.info("active()");
		log.info("readActiveMeet(prtcpId={})", prtcpId);
		
		List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> dto = meetListService.selectByPrtcpId(prtcpId);
		log.info("readActiveMeet(dto={})", dto);
		
		model.addAttribute("activeList", dto);
		
		return "/mypage/meet/active";
	}

	/**
	 * 0610 손창민 내가 개설한 모임
	 * @Param prtcpId(id)
	 * @return
	 */
	// 마이페이지 > 모임 > 내가 개설한 모임
	@GetMapping("/created")
	public String readCreatedMeet(String crtrId, Model model) {
		log.info("created(prtcpId={})", crtrId);
		
		List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> dto = meetListService.selectByCrtrId(crtrId);
		model.addAttribute("createdList", dto);
		
		return "/mypage/meet/created";
	}

	/**
	 * 0610 손창민 내가 찜한 모임
	 * @param id
	 * @return
	 */
	// 마이페이지 > 모임 > 내가 찜한 모임
	@GetMapping("/interests")
	public String readInterestsMeet(String id, Model model) {
		log.info("interests(id={})", id);
		
		List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> dto = meetListService.selectById(id);
		model.addAttribute("createdList", dto);
		
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
		log.info("myposts()");
		log.info("id={}", author);

		List<PostInfoSelectByAuthorDto> myposts = postInfoService.selectByAuthor("ㅌㅅㅌ");
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
		log.info("mycomments()");
		log.info("id={}", author);

		// 컨트롤러는 서비스 계층의 메서드를 호출해서 서비스 기능을 수행
		List<PostCommentSelectByAuthorDto> mycomments = postCommentsService.selectByAuthor("test");
		log.info("readMycomments(mycomments={})", mycomments);
		
		model.addAttribute("mycomments", mycomments);

		return "/mypage/board/myComments";
	}
}