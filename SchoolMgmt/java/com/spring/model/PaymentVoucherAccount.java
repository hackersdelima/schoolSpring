package com.spring.model;

import java.util.List;

public class PaymentVoucherAccount {
	private List<String> payment_voucher_account_id, accountNo,accountName, drcr, amount,narration,chequeNo;

	public List<String> getChequeNo() {
		return chequeNo;
	}

	public void setChequeNo(List<String> chequeNo) {
		this.chequeNo = chequeNo;
	}

	public List<String> getNarration() {
		return narration;
	}

	public void setNarration(List<String> narration) {
		this.narration = narration;
	}

	public List<String> getAccountName() {
		return accountName;
	}

	public void setAccountName(List<String> accountName) {
		this.accountName = accountName;
	}

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
