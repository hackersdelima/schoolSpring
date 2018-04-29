package com.spring.school;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dao.StudentDao;
import com.spring.model.StudentModel;

@Controller
@RequestMapping("/student")
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
		return "student/studentRegistration";
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
			StudentModel student=studentDao.getStudentDetail(id);
			model.addAttribute("student", student);
			
			return "student/editStudentRegistration";
		}
		
		@RequestMapping(value="/updateStudent")
		public String update(@ModelAttribute StudentModel student, Model model)
		{

			boolean status=studentDao.updateStudent(student);
			return "student/registeredstudents";
		}
		
	
		@RequestMapping(value="/studentName", method=RequestMethod.POST)
		public void studentName(@RequestParam Map<String, String> requestParams, HttpServletResponse response) throws Exception
		{
			PrintWriter out=response.getWriter();
			String classname=requestParams.get("classname");
			String section=requestParams.get("section");
			String rollno = requestParams.get("rollno");
			
			StudentModel studentModel = studentDao.getStudentDetail(classname, section, rollno);
			String studentname = studentModel.getStudentname();
			out.println(studentname);
			
		
		}

}
