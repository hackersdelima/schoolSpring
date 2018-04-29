package com.spring.school;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dao.AccountDao;
import com.spring.dao.CategoryDao;
import com.spring.dao.StudentDao;
import com.spring.model.AccountModel;
import com.spring.model.AccountTypeModel;
import com.spring.model.StudentModel;

@Controller
@RequestMapping("/account")
public class AccountController {
	@Autowired
	AccountDao accountDao;
	
	@Autowired
	StudentDao studentDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addAccount(@ModelAttribute AccountModel accountModel, Model model){
		System.out.println(accountModel);
		boolean status = accountDao.addAccount(accountModel);
		if(status){
			model.addAttribute("msg","Save Successful!");
		}
		else{
			model.addAttribute("msg","Save Failed!");
		}
		return "message/message";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute AccountModel accountModel, Model model){
		String msg="";
		int status = accountDao.updateAccount(accountModel);
		if(status>0){
			msg = "Update Successful !";
		}
		else{
			msg = "Update Failed !";
		}
		model.addAttribute("msg",msg);
		return "message/message";
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable String id, Model model){
		String msg = "";
		int status = accountDao.deleteAccount(id);
		if(status>0){
			msg = "Delete Successful !";
		}
		else{
			msg = "Delete Failed!";
		}
		model.addAttribute("msg",msg);
		return "message/message";
	}
	
	
	@RequestMapping(value = "/generateAccNo")
	public void generateAccNo(@RequestParam Map<String, String> reqParam, HttpServletResponse response) throws Exception{
		response.getWriter().println(reqParam.get("studentid"));
	}
	
	@RequestMapping(value = "/membername")
	public void membername(@RequestParam Map<String, String> reqparam, HttpServletResponse response) throws Exception{
		String studentid = reqparam.get("id");
		StudentModel studentModel = studentDao.getStudentDetail(studentid);
		String studentName = studentModel.getStudentname();

		response.getWriter().println(studentName);
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable String id, Model model){
		AccountModel accountModel = accountDao.getAccount(id);
		AccountTypeModel accountTypeModel = accountDao.getAccountType(accountModel.getCategoryModel().getCategoryId());
		model.addAttribute("categorylist",categoryDao.getCategories());
		model.addAttribute("accountDetail",accountModel);
		
		model.addAttribute("accountType", accountTypeModel);
		return "account/editAccountDisplayForm";
		
	}
	
	

}
