package com.spring.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.dao.UploadDao;
import com.spring.model.UserModel;

public class Utilities {
	
	
	public String getSessionUsername(HttpServletRequest request) {
		String username="";
		HttpSession session = request.getSession();
		UserModel user = (UserModel)session.getAttribute("userDetail");
		System.out.println(user);
		if(user!=null) {
		 username=user.getUsername();
		}
		else {
			username=null;
		}
		return username;
	}
}


