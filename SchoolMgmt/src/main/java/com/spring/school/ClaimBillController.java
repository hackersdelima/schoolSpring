package com.spring.school;

import javax.servlet.http.HttpSession;

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
import com.spring.dao.ClaimBillDao;
import com.spring.model.ClaimBillModel;
import com.spring.model.FeeInvoiceModel;

@Controller
@RequestMapping("/claimbill")
@SessionAttributes("claimBill")
public class ClaimBillController {
	
	
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	ClaimBillDao claimBillDao;
	
	@RequestMapping(value="/add")
	public String viewClaimBill(Model model)
	{
		model.addAttribute("categorylist",categoryDao.getCategories());
		return "invoice/claimbill/claimbill";
	}

	
	@RequestMapping(value = "/review")
	public String review(@ModelAttribute ClaimBillModel claimBill, ModelMap model) {
		model.addAttribute("claimBill",claimBill);
	return "invoice/claimbill/claimbill_review";
	}
	
	@RequestMapping(value = "/save")
	@ResponseBody
	public String save(HttpSession session, SessionStatus status) {
		ClaimBillModel claimBill = (ClaimBillModel) session.getAttribute("claimBill");
		boolean invoiceSaveStatus = claimBillDao.insertClaimBill(claimBill);
		if (invoiceSaveStatus) {
			String maxClaimBillId = claimBillDao.maxClaimBillId();
			claimBill.setClaim_bill_id(maxClaimBillId);

			int size = claimBill.getCategory().getCategoryIdList().size();
			for (int i = 0; i < size; i++) {
				claimBillDao.insertClaimBillContent(claimBill, i);
			}
			status.setComplete();
			return "Data Saved!";
		}
		else{
		status.setComplete();
		return "Data Save Failed!";
		}
	}
	
	@RequestMapping(value = "/cancel")
	@ResponseBody
	public String cancel(@ModelAttribute ClaimBillModel claimBill, SessionStatus status) {
		status.setComplete();
		return "Claim Bill Canceled!";
	}
	
	@RequestMapping(value = "/search/{id}")
	public String search(@PathVariable String id) {

		return "";
	}

}
