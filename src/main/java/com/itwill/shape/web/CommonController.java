package com.itwill.shape.web;

import java.io.File;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.domain.Test;
import com.itwill.shape.dto.MeetListCountDto;
import com.itwill.shape.dto.MngrMeetGraphDto;
import com.itwill.shape.dto.PostListDto;
import com.itwill.shape.dto.PostListDto;
import com.itwill.shape.service.MeetDetailService;
import com.itwill.shape.service.MeetInfoService;
import com.itwill.shape.service.MeetListService;
import com.itwill.shape.service.PostInfoService;
import com.itwill.shape.service.TestBlobService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class CommonController {

	private final MeetInfoService meetInfoService;
	private final MeetListService meetListService;
	private final MeetDetailService meetDetailService;
	private final TestBlobService testBlobService;
	private final PostInfoService postInfoService; 
	
	/**
	 * 사용자 main page
	 * @return
	 */
	@GetMapping("/")
	public String home(Model model) {
		log.info("home()");
		
		List<MeetListCountDto> rdto = meetListService.mainReadByRecent();
		List<MeetListCountDto> pdto = meetListService.mainReadByPopularity();
		List<MeetLike> ml = meetListService.LikeList();
		List<PostListDto> list = postInfoService.read();
		
		if (!rdto.isEmpty() && !pdto.isEmpty()) {
			// 뷰에 PostDetailDto를 전달.
			model.addAttribute("listRecent", rdto);
			model.addAttribute("listPopularity", pdto);
			model.addAttribute("like", ml);
		
		model.addAttribute("posts", list);
		
	}
		return "/common/main";
	}
	
	/**
	 * 관리자 home page 
	 * @return
	 */
	@GetMapping("/mngr")
	public String mngr(Model model , MngrMeetGraphDto dto) {
		log.info("mngr()(dto={})", dto);
		model.addAttribute("gender", dto);
		
 		return "/common/home";
	}
	
	@GetMapping("/test/testHandler")
	public void test() {
		log.info("test()");
	}
	
	// 작성 페이지
	@GetMapping("/test/imageTest")
	public void testImage() {
		log.info("testImage()");
	}
	
	// list 페이지
	@GetMapping("/test/imageList")
	public void imageList() {
		log.info("imageList()");
	}
	
	// 작성 시 postMethod
	@PostMapping("/test/upload")
    public String uploadImage(Test test) throws Exception {
		log.info("upload()");
		
		System.out.println(test.toString());
		
		// 파일 업로드 처리
        String fileName = null;
        MultipartFile uploadFile = test.getUploadFile();
        if (!uploadFile.isEmpty()) {
            String originalFileName = uploadFile.getOriginalFilename();
            String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
            UUID uuid = UUID.randomUUID(); // UUID 구하기
            fileName = uuid + "." + ext;
            uploadFile.transferTo(new File("D:\\shapeUpload\\" + fileName));
        }
        test.setFileName(fileName);
 
        System.out.println(test.getFileName());
		
        // 내용 저장
		int result = testBlobService.insertTest(test);
        log.info("result = {}", result);
		
		return "redirect:/test/testHandler";
    }
	
}
