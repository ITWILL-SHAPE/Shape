package com.itwill.shape.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.shape.domain.MeetPrtcp;
import com.itwill.shape.dto.MeetInfoCreateDto;
import com.itwill.shape.dto.MeetInfoUpdateDto;
import com.itwill.shape.dto.MeetListCountDto;
import com.itwill.shape.dto.MeetMainDetailDto;
import com.itwill.shape.dto.MeetPrtcpCreateDto;
import com.itwill.shape.dto.PostDetailDto;
import com.itwill.shape.dto.UserInfoSelectByIdDto;
import com.itwill.shape.service.MeetDetailService;
import com.itwill.shape.service.MeetInfoService;
import com.itwill.shape.service.MeetLikeService;
import com.itwill.shape.service.MeetListService;
import com.itwill.shape.service.UserInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/meet")
@Controller
public class MeetController {

	private final MeetInfoService meetInfoService;
	private final MeetListService meetListService;
	private final MeetDetailService meetDetailService; // 상세보기 서비스 다시 만들었습니다.
	private final MeetLikeService meetLikeService;
	
	
	@GetMapping("/create")
	public void create() {
		log.info("GET: create()");
	}

	/**
	 * 0604 정지언 모임 만들기(모임 등록)
	 * 
	 * @param dto
	 * @return
	 */
	@PostMapping("/create")
	public String create(MeetInfoCreateDto dto) {
		log.info("POST: create({})", dto);

		int result = meetInfoService.create(dto);
		log.info("모임 만들기 결과 = {}", result);

		return "redirect:/meet/list";

		// 여기에 blob에 저장하기 위해 url을 byte로 변환하는 코드를 넣어야하는 지?
	}

	/**
	 * 0604 정지언 수정할 모임의 정보를 불러옴.
	 * 
	 * @param mtid
	 * @param model
	 */
	@GetMapping("/update")
	public void modify(long mtid, Model model) {
		log.info("modify(mtid={})", mtid);

		MeetMainDetailDto dto = meetInfoService.read(mtid);
		model.addAttribute("meet", dto);

	}

	/**
	 * 0604 정지언 모임 수정(모임 업데이트)
	 * 
	 * @param dto
	 * @return
	 */
	@PostMapping("/update")
	public String update(MeetInfoUpdateDto dto) {
		log.info("update(dto={})", dto);

		int result = meetInfoService.update(dto);
		log.info("모임 수정 결과 = {}", result);

		return "redirect:/meet/maindetail?mtid=" + dto.getMtid();
	}

	/**
	 * 0604 정지언 모임 삭제
	 * 
	 * @param mtid
	 * @return
	 */
	@PostMapping("/delete")
	public String delete(long mtid) {
		log.info("delete(mtid={})", mtid);

		int result = meetInfoService.delete(mtid);
		log.info("모임 삭제 결과 = {}", result);

		return "redirect:/meet/list";

	}

	/**
	 * 0604 김지민 최신순(basic) 정렬
	 * 
	 * @param model
	 */
	@GetMapping("/list")
	public void readBasic(Model model) {
		log.info("readBasic");

		List<MeetListCountDto> dto = meetListService.readByCreateTime();

		// 뷰에 PostDetailDto를 전달.
		model.addAttribute("listCount", dto);
		
		

	}

	/**
	 * 0611 김지민
	 * 
	 * @param category
	 * @param model
	 */

	@GetMapping("/search")
	public void search(String category, String sidoValue, String sortBy, String searchTitle, String mozipCheck,
			Model model) {
		log.info("search(requestParam={}, {}, {}, {}, {})", category, sidoValue, sortBy, searchTitle, mozipCheck);

		// 카테고리에 따른 검색 로직
		if (category != null) {
			List<MeetListCountDto> dto = meetListService.readByCategory(category);
			model.addAttribute("searchList", dto);
			model.addAttribute("category", category);
		}

		// 시도에 따른 검색 로직
		if (sidoValue != null) {
			List<MeetListCountDto> dto = meetListService.readByLocation(sidoValue);
			model.addAttribute("searchList", dto);
			model.addAttribute("sidoValue", sidoValue);
		}

		// 정렬에 따른 검색 로직
		if (sortBy != null && sortBy.equals("인기순")) {
			List<MeetListCountDto> dto = meetListService.readByPopularity();
			model.addAttribute("searchList", dto);
			log.info("sortBy = {}",sortBy);
			model.addAttribute("sortBy", sortBy);
		} else {
			List<MeetListCountDto> dto = meetListService.readByCreateTime();
			model.addAttribute("searchList", dto);
			model.addAttribute("sortBy", sortBy);
		}

		if (searchTitle != null) {
			List<MeetListCountDto> dto = meetListService.readByTitle(searchTitle);
			model.addAttribute("searchList", dto);
		}

		if(mozipCheck != null) {
			// 체크박스 상태에 따른 로직 수행- 0613
			List<MeetListCountDto> dto = meetListService.MozipIng();
			model.addAttribute("searchList", dto);
			
		}

	}

	

	/**
	 * 0604 배선영 상세보기 페이지
	 * 
	 * @param mtid = mtid, model
	 */
	@GetMapping("/maindetail")
	public void maindetail(long mtid, Model model) {
		log.info("maindetail(mtid = {})", mtid);

		// 서비스 계층에 메서드 호출해서 화면에 보여줄 MeetDetaildto를 가져옴.
		MeetMainDetailDto result = meetDetailService.detailByMtid(mtid);

		log.info("resultasdfasdf = {}", mtid);
		log.info("resultasdfasdf = {}", result);

		// 뷰에 MeetDetaildto를 전달.
		model.addAttribute("meetmaindetail", result);

	}

	/**
	 * 06/12 배선영 상세보기 페이지 참여하기 join , delete
	 * 
	 * @param
	 */
	@PostMapping
	public ResponseEntity<Integer> createPrtcp(@RequestBody MeetPrtcpCreateDto dto) {
		log.info("createPrtcp(dto={})", dto);

		int result = meetDetailService.create(dto);
		log.info("result = {}", result);
		
		return ResponseEntity.ok(result);
	}
	
	@DeleteMapping("/{mtid}/{id}")
	@ResponseBody
    public ResponseEntity<Integer> deletePtrcp(@PathVariable long mtid, @PathVariable String id) {
        log.info("deleteReply(mtid={}, id={})", mtid, id);
        
        int result = meetDetailService.delete(mtid, id);
        log.info("result = {}", result);
        return ResponseEntity.ok(result);
    }

	/**
	 * 0613 정지언 찜
	 */
	
//    @GetMapping("/likeCount/{mtid}")
//    public int getLikeCountByMtid(@PathVariable int mtid) {
//        log.info("getLikeCountByMtid(mtid={})", mtid);
//        return meetLikeService.getLikeCountByMtid(mtid);
//    }
//
//    @GetMapping("/isLiked/{mtid}/{id}")
//    public boolean isLikedByUser(@PathVariable int mtid, @PathVariable String id) {
//    	log.info("isLikedByUser(mtid={}, id={})", mtid, id);
//    	return meetLikeService.isLikedByUser(mtid, id);
//    }
//
//    @PostMapping("/like/{mtid}/{id}")
//    public String insertLike(@PathVariable int mtid, @PathVariable String id) {
//    	log.info("insertLike(mtid={}, id={})", mtid, id);
//    	intremeetLikeService.insertLike(mtid, id);
//        return 0;
//    }
//
//    @DeleteMapping("/like/{mtid}/{id}")
//    public ResponseEntity<Integer> deleteLike(@PathVariable int mtid, @PathVariable String id) {
//    	log.info("deleteLike(mtid={}, id={})", mtid, id);
//    	int result = meetLikeService.deleteLike(mtid, id);
//    }

}
