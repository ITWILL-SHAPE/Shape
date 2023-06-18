package com.itwill.shape.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
		for(Please p : please) {
			// byte encoding
			byte[] imgByte = p.getBlob();
			byte[] byteEnc64 = Base64.getEncoder().encode(imgByte);
			String imgStr = null;
			try {
				imgStr = new String(byteEnc64, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			p.setFile(imgStr);
		}
		
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
	
	@PostMapping("/delete/{idx}")
	public String deleteFile(@PathVariable int idx) {
		log.info("deleteFile(idx = {})", idx);
		
		pleaseService.deleteBlob(idx);
		
		return "redirect:/please/please";
	}
	
	// 파일 다운로드 어쩌냐.......
	@PostMapping("/download/{idx}")
	@ResponseBody
	public void download(@PathVariable long idx, HttpServletResponse response) {
		log.info("download(idx = {})", idx);
		
		// 해당 파일 정보를 가져옴
		Please please = pleaseService.selectBlobByIdx(idx);
		
		// 해당 파일 이름 가져오기
		String fileName = please.getFileName();		
		// 해당 파일 byte
		byte[] fileByte = please.getBlob();
		
		// 여기에 수업에서 배운 거 쓰면 될 듯...근데 오늘은 아님
		
	}

}
