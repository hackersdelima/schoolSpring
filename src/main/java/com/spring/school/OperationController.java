package com.spring.school;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dao.OperationDao;
import com.spring.model.Coursetbl;
import com.spring.model.ExamModel;
import com.spring.model.SettingsModel;
import com.spring.model.Subjects;
import com.spring.model.UserModel;

@Controller
@SessionAttributes(value = "systemdetail")
@RequestMapping("/operation")
public class OperationController {
	@Autowired
	OperationDao operationDao;

	@RequestMapping(value = "/updateGeneralSetting", method = RequestMethod.POST)
	public String updateGeneralSettings(HttpSession session, ModelMap model, @ModelAttribute UserModel user,
			@RequestParam("type") String[] type, @RequestParam("description") String[] description) {
		boolean status = false;
		List<String> statlist = new ArrayList<String>();
		System.out.println(type[0]);
		for (int i = 0; i < description.length; i++) {
			user.setSettingsdescription(description[i]);
			user.setSettingstype(type[i]);
			status = operationDao.updateGeneralSetting(user);
			if (status)
				statlist.add("true");
			else
				statlist.add("false");
		}
		if (statlist.contains("true"))
			session.removeAttribute("systemdetail");
		List<UserModel> systemdetail = operationDao.getSystemDetails();
		model.addAttribute("systemdetail", systemdetail);
		model.addAttribute("msg","Update Successful!");
		return "settings/generalSettings";
	}

	@RequestMapping(value="/initialdetailadd", method=RequestMethod.POST)
	public String insertInitialDetail(@ModelAttribute SettingsModel model, ModelMap attr){
		String tablename="";
		String value="";
		String columns="";
		if(model.getLanguagename()!=null){
			tablename="languagetbl";
			columns="(languagename)";
			value=model.getLanguagename();
		}
		else if(model.getCastename()!=null){
			tablename="castetbl";
			columns="(castename)";
			value=model.getCastename();
		}
		else if(model.getClassname()!=null){
			tablename="classlist";
			columns="(classname)";
			value=model.getClassname();
		}
		else if(model.getHousegroupname()!=null){
			tablename="housegrouptbl";
			columns="(housegroupname)";
			value=model.getHousegroupname();
		}
		else if(model.getSectionname()!=null){
			tablename="sectiontbl";
			columns="(sectionname)";
			value=model.getSectionname();
		}
		else if(model.getSpecialinterestname()!=null){
			tablename="specialinteresttbl";
			columns="(specialinterestname)";
			value=model.getSpecialinterestname();
		}
		else if(model.getExamtypename()!=null){
			tablename="exam_type";
			columns="(examtypename,description)";
			value="'"+model.getExamtypename()+"','"+model.getExamdescription()+"'";
		}
		boolean status=operationDao.insertTableDetail(tablename,columns,value);
		if(status){
			
			attr.addAttribute("msg","Save Successful!");
			
		}
		else{
			attr.addAttribute("msg","Save Failed!");
		}

		return "redirect: ../nav/initialDetails";
	}
	
	
	
	@RequestMapping(value="/addsubject", method=RequestMethod.POST)
	public String addSubject(@ModelAttribute Subjects sub, Model model, RedirectAttributes redirectAttributes){
		boolean checkSubCode=operationDao.checkSubCode(sub.getSubjectcode());
		String msg;
		if(checkSubCode){
			msg="Subject Code Already Exists!";
		}
		else{
		String tablename="subjectlist";
		String columns="(subjectname,subjecttype,subjectCode, fullmarks, passmarks, fullmarks_pr, passmarks_pr)";
		String value="'"+sub.getSubjectname()+"','"+sub.getSubjecttype()+"','"+sub.getSubjectcode()+"','"+sub.getFullmarks()+"','"+sub.getPassmarks()+"','"+sub.getFullmarks_pr()+"','"+sub.getPassmarks_pr()+"'";
		boolean status=operationDao.insertTableDetail(tablename, columns, value);
		if(status){
			msg="Save Successful!";
		}
		else{
			msg="Save Unsuccessful!";
		}
		}
		redirectAttributes.addAttribute("msg",msg);
		return "redirect: ../nav/subjects";
	}
	
	@RequestMapping(value="/assignsubjects",method=RequestMethod.POST)
	public String assignSubject(@ModelAttribute Subjects sub, @RequestParam("subjectid") String[] subjectid, ModelMap model){
		String tablename="coursetbl";
		String columns="(subjectid, gradeid)";
		String value="";
		for(int i=0;i<subjectid.length;i++){
			sub.setSubjectid(subjectid[i]);
			value="'"+subjectid[i]+"','"+sub.getClassid()+"'";
			operationDao.insertTableDetail(tablename, columns, value);
		}
		String msg="Save Successful!";
		model.addAttribute("msg",msg);
		return "redirect: ../nav/assignSubjects";
	}
	
	
	
	// Examination
	@RequestMapping(value="/insertExam" ,method=RequestMethod.POST)
	public String insertExam(@ModelAttribute ExamModel m,Model model){
		String tablename="exam";
		String columns="(examtypeid,examname,startdate,examcode,academicyear)";
		String value="'"+m.getExamTypeModel().getExamtypeid() + "','"+ m.getExamname() + "','" + m.getStartdate() + "','"+m.getExamcode()+"', (select academicdates_id from generaldetails where general_details_id=1)";
		String msg="";
		boolean status=operationDao.insertTableDetail(tablename, columns, value);
		if(status){
			msg="Create Successful!";
		}
		else{
			msg="Create Failed!";
		}
		model.addAttribute("msg",msg);
		return "redirect: ../nav/createExam";
	}
	
	
	
	@RequestMapping(value="/viewEditSubject/{id}")
	public String viewEditSubject(@PathVariable String id, Model model)
	{
		Subjects sub=operationDao.getSubjectForEdit(id);
		model.addAttribute("sub",sub);
		model.addAttribute("subject",operationDao.getSubjectList());
		return "academics/subjects/subjects";
	}


	@RequestMapping(value="/editSubject/{id}")
	public String editSubject(@ModelAttribute Subjects sub,@PathVariable String id, Model model)
	{
		operationDao.editSubject(id,sub);
		System.out.println("eksldjf");
		return "redirect:/nav/subjects";
	}
	
	
	@RequestMapping(value="/assignOptionalSubjects")
	@ResponseBody
	public String assignOptionalSubjects(@RequestParam("students") List<String> students, Model model,@RequestParam("optsubjectid") String optSubId)
	{
		for(int i=0;i<students.size();i++) {
		System.out.println(students);
		operationDao.assignOptionalSubjects(optSubId,students.get(i));
		}
		return "Save Successful";
	}
	
	@RequestMapping(value="/view/{id}/classsubjects")
	public String classsubjects(@PathVariable String id, Model model)
	{
		
		List<Coursetbl> list = operationDao.getclasssubjects(id);
		model.addAttribute("list", list);
		return "academics/subjects/assigned_subjects_class";
	}
	
	@RequestMapping(value="/view/{id}/stdsubjects")
	public String stdsubjects(@PathVariable String id, Model model)
	{
		
		List<Coursetbl> list = operationDao.fingCourseByStd(id);
		model.addAttribute("list", list);
		model.addAttribute("id",id);
		return "academics/subjects/assigned_subjects_std";
	}
	
	
}
