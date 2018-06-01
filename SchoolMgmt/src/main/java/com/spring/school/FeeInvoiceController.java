package com.spring.school;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.dao.AccountDao;
import com.spring.dao.CategoryDao;
import com.spring.dao.FeeInvoiceDao;
import com.spring.model.FeeInvoiceModel;

@Controller
@RequestMapping("/invoice")
@SessionAttributes("feeInvoice")
public class FeeInvoiceController {

	@Autowired
	AccountDao accountDao;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	FeeInvoiceDao feeInvoiceDao;

	@RequestMapping(value = "/add")
	public String add(Model model, @RequestParam("studentid") String pid) {
		model.addAttribute("pid",pid);
		model.addAttribute("scategory",accountDao.getStudentAccount(pid));
		model.addAttribute("categorylist", categoryDao.getCategories());
		return "invoice/invoice";
	}

	@RequestMapping(value = "/review")
	public String review(@ModelAttribute FeeInvoiceModel feeInvoice, ModelMap model) {

		System.out.println(feeInvoice);
		System.out.println("invoking review()");
		model.addAttribute("feeInvoice", feeInvoice);
		return "invoice/printableInvoice";
	}

	@RequestMapping(value = "/save")
	@ResponseBody
	public String save(HttpSession session, SessionStatus status) {
		FeeInvoiceModel feeInvoice = (FeeInvoiceModel) session.getAttribute("feeInvoice");
		System.out.println(feeInvoice+" Fee InVoice");
		boolean invoiceSaveStatus = feeInvoiceDao.insertFeeInvoice(feeInvoice);
		if (invoiceSaveStatus) {
			String maxFeeInvoiceId = feeInvoiceDao.maxFeeInvoiceId();
			feeInvoice.setFee_invoice_id(maxFeeInvoiceId);
			
			//for deducting amount from individual account
			int sizeOfAccount=feeInvoice.getAccount().size();
			int totalPaid=Integer.parseInt(feeInvoice.getAmountPaid());
			System.out.println(" Total Paid ="+totalPaid);
			for(int i=0;i<sizeOfAccount;i++)
			{
				int oldWorkingBal=Integer.parseInt(accountDao.getCurWorkingBalance(feeInvoice.getAccount().get(i)));
				System.out.println(feeInvoice.getAccount().get(i)+"="+(oldWorkingBal));
				
				int balAfterDiscount=Integer.parseInt(feeInvoice.getBalance().get(i));
				System.out.println("Balance After Discount "+balAfterDiscount);
				
				if(totalPaid>=balAfterDiscount)
				{
					totalPaid=totalPaid-balAfterDiscount;
					int newWorkingBal=oldWorkingBal-balAfterDiscount;
					System.out.println(newWorkingBal);
					System.out.println("Remaining Total "+ totalPaid);
					int stats=accountDao.updateWorkingBal(feeInvoice.getAccount().get(i),newWorkingBal);
						
				}
				else
				{
					System.out.println("Unsufficent Balance "+ totalPaid);
					int newWorkingBal=oldWorkingBal-totalPaid;
					int stats=accountDao.updateWorkingBal(feeInvoice.getAccount().get(i),newWorkingBal);
				}
			}

			
			
	//-------------------------------------------------------------------------------------------------//
			int size = feeInvoice.getCategory().getCategoryIdList().size();
			for (int i = 0; i < size; i++) {
				feeInvoiceDao.insertFeeInvoiceContent(feeInvoice, i);
			}
			status.setComplete();
			return "<h3>Data Saved!</h3>";

		}
		else{
		status.setComplete();
		return "<h3>Data Save Failed!</h3>";
		}
	}

	@RequestMapping(value = "/cancel")
	@ResponseBody
	public String cancel(@ModelAttribute FeeInvoiceModel feeInvoice, SessionStatus status) {
		status.setComplete();
		return "Invoice Canceled!";
	}

	@RequestMapping(value = "/search/{id}")
	public String search(@PathVariable String id) {

		return "";
	}
	
	@RequestMapping(value="/search")
	public String invoiceSearch(Model model)
	{
		return "/invoice/invoicesearch";
	}

}
