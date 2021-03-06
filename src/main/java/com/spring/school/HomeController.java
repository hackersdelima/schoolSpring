package com.spring.school;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dao.InitialDetailsDao;
import com.spring.dao.OperationDao;
import com.spring.dao.StudentDao;
import com.spring.dao.UploadDao;
import com.spring.dao.UserDao;
import com.spring.model.DynamicData;
import com.spring.model.HibernateModel;
import com.spring.model.Status;
import com.spring.model.UserModel;
import com.spring.service.HibernateService;
import com.spring.service.StatusService;
import com.spring.util.Utilities;

@Controller
@SessionAttributes(value = { "userDetail", "systemdetail", "foldername" })

public class HomeController {
	@Autowired
	private DataSource dataSource;

	@Autowired
	private UserDao dao;
	
	@Autowired
	private HibernateService hibernateService;

	@Autowired
	private OperationDao operationDao;

	@Autowired
	private InitialDetailsDao initialDetailsDao;
	
	@Autowired
	StudentDao studentDao;
	
	@Autowired
	StatusService statusService;
	
	Utilities utilities = new Utilities();
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, @ModelAttribute(value = "msg") String msg) {
		List<Object> initiallist= utilities.getinititalstatus();
		operationDao.tablevaluessetup(initiallist);
		DynamicData d = initialDetailsDao.getDynamicDatas();
		model.addAttribute("foldername", d.getFoldername());
		model.addAttribute("msg", msg);
		return "index";
	}
	
	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String message(Model model, @ModelAttribute(value = "msg") String msg) {
		model.addAttribute("msg", msg);
		return "message/message";
	}
	
	

	@RequestMapping(value = "/hibernate", method = RequestMethod.POST)
	public boolean hibernate(Model model,@ModelAttribute HibernateModel hm) {
		return hibernateService.insert(hm);
		
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute UserModel user, ModelMap model, BindingResult result,
			RedirectAttributes attributes) {

		boolean status = dao.verifyUser(user);
		if (status) {
			UserModel userDetail = getUser(user);
			List<UserModel> systemdetail = operationDao.getSystemDetails();
			
			model.put("userDetail", userDetail);
			model.put("systemdetail", systemdetail);
			
			model.addAttribute("totalstudents",studentDao.getTotalStudents());
			model.addAttribute("totaluser",studentDao.getTotalUser());
			model.addAttribute("totalteacher",studentDao.getTotalTeacher());
			model.addAttribute("currentBranch",studentDao.getCurrentBranch());
			
			return "dashboard";
		} else {
			attributes.addFlashAttribute("msg", "Invalid Login Credentials!");
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

	@RequestMapping(value = "/logout")
	public String logOut(Model model, HttpSession session, SessionStatus status) {
		status.setComplete();
		model.addAttribute("msg", "Logout Successful!");
		return "redirect:/";
	}

	@RequestMapping("/checkConnection")
	public ModelAndView greet() {
		try {
			if (dataSource.getConnection() != null) {

				return new ModelAndView("error", "msg", "Database Connection Successfully Established.");

			} else {

				return new ModelAndView("error", "msg", "Failed to connect database.");
			}
		} catch (SQLException e) {
			e.printStackTrace();

			return new ModelAndView("error", "msg", "Failed to connect database.");
		}
	}

	@RequestMapping(value = "/nosession")
	public String nouser(Model model) {
		DynamicData d = initialDetailsDao.getDynamicDatas();
		model.addAttribute("foldername", d.getFoldername());
		model.addAttribute("msg", "Session Not Found!");
		return "index";
	}
}
