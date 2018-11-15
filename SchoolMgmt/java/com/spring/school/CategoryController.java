
package com.spring.school;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dao.AccountDao;
import com.spring.dao.CategoryDao;
import com.spring.dao.OperationDao;
import com.spring.model.AccountTypeModel;
import com.spring.model.CategoryModel;
import com.spring.model.UserModel;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	OperationDao operationDao;
	@Autowired
	AccountDao accountDao;
	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	private String addCategory(HttpSession session,@ModelAttribute CategoryModel cm, @ModelAttribute AccountTypeModel am, Model model){
		UserModel userDetail = (UserModel) session.getAttribute("userDetail");
		String tablename="categories";
		String columns="(categoryId, categoryHead, accountType, inputter,taxable)";
		String value=cm.getCategoryId() + "','"+ cm.getCategoryHead() + "','" + am.getAccountType() +"','" + userDetail.getUsername()+"','"+cm.getTaxable();
		String msg="";
		boolean status=operationDao.insertTableDetail(tablename, columns, value);
		if(status){
			msg="Save Successful!";
		}
		else{
			msg="Save Failed!";
		}
		model.addAttribute("msg", msg);
		System.out.println(msg);
		return "redirect: ../nav/category";
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	private String editCategory(@PathVariable String id, Model model){
		model.addAttribute("accounttype", accountDao.getAccountType());
		model.addAttribute("categorydetail",categoryDao.getCategory(id));
		
		return "settings/adminSettings/categories/updateCategory";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	private String updateCategory(@ModelAttribute CategoryModel category){
		String msg;
		int status = categoryDao.update(category);
		if(status>0){
			msg = "Update Successful!";
		}
		else{
			msg = "Update Failed!";
		}
		return msg;
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	@ResponseBody
	private String deleteCategory(@PathVariable String id){
		String msg;
		int status = categoryDao.delete(id);
		if(status>0){
			msg = "Delete Successful!";
		}
		else{
			msg = "Delete Failed!";
		}
		return msg;
	}
	
	@RequestMapping(value = "/getAccountType", method = RequestMethod.POST)
	private void getAccountType(@RequestParam Map<String, String> reqparam, HttpServletResponse response) throws Exception{
		String categoryId = reqparam.get("id");
		System.out.println(categoryId);
		AccountTypeModel ac = accountDao.getAccountType(categoryId);
		PrintWriter out = response.getWriter();
		out.println("<option value='"+ac.getAccountType()+"'>"+ac.getAccountTypeHead()+"</option>");
	}

}
