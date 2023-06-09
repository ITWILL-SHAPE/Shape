package com.itwill.shape.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.shape.dto.PostCreateDto;
import com.itwill.shape.dto.PostDetailDto;
import com.itwill.shape.dto.PostInfoSelectByAuthorDto;
import com.itwill.shape.dto.PostListDto;
import com.itwill.shape.dto.PostUpdateDto;
import com.itwill.shape.service.PostCommentService;
import com.itwill.shape.service.PostInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j 
@RequiredArgsConstructor 
@RequestMapping("/post") 
@Controller
public class PostInfoController {

	private final PostInfoService postInfoService; 
	private final PostCommentService postCommentService; // 수빈: 댓글 같이 삭제되게 하려고

	@GetMapping("/list") 
	public void list(Model model) {
		log.info("list()");

		List<PostListDto> list = postInfoService.read();

		model.addAttribute("posts", list);
	}
	
	@GetMapping("/search")
	public void list(Model model, String keyword) {
		log.info("keyword={}",keyword);
		List<PostListDto> list = postInfoService.read(keyword);
		model.addAttribute("posts", list);
	}
	

	@GetMapping("/create")
	public void create() {
		log.info("GET: create()");
	}

	@PostMapping("/create")
	public String create(PostCreateDto dto) {
		log.info("POST: create({})", dto);

		int result = postInfoService.create(dto);
		log.info("포스트 등록 결과 = {}", result);
		return "redirect:/post/list";
	}

	@GetMapping("/detail")
	public void detail(long pid, Model model) {
		log.info("detail(pid={})", pid);

		postInfoService.viewCount(pid);
		
		PostDetailDto dto = postInfoService.read(pid);

		model.addAttribute("post", dto);
	}

	@GetMapping("/modify")
	public void modify(long pid, Model model) {
		log.info("modify(pid={})", pid);

		PostDetailDto dto = postInfoService.read(pid);
		model.addAttribute("post", dto);
	}

	@PostMapping("/delete")
	public String delete(long pid) {
		log.info("delete(id= {})", pid);
		int result = postInfoService.delete(pid);
		log.info("삭제 결과 = {}", pid);
		
		int cmtResult = postCommentService.deleteCommentByPid(pid);
		log.info("댓글 삭제 결과 = {}", cmtResult);
		
		return "redirect:/post/list";
	}

	@PostMapping("/update")
	public String update(PostUpdateDto dto) {
		log.info("update(dto={})", dto);
		int result = postInfoService.update(dto);
		log.info("업데이트 결과 ={}", result);
		return "redirect:/post/detail?pid=" + dto.getPid();
	}

}