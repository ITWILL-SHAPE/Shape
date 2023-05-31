package com.itwill.shape.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.shape.dto.GuideCreateDto;
import com.itwill.shape.service.GuideService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j			// 로그
@RequiredArgsConstructor	// 생성자에 의한 의존성 주입
@RequestMapping("/guide")	// 클래스의 메서드들은 요청 주소가 "/..."로 시작.
@Controller	
public class GuideController {
	
	private final GuideService guideService;
	
	// Controller 이름 작성 방법.
	// : 해당 페이지마다 Controller 작성
	// ex> 마이페이지 컨트롤러(MyPageController), 공지사항 컨트롤러(NoticeController)..
	// : 관리자 페이지의 Controller의 경우 Controller 이름 앞에 Mngr을 추가.
	// ex> 관리자 공지사항 컨트롤러(MngrNoticeController)..
	
	// 메소드 작성 시 해당 메소드의 역할 및 작성자 주석 작성
	// ex>
	
	/**
	 * 0531 하지윤
	 * 가이드 예시 main page
	 * @return
	 */
	@GetMapping("/")
	public String main() {
		log.info("main()");
		
		return "main";
	}
	
	/**
	 * 0531 하지윤
	 * 가이드 예시 - 가이드 생성 Post
	 * '/guide/create.jsp에서 제목, 내용, 글쓴이로 생성
	 * 
	 * @param dto
	 * @return
	 */
	@PostMapping("/create")
	public String create(GuideCreateDto dto) {
		log.info("Guide create({})", dto);
		
		int result = guideService.create(dto);
		log.info("가이드 등록 결과 = {}", result);
		
		// Post - Redirect - Get
		return "redirect:/guide/main";
	}
	
	
}
