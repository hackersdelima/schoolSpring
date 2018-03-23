package com.spring.school;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NavigationController {
	@RequestMapping(value="/studentAdmission")
	public String studentForm()
	{
		return "student/studentRegistration";
	}
	
	
	@RequestMapping(value="/createExam")
	public String createExam()
	{
		return "exam/createStudentReport";
	}

}
