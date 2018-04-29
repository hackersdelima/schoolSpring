
package com.spring.school;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dao.AccountDao;
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
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	private String addCategory(HttpSession session,@ModelAttribute CategoryModel cm, @ModelAttribute AccountTypeModel am, Model model){
		UserModel userDetail = (UserModel) session.getAttribute("userDetail");
		String tablename="categories";
		String columns="(categoryId, categoryHead, accountType, inputter)";
		String value=cm.getCategoryId() + "','"+ cm.getCategoryHead() + "','" + am.getAccountType() +"','" + userDetail.getUsername();
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
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	private String updateCategory(){
		return "";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	private String deleteCategory(){
		return "";
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
