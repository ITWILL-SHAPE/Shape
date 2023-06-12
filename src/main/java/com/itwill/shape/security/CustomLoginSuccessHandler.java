package com.itwill.shape.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("login Success");
		
		List<String> roleNames = new ArrayList<>();
		
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		log.info("ROLE NAMES : {}", roleNames);
		System.out.println(roleNames.contains("ROLE_A"));
		if(roleNames.contains("ROLE_A")) {
			System.out.println("mngr로 이동");
			response.sendRedirect("/shape/mngr/");
			return;
		}
		
		if(roleNames.contains("ROLE_M")) {
			System.out.println("user home으로 이동");
			response.sendRedirect("/shape/");
			return;
		}
		
		// response.sendRedirect("/shape/");
		
	}

}
