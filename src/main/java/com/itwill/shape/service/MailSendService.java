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
	
	// 8자리 임시 비밀번호 생성 함수
	public static String getRandomPassword() { 
		char[] charSet = new char[] { 
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
				'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
				'U', 'V', 'W', 'X', 'Y', 'Z' 
				}; 
		int idx = 0; 
		StringBuffer sb = new StringBuffer(); 
		log.info("charSet.length : "+charSet.length); 
			
		for (int i = 0; i < 8; i++) { 
			idx = (int) (charSet.length * Math.random()); 
			// 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
			log.info("idx : "+idx); 
			sb.append(charSet[idx]); 
		} 
		return sb.toString(); 
	}

	// 인증번호 이메일 보낼 양식
	public String authNumberContent(String email) {
		int authNumber = makeRandomNumber();
		String setFrom = "chipha808@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력
		String toMail = email;
		String title = "안녕하세요. Shape 입니다."; // 이메일 제목
		// 내용(html)로 작성할 것
		String content = "본인 인증을 위한 인증번호입니다.<br>" +
						"아래 인증번호를 확인하여 이메일 주소 인증을 완료해주세요.<br><br>" +
						"인증 번호는 <b>" + authNumber + "</b> 입니다.<br>" +
						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	// 임시 비밀번호 이메일 보낼 양식
	public String tmpryPwdContent(String email) {
		String tmpryPwd = getRandomPassword();
		
		String setFrom = "chipha808@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력
		String toMail = email;
		String title = "안녕하세요. Shape 입니다."; // 이메일 제목
		// 내용(html)로 작성할 것
		String content = "임시 비밀번호를 발급해드립니다.<br>" +
						"아래 비밀번호는 임시로 만들어진 비밀번호이니 로그인 후 마이페이지에서 비밀번호를 변경해주시길 바랍니다.<br><br>" +
						"임시 비밀번호는 <b>" + tmpryPwd + "</b> 입니다.<br>" +
						"해당 비밀번호로 로그인해주시기 바랍니다.";
		mailSend(setFrom, toMail, title, content);
		
		return tmpryPwd;
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
