package com.spring.school;

import java.util.List;

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
import com.spring.dao.StudentDao;
import com.spring.model.ClaimBillModel;
import com.spring.model.FeeInvoiceModel;
import com.spring.model.StudentModel;
import com.spring.model.UserModel;

@Controller
@RequestMapping("/claimbill")
@SessionAttributes("claimBill")
public class ClaimBillController {
	
	
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	ClaimBillDao claimBillDao;
	
	@Autowired
	private StudentDao studentDao;
	
	@RequestMapping(value="/studentList")
	public String studentList(Model model){
		List<StudentModel> list = studentDao.getAllStudents();
		model.addAttribute("slist", list);
		return "invoice/claimbill/studentList";
	}
	
	@RequestMapping(value="/add/{id}")
	public String viewClaimBill(Model model, @PathVariable String id)
	{
		model.addAttribute("s",studentDao.getStudentDetail(Integer.parseInt(id)));
		model.addAttribute("details",claimBillDao.getAllDetails(id));
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
		UserModel userdetail=(UserModel)session.getAttribute("userDetail");
		System.out.println(userdetail.getUsername());
		claimBill.setReceivedby(userdetail.getUsername());
		
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
