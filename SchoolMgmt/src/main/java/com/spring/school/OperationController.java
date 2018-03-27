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

import com.spring.dao.OperationDao;
import com.spring.model.SettingsModel;
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
		boolean status=operationDao.insertInitialDetail(tablename,columns,value);
		if(status){
			attr.addAttribute("msg","Save Successful!");
		}
		else{
			attr.addAttribute("msg","Save Failed!");
		}
		return "initialdetail/initialdetails";
	}
}
