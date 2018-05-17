package com.spring.school;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dao.PaymentVoucherDao;
import com.spring.model.PaymentVoucherModel;

@Controller
@RequestMapping(value = "paymentVoucher")
public class PaymentVoucherController {
	@Autowired
	PaymentVoucherDao paymentVoucherDao;
	@RequestMapping(value = "/add")
	
	public String add(@ModelAttribute PaymentVoucherModel paymentVoucher){
		int status = paymentVoucherDao.add(paymentVoucher);
		
		return "";
	}

}
