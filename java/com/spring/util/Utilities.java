package com.spring.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.spring.model.Generaldetails;
import com.spring.model.Status;
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
	
	public List<Object> getinititalstatus() {
		List<Object> list = new ArrayList<Object>();
		Status s = new Status();
		s.setId(1);
		s.setName("Live/Regular");
		
		list.add(s);
		return list;
	}
}


