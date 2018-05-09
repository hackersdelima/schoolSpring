package com.spring.school;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dao.CategoryDao;

@Controller
@RequestMapping("/claimbill")
public class ClaimBillController {
	
	
	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping(value="/add")
	public String viewClaimBill(Model model)
	{
		model.addAttribute("categorylist",categoryDao.getCategories());
		return "invoice/claimbill/claimbill";
	}

}
