package com.itwill.shape.web;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.shape.domain.Criteria;
import com.itwill.shape.dto.PageDto;
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

	/**
	 * 지현
	 * 게시판 리스트 출력 with paging
	 * @param model
	 * @param cri
	 */
	@GetMapping("/list") 
	public void list(Model model, Criteria cri) {
		log.info("list()");

		int total = postInfoService.getListCount();
		log.info("listCount={}", total);
		
		List<PostListDto> list = postInfoService.read(cri);
		for(PostListDto dto: list) {
			if(dto.getProfile() != null) {
				byte[] byteImg = Base64.getEncoder().encode(dto.getProfile());
				String imgStr = null;
				try {
					imgStr = new String (byteImg, "UTF-8");
					dto.setFile(imgStr);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}

		model.addAttribute("posts", list);
		model.addAttribute("paging", new PageDto(cri, total));
	}
	
	/**
	 * 지현
	 * 게시판 검색 키워트 리스트 출력 with paging
	 * @param model
	 * @param keyword
	 * @param cri
	 */
	@GetMapping("/search")
	public void list(Model model, String keyword, Criteria cri) {
		log.info("keyword={}, cri={}",keyword, cri);
		
		int keywordTotal = postInfoService.getListCountWithKeyword(keyword);
		log.info("listCount = {}",keywordTotal);
		
		List<PostListDto> list = postInfoService.read(keyword, cri);
		for(PostListDto dto: list) {
			if(dto.getProfile() != null) {
				byte[] byteImg = Base64.getEncoder().encode(dto.getProfile());
				String imgStr = null;
				try {
					imgStr = new String (byteImg, "UTF-8");
					dto.setFile(imgStr);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}
		model.addAttribute("posts", list);
		model.addAttribute("paging", new PageDto(cri, keywordTotal));
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
		if(dto!= null) {
			byte[] byteImg = Base64.getEncoder().encode(dto.getProfile());
			String imgStr = null;
			try {
				imgStr = new String (byteImg, "UTF-8");
				dto.setFile(imgStr);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

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