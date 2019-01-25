package com.spring.school;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dao.BranchDao;
import com.spring.dao.RoleDao;
import com.spring.dao.UserDao;
import com.spring.model.UserModel;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserDao userDao;
	@Autowired
	BranchDao branchDao;
	@Autowired
	RoleDao roleDao;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public String add(@ModelAttribute UserModel user){
		boolean status = userDao.insertUser(user);
		if(status){
			return "New User Saved !";
		}
		else{
			return "New User Save Failed !";
		}
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable String id, Model model){
		model.addAttribute("useredit",userDao.getSpecificUserDetails(id));
		model.addAttribute("userList",userDao.getUsers());
		model.addAttribute("branchlist",branchDao.getBranches());
		model.addAttribute("rolelist",roleDao.getRoles());
		model.addAttribute("functionAllowed",userDao.getSpecificUserDetails(id).getAdditionalFunctions());
		return "usersettings/edituser";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public String update(@ModelAttribute UserModel user){
		int status = userDao.updateUser(user);
		if(status>0){
			return "Update Successful!";
		}
		else{
			return "Update Failed !";
		}
	}

}
