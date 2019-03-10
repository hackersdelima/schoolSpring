package com.spring.school;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.model.Academicdates;
import com.spring.service.AcademicdatesService;

@Controller
@RequestMapping("academicdates")
public class AcademicdatesController {
	
	@Autowired
	AcademicdatesService academicdatesService;
	
	@ModelAttribute
	public void msg(@ModelAttribute(value="msg") String msg,Model model) {
		System.out.println(msg);
		model.addAttribute("msg",msg);
	}

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String main( Model model) {
		return "settings/academicdates/dashboard";
	}
	
	@RequestMapping(value="/update_form/{id}", method=RequestMethod.GET)
	public String updateform(@ModelAttribute(value="msg") String msg,@PathVariable int id, Model model) {
		Academicdates academicdates= academicdatesService.findOne(id);
		model.addAttribute("a", academicdates);
		model.addAttribute("msg",msg);
		return "settings/academicdates/update";
	}
	
	@RequestMapping(value="/update/{id}", method=RequestMethod.POST)
	public String update(@PathVariable int id, @ModelAttribute Academicdates academicdates, RedirectAttributes redirectAttributes) {
		String msg="";
		try {
		academicdates.setId(id);
		academicdatesService.update(academicdates);
		msg="Data Updated!";
		}
		catch (Exception e) {
			System.out.println(e);
			msg="Data Update Failed!";
		}
		redirectAttributes.addFlashAttribute("msg", msg);
		return "redirect: ../dates_list";
		
	}
	
	
	@RequestMapping(value="/setting_form", method=RequestMethod.GET)
	public String form(Model model) {
		return "settings/academicdates/insert";
	}
	
	@RequestMapping(value="/dates_list", method=RequestMethod.GET)
	public String list(Model model) {
		List<Academicdates> list= academicdatesService.findAll();
		model.addAttribute("list", list);
		return "settings/academicdates/list";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public String save(@ModelAttribute Academicdates academicdates, RedirectAttributes redirectAttributes) {
		String msg="";
		try {
		academicdatesService.save(academicdates);
		msg="Data Saved!";
		}
		catch (Exception e) {
			System.out.println(e);
			msg="Data Saving Failed!";
		}
		System.out.println(msg);
		redirectAttributes.addFlashAttribute("msg", msg);
		return "redirect:setting_form";
	}
}
