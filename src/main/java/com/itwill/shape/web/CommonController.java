package com.itwill.shape.web;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.shape.domain.Criteria;
import com.itwill.shape.domain.MeetLike;
import com.itwill.shape.dto.MeetListCountDto;
import com.itwill.shape.dto.PostListDto;
import com.itwill.shape.service.MeetDetailService;
import com.itwill.shape.service.MeetInfoService;
import com.itwill.shape.service.MeetListService;
import com.itwill.shape.service.MngrDashBoardService;
import com.itwill.shape.service.MngrUserInfoService;
import com.itwill.shape.service.PostInfoService;
import com.itwill.shape.service.UserInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class CommonController {

	private final MeetListService meetListService;
	private final PostInfoService postInfoService;
	private final MngrDashBoardService mngrDashBoardService;
	private final MngrUserInfoService mngrUserInfoService;

	/**
	 * 사용자 main page
	 * 
	 * @return
	 */
	@GetMapping("/")
	public String home(Model model, Criteria cri) {
		// log.info("home()");

		List<MeetListCountDto> rdto = meetListService.mainReadByRecent();
		List<MeetListCountDto> pdto = meetListService.mainReadByPopularity();
		List<MeetLike> ml = meetListService.LikeList();
		List<PostListDto> list = postInfoService.read(cri);

		if (!rdto.isEmpty() && !pdto.isEmpty()) {
			// 뷰에 PostDetailDto를 전달.
			model.addAttribute("listRecent", rdto);
			model.addAttribute("listPopularity", pdto);
			model.addAttribute("like", ml);

			for (PostListDto dto : list) {
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

			}
			model.addAttribute("posts", list);

		}

		return "/common/main";
	}

	/**
	 * 관리자 home page
	 * 
	 * @return
	 */
	@GetMapping("/mngr")
	public String mngr(Model model) {
		// log.info("mngr()");

		return "/common/home";
	}

	@PostMapping("/mngr")
	@ResponseBody
	public Map<String, Object> mngr() {
		// log.info("mngr(data)");

		Map<String, Object> map = new HashMap<>();
		map.put("categorys", mngrDashBoardService.categoryMeet());
		map.put("genderFemale", mngrDashBoardService.genderFemaleMeet());
		map.put("genderMale", mngrDashBoardService.genderMaleMeet());
		map.put("area", mngrDashBoardService.areaMeet());

		return map;
	}

	// header 프로필 사진
	@PostMapping("/profile/{id}")
	@ResponseBody
	public String toStringProfile(@PathVariable String id) {
		// log.info("profile(id = {})", id);

		// UserInfoSelectByIdDto dto = userInfoService.selectById(id);
		byte[] profile = mngrUserInfoService.userProfile(id);

		String imgStr = null;
		if (profile != null) {
			byte[] byteEnc64 = Base64.getEncoder().encode(profile);
			try {
				imgStr = new String(byteEnc64, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		return imgStr;
	}

}
