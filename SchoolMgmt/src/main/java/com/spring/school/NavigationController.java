package com.spring.school;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dao.OperationDao;
import com.spring.dao.StudentDao;
import com.spring.model.StudentModel;

@Controller
public class NavigationController {
	@Autowired
	private StudentDao studentDao;
	
	@RequestMapping(value = "/studentAdmission")
	public String studentForm(Model model) {
		System.out.println(studentDao.getAdmissionClass());
		model.addAttribute("interest", studentDao.SpecialInterest());
		model.addAttribute("housegroup", studentDao.HouseGroup());
		model.addAttribute("section", studentDao.getSection());
		model.addAttribute("classlist", studentDao.getAdmissionClass());
		model.addAttribute("dislist", studentDao.getDistricts());
		model.addAttribute("disabledlist", studentDao.getDisabledType());

		return "student/studentRegistration";
	}

	@RequestMapping(value = "/createExam")
	public String createExam() {
		return "exam/createStudentReport";
	}

	@RequestMapping(value = "/viewMuncipality")
	public String viewMuncipality() {
		return "onselectpages/viewMuncipality";
	}

	@RequestMapping(value = "/viewWardNo")
	public String viewWardNo() {
		return "onselectpages/viewWardNo";
	}

	@RequestMapping(value = "/listStudents")
	public String listStudents(Model model) {
		List<StudentModel> list = studentDao.getAllStudents();
		model.addAttribute("slist", list);
		return "student/registeredstudents";
	}

	@RequestMapping(value = "/generalSettings")
	public String generalSettings() {

		return "settings/generalSettings";
	}

	@RequestMapping(value = "/profileSettings")
	public String profileSettings() {
		return "settings/userprofile";
	}
	
	@RequestMapping(value="/initialDetails")
	public String initialDetails(){
		return "initialdetail/initialdetails";
	}
}
