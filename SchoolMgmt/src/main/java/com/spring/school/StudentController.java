package com.spring.school;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dao.StudentDao;
import com.spring.model.StudentModel;

@Controller
public class StudentController {
	@Autowired
	private StudentDao studentDao;

	@RequestMapping(value = "/studentRegistration", method = RequestMethod.POST)
	public String insert(@ModelAttribute StudentModel student, Model model) {
		int studentid = studentDao.insertStudent(student);

		boolean otherStatus = studentDao.insertStudentOtherDetails(student, studentid);
		if (otherStatus) {
			model.addAttribute("msg", "Insert Successful");
		}

		else {
			model.addAttribute("msg", "Insert Unsuccessful");
		}
		return "profile";
	}
	
	//For COmmon Attributes
	@ModelAttribute
	public void CommonModels(Model model){
		model.addAttribute("interest", studentDao.SpecialInterest());
		model.addAttribute("housegroup", studentDao.HouseGroup());
		model.addAttribute("section", studentDao.getSection());
		model.addAttribute("classlist", studentDao.getAdmissionClass());
		model.addAttribute("dislist", studentDao.getDistricts());
		model.addAttribute("disabledlist", studentDao.getDisabledType());
	}
	
	@RequestMapping(value="/editStudent/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable String id, Model model)
	{
		StudentModel student=studentDao.getStudentDetail(id,"studentdetail");
		model.addAttribute("student", student);
		
		return "student/editStudentRegistration";
	}
	
	@RequestMapping(value="/updateStudent")
	public String update(@ModelAttribute StudentModel student, Model model)
	{

		boolean status=studentDao.updateStudent(student);
		return "student/registeredstudents";
	}

}
