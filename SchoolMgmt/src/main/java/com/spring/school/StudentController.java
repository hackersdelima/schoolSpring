package com.spring.school;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dao.StudentDao;
import com.spring.model.StudentModel;

@Controller
public class StudentController {
	@Autowired
	private StudentDao studentDao;
	
	@RequestMapping(value="/studentRegistration",method=RequestMethod.POST)
	public String insert(@ModelAttribute StudentModel student, Model model)
	{
		boolean status=studentDao.insertStudent(student);
		if(status){
			String studentid="5";
			 boolean otherStatus=studentDao.insertStudentOtherDetails(student,studentid);
			 if(otherStatus){
			model.addAttribute("msg","Insert Successful");
			 }
		}
		else{
			model.addAttribute("msg","Insert Unsuccessful");
		}
		return "profile";
	}

}
