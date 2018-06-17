package com.spring.school;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dao.ExamDao;
import com.spring.dao.StudentDao;
import com.spring.model.ExamModel;
import com.spring.model.ExamSummaryReportModel;
import com.spring.model.StudentModel;
import com.spring.model.Subjects;

@Controller
@RequestMapping("/exam")
public class ExamController {
	@Autowired
	ExamDao examDao;
	
	@Autowired
	StudentDao studentDao;
	
	@RequestMapping(value="/setMarks", method = RequestMethod.POST)
	public String setMarks(Model model, @RequestParam Map<String, String> reqParam){
		System.out.println("reached");
		String gradeid = reqParam.get("gradeid");
		List<Subjects> subjectslist = examDao.getClassSubjects(gradeid);
		model.addAttribute("subjectslist",subjectslist);
		return "exam/setStudentMarks";
	}

	
	@RequestMapping(value="/addMarks", method = RequestMethod.POST)
	public String addMarks(@ModelAttribute ExamModel exam, @RequestParam Map<String, String> reqParam, Model model){
		
		String classname=reqParam.get("classid");
		String section=reqParam.get("sectionid");
		String rollno = reqParam.get("rollno");
		
		StudentModel studentModel = studentDao.getStudentDetail(classname, section, rollno);
		String studentid = studentModel.getStudentid();
		
		List<String> subjectid=exam.getSubjects().getSubjectidlist();
		
		int num = subjectid.size();
		for(int i=0; i<num;i++){
			Double totalmarks = Double.parseDouble(exam.getSubjects().getThmarkslist().get(i))+Double.parseDouble(exam.getSubjects().getPrmarkslist().get(i));
			exam.getSubjects().setTotalmarks(totalmarks.toString());
			examDao.addMarks(exam, studentid, i);
		}
		model.addAttribute("msg", "Save Successful!");
		
		return "message/message";
	}
	
	@RequestMapping(value = "/searchMarksReport", method = RequestMethod.POST)
	public String searchMarksReport(Model model, @RequestParam Map<String, String> reqParam, ExamModel exam){
		String classname=reqParam.get("classid");
		String section=reqParam.get("sectionid");
		String rollno = reqParam.get("rollno");
		
		StudentModel studentModel = studentDao.getStudentDetail(classname, section, rollno);
		model.addAttribute("stdDetail",studentModel);
		
		String studentid = studentModel.getStudentid();
		
		List<ExamModel> reportlist = examDao.specificStudentMarksReport(exam, studentid);
		model.addAttribute("reportlist" , reportlist);
		
		ExamSummaryReportModel examSummary = examDao.specificStudentExamSummary(exam, studentid);
		model.addAttribute("examSummary", examSummary);
		
		return "exam/report";
	}
@RequestMapping(value="/getClassStudents", method=RequestMethod.POST)
public String getClassStudents(Model model,@RequestParam("subjectcode") String subjectcode,@RequestParam("classname") String classname, @RequestParam("sectionname") String sectionname){
	List<StudentModel> students=examDao.getClassStudents(classname, sectionname);
	model.addAttribute("students", students);
	
	Subjects subjectdetail = examDao.getSubjectDetail(subjectcode);
	model.addAttribute("subjectdetail",subjectdetail);
	
	return "exam/setStudentSubjectMarks";
}
}
