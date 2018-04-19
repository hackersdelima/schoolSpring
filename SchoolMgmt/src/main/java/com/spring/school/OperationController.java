package com.spring.school;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dao.OperationDao;
import com.spring.dao.impl.StudentDaoImpl.Exam;
import com.spring.model.ExamModel;
import com.spring.model.SettingsModel;
import com.spring.model.Subjects;
import com.spring.model.UserModel;

@Controller
@SessionAttributes(value = "systemdetail")
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
		System.out.println("reached");
		return "settings/generalSettings";
	}

	@RequestMapping(value="/initialdetailadd", method=RequestMethod.POST)
	public String insertInitialDetail(@ModelAttribute SettingsModel model, Model attr){
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
			value=model.getExamtypename()+"','"+model.getExamdescription();
		}
		boolean status=operationDao.insertTableDetail(tablename,columns,value);
		if(status){
			attr.addAttribute("msg","Save Successful!");
		}
		else{
			attr.addAttribute("msg","Save Failed!");
		}
		return "redirect: initialDetails";
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
		String value=sub.getSubjectname()+"','"+sub.getSubjecttype()+"','"+sub.getSubjectcode()+"','"+sub.getFullmarks()+"','"+sub.getPassmarks()+"','"+sub.getFullmarks_pr()+"','"+sub.getPassmarks_pr();
		boolean status=operationDao.insertTableDetail(tablename, columns, value);
		if(status){
			msg="Save Successful!";
		}
		else{
			msg="Save Unsuccessful!";
		}
		}
		redirectAttributes.addAttribute("msg",msg);
		return "redirect: subjects";
	}
	
	@RequestMapping(value="/assignsubjects",method=RequestMethod.POST)
	public String assignSubject(@ModelAttribute Subjects sub, @RequestParam("subjectid") String[] subjectid, ModelAndView model){
		String tablename="coursetbl";
		String columns="(subjectid, gradeid)";
		String value="";
		for(int i=0;i<subjectid.length;i++){
			sub.setSubjectid(subjectid[i]);
			value=subjectid[i]+"','"+sub.getClassid();
			operationDao.insertTableDetail(tablename, columns, value);
		}
		String msg="Save Successful!";
		model.addObject("msg", msg);
		return "redirect: assignSubjects";
	}
	
	// Examination
	@RequestMapping(value="/insertExam" ,method=RequestMethod.POST)
	public String insertExam(@ModelAttribute ExamModel m,Model model){
		String tablename="exam";
		String columns="(examtypeid,examname,startdate,examcode)";
		String value=m.getExamtype() + "','"+ m.getExamname() + "','" + m.getStartdate() + "','"+m.getExamcode();
		String msg="";
		boolean status=operationDao.insertTableDetail(tablename, columns, value);
		if(status){
			msg="Create Successful!";
		}
		else{
			msg="Create Failed!";
		}
		model.addAttribute("msg",msg);
		return "redirect: createEam";
	}
	
}
