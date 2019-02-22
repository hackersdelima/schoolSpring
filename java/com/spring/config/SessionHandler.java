package com.spring.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.model.UserModel;


public class SessionHandler extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("-----session interceptor called-----------");
		HttpSession session =request.getSession();
		UserModel user = (UserModel)session.getAttribute("userDetail");
		if(user!=null) {
			System.out.println("user found");
			return true;
		}
		else {
		System.out.println("user not found");
		response.sendRedirect(request.getContextPath()+"/nouser");
		return false;
		}
	}

}
