package com.spring.dao;

import com.spring.model.PaymentVoucherModel;

public interface PaymentVoucherDao {
	public int add(PaymentVoucherModel paymentVoucher);

	public int addPaymentVoucherAccount(int i, int maxId, PaymentVoucherModel paymentVoucher);
}
