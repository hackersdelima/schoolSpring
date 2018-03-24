package com.spring.school;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.UserDao;
import com.spring.model.UserModel;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("userDetail")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	ConfigurableApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");
	UserDao dao= (UserDao)context.getBean("userDao");
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@ModelAttribute UserModel user,ModelMap model,BindingResult result){
		
		
		boolean status=dao.verifyUser(user);
		if(status)
		{
			UserModel userDetail=getUser(user);
		model.put("userDetail", userDetail);
			
			return "profile";
		}
		else{
			return "index";
		}
		
		
	}
	
	public UserModel getUser(UserModel user){
		return dao.getUserDetails(user);
	}
	
	@RequestMapping(value="/{name}")
	public String pathDemo(@PathVariable String name)
	{
		System.out.println(name);
		return "index";
	}
	
	
}
