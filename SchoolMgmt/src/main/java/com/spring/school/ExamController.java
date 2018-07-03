package com.spring.school;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	@RequestMapping(value = "/setMarks", method = RequestMethod.POST)
	public String setMarks(Model model, @RequestParam Map<String, String> reqParam) {
		System.out.println("reached");
		String gradeid = reqParam.get("gradeid");
		List<Subjects> subjectslist = examDao.getClassSubjects(gradeid);
		model.addAttribute("subjectslist", subjectslist);
		return "exam/setStudentMarks";
	}

	@RequestMapping(value = "/addMarks", method = RequestMethod.POST)
	public String addMarks(@ModelAttribute ExamModel exam, @RequestParam Map<String, String> reqParam, Model model) {

		String classname = reqParam.get("classid");
		String section = reqParam.get("sectionid");
		String rollno = reqParam.get("rollno");

		StudentModel studentModel = studentDao.getStudentDetail(classname, section, rollno);
		String studentid = studentModel.getStudentid();

		List<String> subjectid = exam.getSubjects().getSubjectidlist();

		int num = subjectid.size();
		for (int i = 0; i < num; i++) {
			Double totalmarks = Double.parseDouble(exam.getSubjects().getThmarkslist().get(i))
					+ Double.parseDouble(exam.getSubjects().getPrmarkslist().get(i));
			exam.getSubjects().setTotalmarks(totalmarks.toString());
			examDao.addMarks(exam, studentid, i);
		}
		model.addAttribute("msg", "Save Successful!");

		return "message/message";
	}

	@RequestMapping(value = "/addSubMarks", method = RequestMethod.POST)
	@ResponseBody
	public String addSubMarks(@ModelAttribute("examModel") ExamModel exammodel) {
		List<String> studentidlist = exammodel.getStudentidlist();
		System.out.println(studentidlist);
		int num = studentidlist.size();
		for (int i = 0; i < num; i++) {
			Double totalmarks = Double.parseDouble(exammodel.getSubjects().getThmarkslist().get(i))
					+ Double.parseDouble(exammodel.getSubjects().getPrmarkslist().get(i));

			exammodel.getSubjects().setTotalmarks(totalmarks.toString());

			if (!examDao.checkStudentSubAvailability(exammodel, i) == true) {
				examDao.addMarks(exammodel, i);
			}
		}

		return "Successfull";
	}

	@RequestMapping(value = "/searchMarksReport", method = RequestMethod.POST)
	public String searchMarksReport(Model model, @RequestParam Map<String, String> reqParam, ExamModel exam) {
		String classname = reqParam.get("classid");
		String section = reqParam.get("sectionid");
		String rollno = reqParam.get("rollno");

		StudentModel studentModel = studentDao.getStudentDetail(classname, section, rollno);
		model.addAttribute("stdDetail", studentModel);

		String studentid = studentModel.getStudentid();

		List<ExamModel> reportlist = examDao.specificStudentMarksReport(exam, studentid);
		model.addAttribute("reportlist", reportlist);

		ExamSummaryReportModel examSummary = examDao.specificStudentExamSummary(exam, studentid);
		model.addAttribute("examSummary", examSummary);

		return "exam/report";
	}

	@RequestMapping(value = "/getClassStudents", method = RequestMethod.POST)
	public String getClassStudents(Model model, @RequestParam("subjectcode") String subjectcode,
			@RequestParam("classname") String classname, @RequestParam("sectionname") String sectionname) {
		System.out.println("reached here");
		List<StudentModel> students = examDao.getClassStudents(classname, sectionname);
		model.addAttribute("students", students);

		Subjects subjectdetail = examDao.getSubjectDetail(subjectcode);
		System.out.println(subjectdetail);
		model.addAttribute("subjectdetail", subjectdetail);

		return "exam/setStudentSubjectMarks";
	}
	
	@RequestMapping(value="/editExam/{examId}")
	public String editExam(Model model, @PathVariable("examId") String examId, RedirectAttributes attributes)
	{
		
		ExamModel emodel=examDao.editExam(examId);
		attributes.addFlashAttribute("em",emodel);
		return "redirect:/nav/createExam";
	}
	
	@RequestMapping(value="/updateExam/{examId}")
	public String updateExam(@ModelAttribute ExamModel emodel,@PathVariable String examId)
	{System.out.println("update exam");
		boolean status=examDao.updateExam(emodel,examId);
		return "redirect:/nav/createExam";
	}
	
	@RequestMapping(value="/deleteExam/{examId}")
	public String deleteExam(@PathVariable String examId)
	{
		boolean status=examDao.deleteExam(examId);
		return "redirect:/nav/createExam";
	}
}
