package com.spring.model;

import java.util.List;

public class PaymentVoucherAccountSingle {
	private String payment_voucher_account_id, accountNo,accountName, drcr, amount,narration,chequeNo;

	public String getPayment_voucher_account_id() {
		return payment_voucher_account_id;
	}

	public void setPayment_voucher_account_id(String payment_voucher_account_id) {
		this.payment_voucher_account_id = payment_voucher_account_id;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getDrcr() {
		return drcr;
	}

	public void setDrcr(String drcr) {
		this.drcr = drcr;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getNarration() {
		return narration;
	}

	public void setNarration(String narration) {
		this.narration = narration;
	}

	public String getChequeNo() {
		return chequeNo;
	}

	public void setChequeNo(String chequeNo) {
		this.chequeNo = chequeNo;
	}

}
