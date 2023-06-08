package com.itwill.shape.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
@RequiredArgsConstructor
public class MailSendService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	// 인증번호
	public static int makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		int authNumber = checkNum;
		
		return authNumber;
	}
	
	// 임시 비밀번호 생성 함수
	public static String getRamdomPassword(int len) { 
		char[] charSet = new char[] { 
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
				'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
				'U', 'V', 'W', 'X', 'Y', 'Z' 
				}; 
		int idx = 0; 
		StringBuffer sb = new StringBuffer(); 
		log.info("charSet.length : "+charSet.length); 
			
		for (int i = 0; i < len; i++) { 
			idx = (int) (charSet.length * Math.random()); 
			// 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
			log.info("idx : "+idx); 
			sb.append(charSet[idx]); 
		} 
		return sb.toString(); 
	}

	// 이메일 보낼 양식
	public String joinEmail(String email) {
		int authNumber = makeRandomNumber();
		String setFrom = "chipha808@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력
		String toMail = email;
		String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목
		String content = "홈페이지를 방문해주셔서 감사합니다." + // html 형식으로 작성 !
				"<br><br>" + "인증 번호는 " + authNumber + "입니다." + "<br>" + "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; // 이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}

	// 이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
