package com.spring.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.spring.dao.UserDao;
import com.spring.model.UserModel;


@Component("customUserDetailsService")
public class CustomUserDetailService implements UserDetailsService {

	
	@Autowired
	private UserDao userDao;
	@Override
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
		UserModel user=userDao.findByUsername(username);
		System.out.println(user);
		return new User(user.getUsername(), user.getPassword(), true, true, true, true, AuthorityUtils.createAuthorityList(user.getGivenrole()));
	}

}
