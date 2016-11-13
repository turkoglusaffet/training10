package com.spring.training10.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.spring.training10.entity.TblRole;
import com.spring.training10.entity.TblUser;
import com.spring.training10.jpa.UserRepository;


@Service("securityService")
public class SecurityService implements UserDetailsService {

	@Autowired
	UserRepository userRepository;

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		List<TblUser> as = userRepository.findAll();
		TblUser user = userRepository.findByUsername(username);
		if(null == user) {
			throw new UsernameNotFoundException("Invalid creadentinal");
		}
		return new User(username, user.getPassword(), createAuthorities(user.getRoles()));
	}

	private Collection<? extends GrantedAuthority> createAuthorities(List<TblRole> roles) {
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		for (TblRole role : roles) {
			authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
		}
		return authorities;
	}

}
