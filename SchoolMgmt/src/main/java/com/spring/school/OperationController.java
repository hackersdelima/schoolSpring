package com.spring.school;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.model.StudentModel;

@Controller
public class OperationController {
	@RequestMapping(value = "/updateGeneralSetting", method = RequestMethod.POST)
	public String updateGeneralSettings() {
		System.out.println("reached");
		return "profile";
	}

}
