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
			model.addAttribute("msg","Insert Successful");
		}
		return "profile";
	}

}
