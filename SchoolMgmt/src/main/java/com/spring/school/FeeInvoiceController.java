package com.spring.school;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.dao.CategoryDao;
import com.spring.dao.FeeInvoiceDao;
import com.spring.model.FeeInvoiceModel;

@Controller
@RequestMapping("/invoice")
@SessionAttributes("feeInvoice")
public class FeeInvoiceController {
	
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	FeeInvoiceDao feeInvoiceDao;
	
	@RequestMapping(value = "/add")
	public String add(Model model){
		model.addAttribute("categorylist",categoryDao.getCategories());
		return "invoice/invoice";
	}
	
	@RequestMapping(value = "/review")
	public String review(@ModelAttribute FeeInvoiceModel feeInvoice, ModelMap model){
		
		System.out.println(feeInvoice);
		System.out.println("invoking review()");
		model.addAttribute("feeInvoice",feeInvoice);
		return "invoice/printableInvoice";
	}
	
	@RequestMapping(value = "/save")
	@ResponseBody
	public String save(@ModelAttribute FeeInvoiceModel feeInvoice, SessionStatus status){
		//boolean saveStatus = feeInvoiceDao.insertFeeInvoice(feeInvoice);
		//operations
		status.setComplete();
		return "<h3>Data Saved!</h3>";
	}
	
	@RequestMapping(value = "/cancel")
	@ResponseBody
	public String cancel(@ModelAttribute FeeInvoiceModel feeInvoice, SessionStatus status){
		status.setComplete();
		return "Invoice Canceled!";
	}
	
	@RequestMapping(value = "/search/{id}")
	public String search(@PathVariable String id){
		
		return "";
	}
	
	
	

}
