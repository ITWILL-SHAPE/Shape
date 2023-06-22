package com.itwill.shape.web;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Iterator;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.shape.domain.Criteria;
import com.itwill.shape.domain.CriteriaMeet;
import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.dto.MeetInfoCreateDto;
import com.itwill.shape.dto.MeetInfoUpdateDto;
import com.itwill.shape.dto.MeetLikeDto;
import com.itwill.shape.dto.MeetListCountDto;
import com.itwill.shape.dto.MeetMainDetailDto;
import com.itwill.shape.dto.MeetPrtcpCreateDto;
import com.itwill.shape.dto.MeetSearchListDto;
import com.itwill.shape.dto.PageDto;
import com.itwill.shape.dto.PageMeetListDto;
import com.itwill.shape.service.MeetDetailService;
import com.itwill.shape.service.MeetInfoService;
import com.itwill.shape.service.MeetListService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/meet")
@Controller
public class MeetController {

	private final MeetInfoService meetInfoService;
	private final MeetListService meetListService;
	private final MeetDetailService meetDetailService; // 상세보기 서비스 다시 만들었습니다.
	/* private final MeetLikeService meetLikeService; */

	@GetMapping("/create")
	public void create() {
		//log.info("GET: create()");
	}

	/**
	 * 0604 정지언 모임 만들기(모임 등록)
	 * 
	 * @param dto
	 * @return
	 */
	@PostMapping("/create")
	public String create(MeetInfoCreateDto dto) {
		//log.info("POST: create({})", dto);

		MultipartFile uploadFile1 = dto.getFormFile1();
		MultipartFile uploadFile2 = dto.getFormFile2();
		MultipartFile uploadFile3 = dto.getFormFile3();
		MultipartFile uploadFile4 = dto.getFormFile4();
		MultipartFile uploadFile5 = dto.getFormFile5();

		if (uploadFile1 != null && !uploadFile1.isEmpty()) {
			// 저장할 바이트
			byte[] bytes;
			try {
				// upload된 파일을 byte 로 변환
				bytes = uploadFile1.getBytes();
				dto.setImg_1(bytes);

			} catch (IOException e) {
				e.printStackTrace();

			}
		}

		if (uploadFile2 != null && !uploadFile2.isEmpty()) {
			// 저장할 바이트
			byte[] bytes;
			try {
				// upload된 파일을 byte 로 변환
				bytes = uploadFile2.getBytes();
				dto.setImg_2(bytes);

			} catch (IOException e) {
				e.printStackTrace();

			}
		}

		if (uploadFile3 != null && !uploadFile3.isEmpty()) {
			// 저장할 바이트
			byte[] bytes;
			try {
				// upload된 파일을 byte 로 변환
				bytes = uploadFile3.getBytes();
				dto.setImg_3(bytes);

			} catch (IOException e) {
				e.printStackTrace();

			}
		}

		if (uploadFile4 != null && !uploadFile4.isEmpty()) {
			// 저장할 바이트
			byte[] bytes;
			try {
				// upload된 파일을 byte 로 변환
				bytes = uploadFile4.getBytes();
				dto.setImg_4(bytes);

			} catch (IOException e) {
				e.printStackTrace();

			}
		}

		if (uploadFile5 != null && !uploadFile5.isEmpty()) {
			// 저장할 바이트
			byte[] bytes;
			try {
				// upload된 파일을 byte 로 변환
				bytes = uploadFile5.getBytes();
				dto.setImg_5(bytes);

			} catch (IOException e) {
				e.printStackTrace();

			}
		}

		int result = meetInfoService.create(dto);
		//log.info("모임 만들기 결과 = {}", result);

		return "redirect:/meet/list";

	}

	/**
	 * 0604 정지언 수정할 모임의 정보를 불러옴.
	 * 
	 * @param mtid
	 * @param model
	 */
	@GetMapping("/update")
	public void modify(long mtid, Model model) {
		//log.info("modify(mtid={})", mtid);
		
		MeetMainDetailDto dto = meetInfoService.read(mtid);
		
		if (dto.getImg_1() != null) {
			byte[] imgByte = dto.getImg_1();
			byte[] byteEnc64 = Base64.getEncoder().encode(imgByte);
			String imgStr = null;
			try {
				imgStr = new String(byteEnc64, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			dto.setFile1(imgStr);
		}
		
		if (dto.getImg_2() != null) {
			byte[] imgByte = dto.getImg_2();
			byte[] byteEnc64 = Base64.getEncoder().encode(imgByte);
			String imgStr = null;
			try {
				imgStr = new String(byteEnc64, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			dto.setFile2(imgStr);
		}
		
		if (dto.getImg_3() != null) {
			byte[] imgByte = dto.getImg_3();
			byte[] byteEnc64 = Base64.getEncoder().encode(imgByte);
			String imgStr = null;
			try {
				imgStr = new String(byteEnc64, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			dto.setFile3(imgStr);
		}
		if (dto.getImg_4() != null) {
			byte[] imgByte = dto.getImg_4();
			byte[] byteEnc64 = Base64.getEncoder().encode(imgByte);
			String imgStr = null;
			try {
				imgStr = new String(byteEnc64, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			dto.setFile4(imgStr);
		}
		if (dto.getImg_5() != null) {
			byte[] imgByte = dto.getImg_5();
			byte[] byteEnc64 = Base64.getEncoder().encode(imgByte);
			String imgStr = null;
			try {
				imgStr = new String(byteEnc64, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			dto.setFile5(imgStr);
		}
		
		
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
		//log.info("update(dto={})", dto);

		MultipartFile uploadFile1 = dto.getFormFile1();
		MultipartFile uploadFile2 = dto.getFormFile2();
		MultipartFile uploadFile3 = dto.getFormFile3();
		MultipartFile uploadFile4 = dto.getFormFile4();
		MultipartFile uploadFile5 = dto.getFormFile5();

		if (uploadFile1 != null && !uploadFile1.isEmpty()) {
			// 저장할 바이트
			byte[] bytes;
			try {
				// upload된 파일을 byte 로 변환
				bytes = uploadFile1.getBytes();
				dto.setImg_1(bytes);

			} catch (IOException e) {
				e.printStackTrace();

			}
		}

		if (uploadFile2 != null && !uploadFile2.isEmpty()) {
			// 저장할 바이트
			byte[] bytes;
			try {
				// upload된 파일을 byte 로 변환
				bytes = uploadFile2.getBytes();
				dto.setImg_2(bytes);

			} catch (IOException e) {
				e.printStackTrace();

			}
		}

		if (uploadFile3 != null && !uploadFile3.isEmpty()) {
			// 저장할 바이트
			byte[] bytes;
			try {
				// upload된 파일을 byte 로 변환
				bytes = uploadFile3.getBytes();
				dto.setImg_3(bytes);

			} catch (IOException e) {
				e.printStackTrace();

			}
		}

		if (uploadFile4 != null && !uploadFile4.isEmpty()) {
			// 저장할 바이트
			byte[] bytes;
			try {
				// upload된 파일을 byte 로 변환
				bytes = uploadFile4.getBytes();
				dto.setImg_4(bytes);

			} catch (IOException e) {
				e.printStackTrace();

			}
		}

		if (uploadFile5 != null && !uploadFile5.isEmpty()) {
			// 저장할 바이트
			byte[] bytes;
			try {
				// upload된 파일을 byte 로 변환
				bytes = uploadFile5.getBytes();
				dto.setImg_5(bytes);

			} catch (IOException e) {
				e.printStackTrace();

			}
		}
		
		int result = meetInfoService.update(dto);
		//log.info("모임 수정 결과 = {}", result);

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
		//log.info("delete(mtid={})", mtid);

		int result = meetInfoService.delete(mtid);
		//log.info("모임 삭제 결과 = {}", result);

		return "redirect:/meet/list";

	}

	/**
	 * 0604 김지민 최신순(basic) 정렬
	 * 
	 * @param model
	 */
	@GetMapping("/list")
	public void readBasic(Model model, MeetSearchListDto search) {
		//log.info("readBasic(search = {})", search);

		// 검색의 의한 전체 개수
		int total = meetListService.getListCount(search);
		//log.info("listCount = {}", total);

		// 페이징을 위한
		CriteriaMeet cri = new CriteriaMeet();
		if (search.getPageNum() != 0) {
			cri.setPageNum(search.getPageNum());
			cri.setAmount(search.getAmount());
		} else {
			search.setPageNum(cri.getPageNum());
			search.setAmount(cri.getAmount());
		}

		Map<String, Object> map = meetListService.selectBySearch(search);
		List<MeetLike> ml = meetListService.LikeList();


		model.addAttribute("listCount", map.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("paging", new PageMeetListDto(cri, total));
		model.addAttribute("like", ml);
		
	}

	/**
	 * 0604 배선영 상세보기 페이지
	 * 
	 * @param mtid = mtid, model
	 */
	@GetMapping("/maindetail")
	public void maindetail(long mtid, Model model) {
		//log.info("maindetail(mtid = {})", mtid);

		// 서비스 계층에 메서드 호출해서 화면에 보여줄 MeetDetaildto를 가져옴.
		MeetMainDetailDto result = meetDetailService.detailByMtid(mtid);

		//log.info("resultasdfasdf = {}", mtid);
		//	log.info("resultasdfasdf = {}", result);
		
		// 시간 지나면 상세페이지 
		/*
		 * LocalDate currentDate = LocalDate.now(); String date = result.getEd_date();
		 * log.info("확인 = {}", date); LocalDate parsedDate = LocalDate.parse(date);
		 * log.info(parsedDate.toString());
		 * 
		 * int isPast = currentDate.compareTo(parsedDate); // 현재 시간과 비교하여 지난 시간인지 확인
		 * log.info("ispast = {}", isPast);
		 * 
		 * if (isPast <= 0) { // 모집날짜가 미래일 경우 model.addAttribute("meetmaindetail",
		 * result);
		 * 
		 * } else { log.info("떨구는 것 확인 = {}", isPast); }
		 */

		// 뷰에 MeetDetaildto를 전달.
		model.addAttribute("meetmaindetail", result); 

	}

	/**
	 * 06/12 배선영 상세보기 페이지 참여하기 join , delete
	 * 
	 * @param
	 */
	// 참여하기
	@PostMapping
	public ResponseEntity<Integer> createPrtcp(@RequestBody MeetPrtcpCreateDto dto) {
		//log.info("createPrtcp(dto={})", dto);

		int result = meetDetailService.create(dto);
		//	log.info("result = {}", result);

		return ResponseEntity.ok(result);
	}

	// 참여취소
	@DeleteMapping("/{mtid}/{id}")
	@ResponseBody
	public ResponseEntity<Integer> deletePtrcp(@PathVariable long mtid, @PathVariable String id) {
		//	log.info("deleteReply(mtid={}, id={})", mtid, id);

		int result = meetDetailService.delete(mtid, id);
		//	log.info("result = {}", result);
		return ResponseEntity.ok(result);
	}

	/**
	 * 배선영 찜 만들기
	 */
	// 찜 +1
	@PostMapping("/like")
	public ResponseEntity<Integer> createLike(@RequestBody MeetLikeDto dto) {
		//log.info("createPrtcp(dto={})", dto);

		int result = meetDetailService.meetLikeCreate(dto);
		//log.info("result = {}", result);

		return ResponseEntity.ok(result);
	}

	// 찜 -1
	@DeleteMapping("/like/{mtid}/{id}")
	@ResponseBody
	public ResponseEntity<Integer> deleteLike(@PathVariable long mtid, @PathVariable String id) {
		//log.info("deleteReply(mtid={}, id={})", mtid, id);

		int result = meetDetailService.meetLikeDelete(mtid, id);
		//log.info("result = {}", result);
		return ResponseEntity.ok(result);
	}

}