package com.spring.school;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dao.AccountTypeDao;
import com.spring.model.AccountTypeModel;
import com.spring.model.UserModel;

@Controller
@RequestMapping("/accountType")
public class AccountTypeController {
	@Autowired
	AccountTypeDao accountTypeDao;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public String add(@ModelAttribute AccountTypeModel accountTypeModel, HttpSession session){
		UserModel userdetail = (UserModel)session.getAttribute("userDetail");
		accountTypeModel.setInputter(userdetail.getUsername());
		int status = accountTypeDao.insert(accountTypeModel);
		if(status>0){
			return "Save Successful!";
		}
		return "Save Failed!";
	}
	@RequestMapping(value = "/edit/{id}")
	public String edit(@PathVariable("id") String accountType, AccountTypeModel accountTypeModel, Model model){
		accountTypeModel = accountTypeDao.getAccountType(accountType);
		model.addAttribute("accountType" , accountTypeModel);
		return "settings/adminSettings/accountType/edit";
		
	}
	
	@RequestMapping(value = "/update")
	@ResponseBody
	public String update(@ModelAttribute AccountTypeModel accountTypeModel){
		int status = accountTypeDao.update(accountTypeModel);
		if(status>0){
			return "Update Successful!";
		}
		return "Update Failed!";
		
	}
	
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable String id){
		int status = accountTypeDao.delete(id);
		if(status>0){
			return "Delete Successful!";
		}
		return "Delete Failed!";
		
	}
	
}
