package com.spring.school;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.dao.PaymentVoucherDao;
import com.spring.model.PaymentVoucherModel;

@Controller
@SessionAttributes("paymentVoucher")
@RequestMapping(value = "paymentVoucher")
public class PaymentVoucherController {
	@Autowired
	PaymentVoucherDao paymentVoucherDao;

	@RequestMapping(value = "/add")
	@ResponseBody
	public String add(HttpSession session, SessionStatus status) {
		PaymentVoucherModel paymentVoucher = (PaymentVoucherModel) session.getAttribute("paymentVoucher");
		int maxId = paymentVoucherDao.add(paymentVoucher);
		if (maxId != 0) {
			for (int i = 0; i < paymentVoucher.getPaymentVoucherAccount().getAccountNo().size(); i++) {
				System.out.println("SUccess");
				paymentVoucherDao.addPaymentVoucherAccount(i, maxId, paymentVoucher);
			}
			status.setComplete();
			return "Save Successful!";
		}
		status.setComplete();
		return "Save Failed!";
	}

	@RequestMapping(value = "/review")
	public String review(@ModelAttribute PaymentVoucherModel paymentVoucherModel, Model model) {
		model.addAttribute("paymentVoucher", paymentVoucherModel);
		return "generalTransaction/fundsTransfer/paymentVoucher/print";
	}

	@RequestMapping(value = "/cancel")
	@ResponseBody
	public String cancel(SessionStatus status) {
		status.setComplete();
		return "Payment Voucher Cancled!";
	}

}
