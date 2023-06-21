package com.itwill.shape.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.List;
import java.util.Map;

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

import com.itwill.shape.domain.Criteria;
import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.dto.MeetInfoPrtcpLikeSelectByPrtcpIdDto;
import com.itwill.shape.dto.MeetListCountDto;
import com.itwill.shape.dto.PageDto;
import com.itwill.shape.dto.PostCommentSelectByAuthorDto;
import com.itwill.shape.dto.PostInfoSelectByAuthorDto;
import com.itwill.shape.dto.PostListDto;
import com.itwill.shape.service.MeetListService;
import com.itwill.shape.service.PostCommentService;
import com.itwill.shape.service.PostInfoService;
import com.itwill.shape.dto.UserInfoSelectByIdDto;
import com.itwill.shape.dto.UserInfoSelectPwdByIdDto;
import com.itwill.shape.repository.MeetInfoRepository;
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
	private final MeetInfoRepository meetInfoRepository;

	// 마이페이지 > 회원정보 > 나의 프로필
	@GetMapping("/myprofile")
	public String myProfile(@RequestParam("id") String id, Model model) {
		log.info("myprofile()");
		log.info("id={}", id);

		UserInfoSelectByIdDto dto = userInfoService.selectById(id);

		if (dto.getProfile() != null) {
			byte[] byteImg = Base64.getEncoder().encode(dto.getProfile());
			String imgStr = null;
			try {
				imgStr = new String(byteImg, "UTF-8");
				dto.setFile(imgStr);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		if (dto.getProfileImageUrl() != null) {
			model.addAttribute("profileImageUrl", dto.getProfileImageUrl());
		}

		model.addAttribute("myPageUserInfo", dto);
		return "/mypage/memberinfo/myprofile";
	}

	/**
	 * 0613 김세이 회원정보 수정 페이지
	 * 
	 * @Param id
	 * @Param model
	 * @return "/mypage/memberinfo//profilemodifypage"
	 */
	@GetMapping("/profilemodifypage")
	public String profileModifyPage(@RequestParam("id") String id, Model model) {
		log.info("profileModifyPage(id={})", id);

		UserInfoSelectByIdDto dto = userInfoService.selectById(id);

		if (dto.getProfile() != null) {
			byte[] byteImg = Base64.getEncoder().encode(dto.getProfile());
			String imgStr = null;
			try {
				imgStr = new String(byteImg, "UTF-8");
				dto.setFile(imgStr);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		if (dto.getProfileImageUrl() != null) {
			model.addAttribute("profileImageUrl", dto.getProfileImageUrl());
		}
		model.addAttribute("myPageUserInfo", dto);

//		    return "redirect:/mypage/memberinfo/myprofile?id=" + id;
		return "/mypage/memberinfo/profileModify";
	}

	/**
	 * 0619 김세이 프로필 사진 업로드
	 * 
	 * @Param UserInfoSelectByIdDto
	 * @return "/mypage/memberinfo/profileupload"
	 */
	@PostMapping("/profileupload/{id}")
	public String profileUpload(@PathVariable String id, UserInfoSelectByIdDto dto) {
		log.info("profileUpload(dto = {})", dto);

		dto.setId(id);

		// 받아오는 파일
		MultipartFile uploadFile = dto.getUploadFile();
		if (!uploadFile.isEmpty()) {

			// 저장할 바이트
			byte[] bytes;
			try {
				// upload된 파일을 byte 로 변환
				bytes = uploadFile.getBytes();

				dto.setProfile(bytes);
				userInfoService.setProfile(dto);

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/mypage/memberinfo/myprofile?id=" + id;

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
	public String confirmPwdPage(@RequestParam("id") String id, Model model) {
		log.info("confirmPwdPage(id={})", id);

		return "/mypage/memberinfo/confirmPwd";
	}

	/**
	 * 06010 손창민 비밀번호 수정 전 비밀번호 재입력
	 * 
	 * @param id
	 * @return
	 */
//	@ResponseBody
//	@PostMapping("/confirmpwd")
//	public String confirmPwd(String id, @RequestBody String inputPwd) {
//		// public String confirmPwd(@RequestParam("inputPwd") String inputPwd) {
//		log.info("confirmPwd(id={}, inputPwd={})", id, inputPwd.substring(0, inputPwd.length() - 1));
//		// log.info("confirmPwd(id={}, inputPwd={})", null, inputPwd);
//
//		// 유저의 비밀번호와 입력한 비밀번호 비교 로직 수행
//		boolean isPasswordMatched = userInfoService.confirmUser("test1",
//				inputPwd.substring(0, inputPwd.length() - 1));
//		// boolean isPasswordMatched = userInfoService.confirmUser("drj9812", inputPwd);
//		log.info("confirmPwd(isPasswordMatched={})", isPasswordMatched);
//		if (isPasswordMatched) {
//			return "true";
//		} else {
//			return "false";
//		}
//	}

	@ResponseBody
	@PostMapping("/confirmpwd")
	public String confirmPwd(@RequestBody Map<String, String> requestData) {
		String id = requestData.get("id");
		String inputPwd = requestData.get("inputPwd");

		log.info("confirmPwd(id={}, inputPwd={})", id, inputPwd);

		// 유저의 비밀번호와 입력한 비밀번호 비교 로직 수행
		boolean isPasswordMatched = userInfoService.confirmUser(id, inputPwd);
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
	public String modifyPwdPage() {
		log.info("modifyPwdPage()");

		return "/mypage/memberinfo/modifyPwd";
	}

//	// 마이페이지 > 회원정보 > 비밀번호 수정
//	@ResponseBody
//	@PostMapping("/modifypwd")
//	public String modifyPwd(@RequestParam("id")String id, @RequestBody String newPwd) {
//		log.info("modifyPwd(id={}, inputPwd={})", id, newPwd.substring(0, newPwd.length() - 1));
//
//		int result = userInfoService.modifyPwdById(id,
//				passwordEncoder.encode(newPwd.substring(0, newPwd.length() - 1)));
//		log.info("modifyPwd(result={})", result);
//
//		if (result == 1) {
//			return "true";
//		} else {
//			return "false";
//		}
//	}

	/**
	 * 0605 손창민 비밀번호 수정
	 */
	// 마이페이지 > 회원정보 > 비밀번호 수정
	@ResponseBody
	@PostMapping("/modifypwd")
	public String modifyPwd(@RequestBody Map<String, String> requestData) {
		String id = requestData.get("id");
		String newPwd = requestData.get("newPwd");

		log.info("modifyPwd(id={}, inputPwd={})", id, newPwd);

		int result = userInfoService.modifyPwdById(id, passwordEncoder.encode(newPwd));
		log.info("modifyPwd(result={})", result);

		if (result == 1) {
			return "true";
		} else {
			return "false";
		}
	}

	/**
	 * 0611 손창민 회워탈퇴 페이지
	 * 
	 * @return
	 */
	// 마이페이지 > 회원정보 > 회원탈퇴(beta)
	@GetMapping("/withdrawalpage")
	public String withdrawalPage(@RequestParam("id") String id, Model model) {
		log.info("withdrawalPage(id={})", id);

		model.addAttribute("id", id);

		return "/mypage/memberinfo/withdrawal";
	}

	/**
	 * 0611 손창민 회원 탈퇴 처리 메서드
	 * 
	 * @return
	 */
	@ResponseBody
	@PostMapping("/withdrawal")
	public String withdrawal(@RequestBody String id) {
		log.info("withdrawal(id={})", id);

		int result = userInfoService.deleteUserInfoById(id);

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
	public String readActiveMeet(@RequestParam("id") String prtcpId, Criteria cri, Model model) {
		log.info("readActiveMeet(prtcpId(id)={})", prtcpId);
		cri.setAmount(15);
		List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> list = meetListService.selectByPrtcpId(prtcpId, cri);
		log.info("readActiveMeet(dto={})", list);

		// 이미지 파일
		for (MeetInfoPrtcpLikeSelectByPrtcpIdDto mc : list) {
			mc.setImg_1(meetInfoRepository.selectByMtid(mc.getMtid()).getImg_1());

			if (mc.getImg_1() != null) {
				byte[] byteEnc64 = Base64.getEncoder().encode(mc.getImg_1());
				String imgStr = null;
				try {
					imgStr = new String(byteEnc64, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}

				mc.setFile(imgStr);
			}
		}

		List<MeetLike> ml = meetListService.LikeList();
		log.info("ml", ml);
		model.addAttribute("like", ml);
		model.addAttribute("activeList", list);
		model.addAttribute("pageMaker", new PageDto(cri, list.size()));
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
	public String readCreatedMeet(@RequestParam("id") String crtrId, Model model) {
		log.info("readCreatedMeet(prtcpId(id)={})", crtrId);

		List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> List = meetListService.selectByCrtrId(crtrId);
		log.info("readCreatedMeet(dto={})", List);

		// 이미지 파일
		for (MeetInfoPrtcpLikeSelectByPrtcpIdDto mc : List) {
			mc.setImg_1(meetInfoRepository.selectByMtid(mc.getMtid()).getImg_1());

			if (mc.getImg_1() != null) {
				byte[] byteEnc64 = Base64.getEncoder().encode(mc.getImg_1());
				String imgStr = null;
				try {
					imgStr = new String(byteEnc64, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}

				mc.setFile(imgStr);
			}
		}

		model.addAttribute("createdList", List);

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
	public String readInterestsMeet(@RequestParam("id") String id, Model model) {
		log.info("readInterestsMeet(id={})", id);

		List<MeetInfoPrtcpLikeSelectByPrtcpIdDto> List = meetListService.selectById(id);
		log.info("readInterestsMeet(dto={})", List);

		// 이미지 파일
		for (MeetInfoPrtcpLikeSelectByPrtcpIdDto mc : List) {
			mc.setImg_1(meetInfoRepository.selectByMtid(mc.getMtid()).getImg_1());

			if (mc.getImg_1() != null) {
				byte[] byteEnc64 = Base64.getEncoder().encode(mc.getImg_1());
				String imgStr = null;
				try {
					imgStr = new String(byteEnc64, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}

				mc.setFile(imgStr);
			}
		}

		model.addAttribute("interestsList", List);

		return "/mypage/meet/interests";
	}

	// 마이페이지 > 모임 > 최근 본 모임(beta)
	@GetMapping("/viewed")
	public String readViewedMeet() {
		log.info("viewed()");

		return "/mypage/meet/viewed";
	}

//	/**
//	 * 0601 손창민 내가 작성한 글 불러오기
//	 * 
//	 * @param model
//	 * @param author(id)
//	 * @return "/mypage/board/myPosts"
//	 */
//	// 마이페이지 > 게시판 > 내가 작성한 게시물
//	@GetMapping("/myposts")
//	public String readMyposts(@RequestParam("id")String id, Model model) {
//		log.info("myposts(author(id)={})", id);
//
//		List<PostInfoSelectByAuthorDto> myposts = postInfoService.selectByAuthor(id);
//		log.info("readMyposts(myposts={})", myposts);
//
//		model.addAttribute("myposts", myposts);
//
//		return "/mypage/board/myPosts";
//	}

	/**
	 * 0615 손창민 내가 작성한 글 불러오기
	 * 
	 * @param author(id)
	 * @param cri
	 * @param model
	 * @return "/mypage/board/myPosts"
	 */
	// 마이페이지 > 게시판 > 내가 작성한 게시물
	@GetMapping("/myposts")
	public String readMyposts(@RequestParam("id") String id, Criteria cri, Model model) {
		log.info("myposts(author(id)={}, cri={})", id, cri);

		List<PostInfoSelectByAuthorDto> list = postInfoService.selectByAuthor(id);
		List<PostInfoSelectByAuthorDto> myposts = postInfoService.selectByAuthorWithPaging(id, cri);
		int size = list.size();

		log.info("readMyposts(myposts={}, size={})", myposts, size);

		model.addAttribute("myposts", myposts);
		model.addAttribute("pageMaker", new PageDto(cri, size));

		return "/mypage/board/myPosts";
	}

	/**
	 * 0619 손창민 AJAX 작성글 테이블 새로고침
	 * 
	 * @return
	 */
	@GetMapping("/updateposts")
	public ResponseEntity<List<PostInfoSelectByAuthorDto>> updatePosts(@RequestParam("id") String id,
			@RequestParam("pageNum") int pageNum, Criteria cri) {
		try {
			// 페이징된 테이블 데이터를 가져오는 로직 작성
			cri.setPageNum(pageNum);
			List<PostInfoSelectByAuthorDto> tableDataList = postInfoService.selectByAuthorWithPaging(id, cri);
			log.info("updatePosts(tableDataList={}, cri={})", tableDataList, cri);
			return ResponseEntity.ok(tableDataList);
		} catch (Exception e) {
			// 예외 처리
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	/**
	 * 0616 손창민 작성글 검색 키워트 리스트 출력 with paging
	 * 
	 * @param author
	 * @param keyword
	 * @param cri
	 * @param model
	 */
	@GetMapping("/searchposts")
	public String searchPosts(@RequestParam("id") String id, Criteria cri, Model model) {
		log.info("searchPosts(author(id)={}, cri={})", id, cri);

		int count = postInfoService.countPosts(id, cri);
		log.info("searchPosts(count={})", count);

		List<PostInfoSelectByAuthorDto> list = postInfoService.selectByAuthorAndKeywordWithPaging(id, cri);
		model.addAttribute("myposts", list);
		model.addAttribute("pageMaker", new PageDto(cri, count));
		return "/mypage/board/myPosts";
	}

	/**
	 * 0620 손창민 댓글검색 페이징
	 * 
	 * @param model
	 * @param keyword
	 * @param cri
	 */
	@GetMapping("/pagingposts")
	@ResponseBody
	public PageDto makePostsPage(@RequestParam("id") String id, Criteria cri) {
		log.info("makePostsPage(author(id)={}, cri={})", id, cri);

		int count = postInfoService.countPosts(id, cri);
		log.info("makePostsPage(count={})", count);

//		model.addAttribute("mycomments", list);

//		model.addAttribute("pageMaker", new PageDto(cri, count));
		log.info("makePage(PageDto={})", new PageDto(cri, count));
		return new PageDto(cri, count);
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
	public String readMycomments(@RequestParam("id") String id, Criteria cri, Model model) {
		log.info("readMycomments(author(id)={})", id);

		// 컨트롤러는 서비스 계층의 메서드를 호출해서 서비스 기능을 수행
		List<PostCommentSelectByAuthorDto> list = postCommentsService.selectByAuthor(id);
		List<PostCommentSelectByAuthorDto> mycomments = postCommentsService.selectByAuthorWithPaging(id, cri);
		int size = list.size();

		log.info("readMycomments(mycomments={}, size={})", mycomments, size);

		model.addAttribute("mycomments", mycomments);
		model.addAttribute("pageMaker", new PageDto(cri, size));

		return "/mypage/board/myComments";
	}

	/**
	 * 0619 손창민 AJAX 작성 댓글 테이블 새로고침
	 * 
	 * @return
	 */
	@GetMapping("/updatecomments")
	public ResponseEntity<List<PostCommentSelectByAuthorDto>> updateComments(@RequestParam("id") String id,
			@RequestParam("pageNum") int pageNum, Criteria cri) {
		try {
			cri.setPageNum(pageNum);
			// 페이징된 테이블 데이터를 가져오는 로직 작성
			List<PostCommentSelectByAuthorDto> tableDataList = postCommentsService.selectByAuthorWithPaging(id, cri);
			log.info("updateComments(tableDataList={}, cri={})", tableDataList, cri);
			return ResponseEntity.ok(tableDataList);
		} catch (Exception e) {
			// 예외 처리
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	/**
	 * 0616 손창민 댓글 검색 키워트 리스트 출력 with paging
	 * 
	 * @param model
	 * @param keyword
	 * @param cri
	 */
	@GetMapping("/searchcomments")
	public String searchComments(@RequestParam("id") String id, Criteria cri, Model model) {
		log.info("searchComments(author(id)={}, cri={})", id, cri);

		int count = postCommentsService.countComments(id, cri);
		log.info("searchComments(count={})", count);

		List<PostCommentSelectByAuthorDto> list = postCommentsService.selectByAuthorAndKeywordWithPaging(id, cri);
		model.addAttribute("mycomments", list);
		model.addAttribute("pageMaker", new PageDto(cri, count));

		log.info("searchComments(new PageDto={}", new PageDto(cri, count));

		return "/mypage/board/myComments";
	}

	/**
	 * 0620 손창민 댓글검색 페이징
	 * 
	 * @param model
	 * @param keyword
	 * @param cri
	 *//*
		 * @GetMapping("/pagingcomments")
		 * 
		 * @ResponseBody public PageDto makeCommentsPage(@RequestParam("id") String id,
		 * Criteria cri) { log.info("searchComments(author(id)={}, cri={})", id, cri);
		 * 
		 * int count = postCommentsService.countComments(id, cri);
		 * log.info("maekPage(count={})", count);
		 * 
		 * // model.addAttribute("mycomments", list);
		 * 
		 * // model.addAttribute("pageMaker", new PageDto(cri, count));
		 * log.info("makePage(PageDto={})", new PageDto(cri, count)); return new
		 * PageDto(cri, count); }
		 */
}