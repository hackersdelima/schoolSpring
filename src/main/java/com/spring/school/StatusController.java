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

import com.spring.model.Status;
import com.spring.service.StatusService;


@RequestMapping("status")
@Controller
public class StatusController {
	@Autowired
	StatusService statusService;
	
	@RequestMapping(value="/showAll", method=RequestMethod.GET)
	public String findAll(Model model){
		List<Status> status = statusService.findAll();
		model.addAttribute("status", status);
		return "settings/student/statuslist";
	}
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String form(@ModelAttribute("msg") String msg, Model model){
		model.addAttribute("msg", msg);
		return "settings/student/status";
	}
	
	@RequestMapping(value="/editpage/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable int id, Model model){
		System.out.println(id);
		Status status = statusService.findById(id);
		model.addAttribute("status",status);
		return "settings/student/editstatus";
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.POST)
	public String editsave(@ModelAttribute Status status,@PathVariable int id, RedirectAttributes model){
		String msg="";
		try {
			if(id==1) {
				msg="Cannot Update!";
			}
			else {
		statusService.update(status);
		msg="Update Successful!";
			}
		}catch(Exception e){
			System.out.println(e);
			msg="Update Failed!";
		}
		model.addFlashAttribute("msg", msg);
		return "redirect:/status/";
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public String delete(@ModelAttribute Status status,@PathVariable int id, RedirectAttributes model){
		String msg="";
		try {
			if(id==1) {
				msg="Cannot Delete!";
			}
			else {
		statusService.delete(status);
		msg="Delete Successful!";
			}
		}catch(Exception e){
			System.out.println(e);
			msg="Delete Failed!";
		}
		model.addFlashAttribute("msg", msg);
		return "redirect:/status/";
	}
	
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public String save(@ModelAttribute Status status, RedirectAttributes model){
		String msg="";
		try {
		statusService.save(status);
		msg="Save Successful!";
		}catch(Exception e){
			System.out.println(e);
			msg="Save Failed!";
		}
		model.addFlashAttribute("msg", msg);
		return "redirect:/status/";
	}
	
	

}
