package com.spring.model;

import java.util.List;

public class PaymentVoucherAccount {
	private List<String> payment_voucher_account_id, accountNo, drcr, amount;

	public List<String> getPayment_voucher_account_id() {
		return payment_voucher_account_id;
	}

	public void setPayment_voucher_account_id(List<String> payment_voucher_account_id) {
		this.payment_voucher_account_id = payment_voucher_account_id;
	}

	public List<String> getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(List<String> accountNo) {
		this.accountNo = accountNo;
	}

	public List<String> getDrcr() {
		return drcr;
	}

	public void setDrcr(List<String> drcr) {
		this.drcr = drcr;
	}

	public List<String> getAmount() {
		return amount;
	}

	public void setAmount(List<String> amount) {
		this.amount = amount;
	}
	
	

}
