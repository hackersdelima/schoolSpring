package com.spring.dao;

import java.util.List;

import com.spring.model.PaymentVoucherAccountSingle;
import com.spring.model.PaymentVoucherModel;
import com.spring.model.StatementModel;

public interface PaymentVoucherDao {
	public int add(PaymentVoucherModel paymentVoucher);

	public int addPaymentVoucherAccount(int i, int maxId, PaymentVoucherModel paymentVoucher);

	public List<PaymentVoucherModel> findAll();

	public PaymentVoucherModel getIndividualPayment(String id);

	public List<PaymentVoucherAccountSingle> getPayments(String id);

	public List<StatementModel> viewStatements(String id);
}
