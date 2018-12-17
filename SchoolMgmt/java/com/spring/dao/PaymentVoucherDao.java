package com.spring.dao;

import java.util.List;

import com.spring.model.PaymentVoucherModel;

public interface PaymentVoucherDao {
	public int add(PaymentVoucherModel paymentVoucher);

	public int addPaymentVoucherAccount(int i, int maxId, PaymentVoucherModel paymentVoucher);

	public List<PaymentVoucherModel> findAll();

	public PaymentVoucherModel getIndividualPayment(String id);
}
