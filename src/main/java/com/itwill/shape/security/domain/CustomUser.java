package com.itwill.shape.security.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.itwill.shape.domain.UserInfo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CustomUser extends User {

	private static final long serialVersionID = 1L;
	
	private UserInfo user;
	
	public CustomUser(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}
	
	public CustomUser(UserInfo user) {
		super(user.getId(), user.getPwd(), 
				chageDivision(user.getDivision()));
		
		this.user = user;
	}
	
	public static Collection<GrantedAuthority> chageDivision(String division) {
		List<GrantedAuthority> auth = new ArrayList<>();
		auth.add(new SimpleGrantedAuthority(division));
		
		return auth;
	}

}
