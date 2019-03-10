package com.spring.school;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.model.Academicdates;
import com.spring.model.Generaldetails;
import com.spring.service.AcademicdatesService;
import com.spring.service.GeneraldetailsService;

@Controller
@RequestMapping("/generaldetails")
public class GeneraldetailsController {
	
	@Autowired
	GeneraldetailsService generaldetailsService;
	
	@Autowired
	AcademicdatesService academicdatesService;
	
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String updatejsp(Model model) {
		Generaldetails generaldetails=generaldetailsService.getOne();
		List<Academicdates> academicdates = academicdatesService.findAll();
		model.addAttribute("g", generaldetails);
		model.addAttribute("academicdates",academicdates);
		return "settings/generaldetails/update";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(@ModelAttribute Generaldetails generaldetails, RedirectAttributes model){
		String msg="";
		try {
			System.out.println("reached here update");
			System.out.println(generaldetails);
			generaldetails.setId(1);
			generaldetailsService.saveOrUpdate(generaldetails);
		msg="Update Successful!";
		}catch(Exception e){
			System.out.println(e);
			msg="Update Failed!";
		}
		System.out.println(msg);
		model.addFlashAttribute("msg", msg);
		return "redirect:/generaldetails/";
	}

}
