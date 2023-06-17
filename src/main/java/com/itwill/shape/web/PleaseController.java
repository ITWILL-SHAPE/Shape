package com.itwill.shape.web;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.rowset.serial.SerialException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itwill.shape.domain.Please;
import com.itwill.shape.service.PleaseService;
import com.itwill.shape.service.PostCommentService;
import com.itwill.shape.service.PostInfoService;
import com.nimbusds.jose.shaded.gson.Gson;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j 
@RequiredArgsConstructor 
@RequestMapping("/please") 
@Controller
public class PleaseController {
	
	private final PleaseService pleaseService;
	
	@GetMapping("/please")
	public void mainPlease(Model model) {
		log.info("pleaseMainController()");
		
		List<Please> please = pleaseService.selectBlobList();
		model.addAttribute("list", please);
	}
	
	@PostMapping("/please")
	public String uploadPlease(Please please) {
		log.info("pleaseUpload()");
		
		// 받아오는 파일
		MultipartFile uploadFile = please.getUploadFile();
		if(!uploadFile.isEmpty()) {
			// 파일 이름
			String fileName = uploadFile.getOriginalFilename();
			
			// 저장할 바이트
			byte[] bytes;		
			try {
				// upload된 파일을 byte 로 변환
				bytes = uploadFile.getBytes();
				
				please.setFileName(fileName);
				please.setBlob(bytes);
				pleaseService.insertBlob(please);
				
			} catch (IOException e) {
				e.printStackTrace();
				
			}
		}
        
        return "redirect:/please/please";
	}

}
