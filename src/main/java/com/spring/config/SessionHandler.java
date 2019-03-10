package com.spring.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.model.UserModel;


public class SessionHandler extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session =request.getSession();
		UserModel user = (UserModel)session.getAttribute("userDetail");
		if(user!=null) {
			System.out.println("user found");
			return true;
		}
		else {
		response.sendRedirect(request.getContextPath()+"/nosession");
		return false;
		}
	}

}
