package com.spring.school;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dao.InitialDetailsDao;
import com.spring.model.FormDetails;

@Controller
@RequestMapping("/initialDetails")
public class InitialDetailsController {
	@Autowired
	InitialDetailsDao initialDetailsDao;
	
	@RequestMapping(value="/languageEdit")
	public String languageEdit(@RequestParam("value") String value,@RequestParam("id") String id, Model model){
		model.addAttribute("languagename",value);
		model.addAttribute("languageid",id);
		
		return "initialdetail/edit/language";
	}
	@RequestMapping(value="/languageUpdate")
	public String languageUpdate(@ModelAttribute FormDetails formDetails){
		initialDetailsDao.updateLanguage(formDetails);
		return "redirect:/nav/initialDetails";
	}
	
	@RequestMapping(value="/sectionEdit")
	public String sectionEdit(@RequestParam("value") String value,@RequestParam("id") String id, Model model){
		model.addAttribute("sectionname",value);
		model.addAttribute("sectionid",id);
		
		return "initialdetail/edit/section";
	}
	@RequestMapping(value="/sectionUpdate")
	public String sectionUpdate(@ModelAttribute FormDetails formDetails){
		initialDetailsDao.updateSection(formDetails);
		return "redirect:/nav/initialDetails";
	}
	
	@RequestMapping(value="/housegroupEdit")
	public String housegroupEdit(@RequestParam("value") String value,@RequestParam("id") String id, Model model){
		model.addAttribute("housegroupname",value);
		model.addAttribute("housegroupid",id);
		
		return "initialdetail/edit/housegroup";
	}
	@RequestMapping(value="/housegroupUpdate")
	public String housegroupUpdate(@ModelAttribute FormDetails formDetails){
		initialDetailsDao.updateSection(formDetails);
		return "redirect:/nav/initialDetails";
	}
	
	@RequestMapping(value="/ethnicgroupEdit")
	public String ethnicgroupEdit(@RequestParam("value") String value,@RequestParam("id") String id, Model model){
		model.addAttribute("castename",value);
		model.addAttribute("casteid",id);
		
		return "initialdetail/edit/ethnicgroup";
	}
	@RequestMapping(value="/ethnicgroupUpdate")
	public String ethnicgroupUpdate(@ModelAttribute FormDetails formDetails){
		initialDetailsDao.UpdateEthnicgroup(formDetails);
		return "redirect:/nav/initialDetails";
	}
	
	@RequestMapping(value="/specialInterestEdit")
	public String specialInterestEdit(@RequestParam("value") String value,@RequestParam("id") String id, Model model){
		model.addAttribute("specialInterest",value);
		model.addAttribute("casteid",id);
		
		return "initialdetail/edit/specialInterest";
	}
	@RequestMapping(value="/specialInterestUpdate")
	public String specialInterestUpdate(@ModelAttribute FormDetails formDetails){
		initialDetailsDao.UpdateSpecialInterest(formDetails);
		return "redirect:/nav/initialDetails";
	}

}
