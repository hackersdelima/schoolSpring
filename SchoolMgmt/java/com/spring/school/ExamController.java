package com.spring.school;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

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

import com.spring.dao.DateConverterDao;
import com.spring.dao.ExamDao;
import com.spring.dao.StudentDao;
import com.spring.extras.GradeGenerator;
import com.spring.model.ExamModel;
import com.spring.model.ExamSummaryReportModel;
import com.spring.model.GradeModel;
import com.spring.model.StudentModel;
import com.spring.model.Subjects;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRPrintPage;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

@Controller
@RequestMapping("/exam")
public class ExamController {
	@Autowired
	ExamDao examDao;
@Autowired
 DataSource dataSource;
	@Autowired
	StudentDao studentDao;
	
	@Autowired
	DateConverterDao dateConverter;

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
		System.out.println("student id list" +studentidlist);
		int num = studentidlist.size();
		for (int i = 0; i < num; i++) {
			
			
			
				System.out.println("prmarks="+exammodel.getSubjects().getPrmarkslist().get(i));
			if(exammodel.getSubjects().getPrmarkslist().get(i).isEmpty() || exammodel.getSubjects().getFullmarks_prlist().get(i).isEmpty()
					) {
			
					
			System.out.println("catchesd");
			examDao.addMissingMarks(exammodel, i);
			
			}
			else {
				
				String thmark=exammodel.getSubjects().getThmarkslist().get(i);
				String prmark=exammodel.getSubjects().getPrmarkslist().get(i);
				if(thmark.isEmpty())
				{
					thmark="0";
				}
				if(prmark.isEmpty())
				{
					prmark="0";
				}
			Double totalmarks = Double.parseDouble(thmark)
					+ Double.parseDouble(prmark);
			System.out.println(totalmarks+"totalmarks");
			
			exammodel.getSubjects().setTotalmarks(totalmarks.toString());
			
			if (!examDao.checkStudentSubAvailability(exammodel, i) == true) {
			examDao.addMarks(exammodel, i);
			}

			
				
			}
		}

		return "Successfull";
	}

	@RequestMapping(value = "/searchMarksReport", method = RequestMethod.POST)
	public String searchMarksReport(Model model, @RequestParam Map<String, String> reqParam,@ModelAttribute ExamModel exam) {
		String classname = reqParam.get("classid");
		String section = reqParam.get("sectionid");
		String rollno = reqParam.get("rollno");
		String examid = reqParam.get("examid");
		
		System.out.println("exam id"+exam.getExamid());

		StudentModel studentModel = studentDao.getStudentDetail(classname, section, rollno);
		model.addAttribute("stdDetail", studentModel);

		String studentid = studentModel.getStudentid();

		List<ExamModel> reportlist = examDao.specificStudentMarksReport(exam, studentid);
		model.addAttribute("reportlist", reportlist);

		ExamSummaryReportModel examSummary = examDao.specificStudentExamSummary(exam, studentid);
		model.addAttribute("examSummary", examSummary);
		
		
		
	String startdate = examDao.editExam(examid).getStartdate();
	String examtype=examDao.editExam(examid).getExamname();
	if(startdate!=null){
		String examdateen=dateConverter.englishToNepali(startdate);
		model.addAttribute("examdate",examdateen);
		model.addAttribute("examtype",examtype);
	}
	
		
		

		return "exam/report";
	}
	
	
	@RequestMapping(value = "/jasper", method = RequestMethod.POST)
	  @ResponseBody
	  public void getRpt1(HttpServletResponse response,@RequestParam Map<String, String> reqParam) throws JRException, IOException {
	    JasperReport jasperReport=JasperCompileManager.compileReport("D:\\DigiNepal\\schoolSpring\\SchoolMgmt\\reports\\examReports.jrxml");
	   // JasperReport jasperReport=JasperCompileManager.compileReport("/opt/tomcat/webapps/reports/examReports.jrxml");
	    Map<String ,Object> param2=new HashMap<String,Object>();
	    String classname = reqParam.get("classid");
		String section = reqParam.get("sectionid");
		String examid = reqParam.get("examid");
		try {
			Connection conn=null;
		
		List<ExamModel> studentids=examDao.getBulkReport(classname,section,examid);
		System.out.println(studentids);
	  
	    JasperPrint jasperPrint,jasper;
		
			jasperPrint = JasperFillManager.fillReport(jasperReport, null, dataSource.getConnection());
			
			//jasper= JasperFillManager.fillReport(jasperReport, param2, dataSource.getConnection());
		
			
			param2.put("examid", examid);
			
			for(int i=0;i<studentids.size();i++) {
				 conn = dataSource.getConnection();
				System.out.println(studentids.get(i).getStudentid());
				param2.put("studentid", studentids.get(i).getStudentid());
			  
			    jasper= JasperFillManager.fillReport(jasperReport, param2, conn);
			
			    List pages=jasper.getPages();
				JRPrintPage object=(JRPrintPage) pages.get(0);
				jasperPrint.addPage(object);
				conn.close();
			}
		
			/*List pages=jasper.getPages();
			JRPrintPage object=(JRPrintPage) pages.get(0);
			jasperPrint.addPage(object);	*/		

	    response.setContentType("application/x-pdf");
	    response.setHeader("Content-disposition", "inline; filename=Report.pdf");

	    final OutputStream outStream = response.getOutputStream();
	    JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
	  
	    //JasperExportManager.exportReportToHtmlFile(jasperPrint,outputLocation +reportCode+".html");
	 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }
	
	
	@RequestMapping(value = "/grade", method = RequestMethod.POST)
	public String grade(Model model) {
		
		List<GradeModel> reportlist = examDao.StudentMarksReport();
		
		model.addAttribute("reportlist", reportlist);
		GradeGenerator g=new GradeGenerator();
		
		for(int i=0;i<reportlist.size();i++)
		{
			String studentid=reportlist.get(i).getStudentid();
			String subjectid=reportlist.get(i).getSubjectid();
			String subjecttype=reportlist.get(i).getSubjecttype();
			System.out.println("Subject Type"+subjecttype);
			
			String passmarks=reportlist.get(i).getPassmarks();
			String fullmarks=reportlist.get(i).getFullmarks();
			String passmarks_pr=reportlist.get(i).getPassmarks_pr();
			String fullmarks_pr=reportlist.get(i).getFullmarks_pr();
			String prmarks=reportlist.get(i).getPrmarks();
			String thmarks=reportlist.get(i).getThmarks();
			
			double dpassmarks=Double.parseDouble(passmarks);
			double dfullmarks=Double.parseDouble(fullmarks);
			double dpassmarks_pr=Double.parseDouble(passmarks_pr);
			double dfullmarks_pr=Double.parseDouble(fullmarks_pr);
			double dprmarks=Double.parseDouble(prmarks);
			double dthmarks=Double.parseDouble(thmarks);
			
			String grade=g.grade(dfullmarks, dfullmarks_pr, dprmarks, dthmarks);
			System.out.println(studentid+"="+grade);
			
			
				examDao.updateGrade(studentid,subjectid,grade);
			
			
		}

		return "exam/report";
	}

	@RequestMapping(value = "/resultCheck", method = RequestMethod.GET)
	public String resultCheck(Model model) {

		
		String examid="7";
		
		for(int j=618;j<=694;j++) {
			
		List<GradeModel> reportlist = examDao.resultCheck(j,examid);
		GradeGenerator g=new GradeGenerator();
		
		model.addAttribute("reportlist", reportlist);
		int count=0;
		double totalThMarks=0;
		double totalPrMarks=0;
		double totalFullMarks=0;
		double totalPracticalMarks=0;
		for(int i=0;i<reportlist.size();i++)
		{
			String subjectid=reportlist.get(i).getSubjectid();
			String subjecttype=reportlist.get(i).getSubjecttype();
			
			String passmarks=reportlist.get(i).getPassmarks();
			String fullmarks=reportlist.get(i).getFullmarks();
			String passmarks_pr=reportlist.get(i).getPassmarks_pr();
			String fullmarks_pr=reportlist.get(i).getFullmarks_pr();
			String prmarks=reportlist.get(i).getPrmarks();
			String thmarks=reportlist.get(i).getThmarks();
			
			double dpassmarks=Double.parseDouble(passmarks);
			double dfullmarks=Double.parseDouble(fullmarks);
			double dpassmarks_pr=Double.parseDouble(passmarks_pr);
			double dfullmarks_pr=Double.parseDouble(fullmarks_pr);
			double dprmarks=Double.parseDouble(prmarks);
			double dthmarks=Double.parseDouble(thmarks);
			
			if(subjecttype.equalsIgnoreCase("common"))
			{
			boolean res=g.isPassed(dpassmarks, dthmarks, dpassmarks_pr, dprmarks);
			System.out.println("Common"+ res);
			totalThMarks+=dthmarks;
			totalPrMarks+=dprmarks;
			totalFullMarks+=dfullmarks;
			totalPracticalMarks+=dfullmarks_pr;
				if(res)
			{
				count++;
				System.out.println("Count is"+count);
			}
			}
		}
		
		System.out.println(totalThMarks);
		System.out.println(totalPrMarks);
		System.out.println(totalFullMarks);
		System.out.println(totalPracticalMarks);
		if(count==reportlist.size()) {
			examDao.studentResult(j,examid,"passed");
			System.out.println("Student id :"+j);
			System.out.println("passed");
		}
		else {
			examDao.studentResult(j, examid, "failed");
			System.out.println("Student id :"+j);
			System.out.println("failed");
		}

		}
		

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
	
	@ResponseBody
	@RequestMapping(value="/classSubject")
	public void classSubject(@RequestParam("id") String classid, PrintWriter out){
		System.out.println("sdflksj");
		List<String> optionlist = new ArrayList<String>();
		List<Subjects> classSubjects=examDao.getSpecificClassSubjects(classid);
		System.out.println(classSubjects.size());
		String option;
		for(int i=0;i<classSubjects.size();i++){
		 option ="<option value='"+classSubjects.get(i).getSubjectcode()+"'>"+classSubjects.get(i).getSubjectcode()+"-"+classSubjects.get(i).getSubjectname()+"</option>";
	out.println(option);
		}
	}
}
