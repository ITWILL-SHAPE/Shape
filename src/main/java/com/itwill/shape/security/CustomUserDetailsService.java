package com.itwill.shape.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.itwill.shape.domain.UserInfo;
import com.itwill.shape.repository.UserInfoRepository;
import com.itwill.shape.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Setter(onMethod_ = @Autowired)
	private UserInfoRepository userInfoRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserName: " + username);
		
		UserInfo user = userInfoRepository.readUserInfoById(username);
		
		log.warn("queried by memeber mapper: " + user);
		
		return user == null ? null : new CustomUser(user);
	}

}
