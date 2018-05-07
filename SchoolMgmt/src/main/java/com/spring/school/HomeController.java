package com.spring.school;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dao.OperationDao;
import com.spring.dao.UserDao;
import com.spring.model.UserModel;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes(value = { "userDetail", "systemdetail" })

public class HomeController {

	@Autowired
	private UserDao dao;

	@Autowired
	private OperationDao operationDao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, @ModelAttribute(value="msg") String msg) {
		model.addAttribute("msg",msg);
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute UserModel user, ModelMap model, BindingResult result, RedirectAttributes attributes) {

		boolean status = dao.verifyUser(user);
		if (status) {
			UserModel userDetail = getUser(user);
			List<UserModel> systemdetail = operationDao.getSystemDetails();
			model.put("userDetail", userDetail);
			model.put("systemdetail", systemdetail);
			return "profile";
		} else {
			attributes.addFlashAttribute("msg","Invalid Login Credentials!");
			return "redirect:/";
		}

	}

	public UserModel getUser(UserModel user) {
		return dao.getUserDetails(user);
	}

	@RequestMapping(value = "/{name}")
	public String pathDemo(@PathVariable String name) {
		System.out.println(name);
		return "index";
	}

}
