package com.spring.model;

import java.util.List;

public class PaymentVoucherModel {
	private String payment_voucher_id,transactionId, referenceNo, bookingDateen, bookingDate, valueDateen, valueDate, narration,totalDebitAmount,totalCreditAmount, inwords, preparedBy, checkedBy, approvedBy ;
	private PaymentVoucherAccount paymentVoucherAccount;
	
	public PaymentVoucherAccount getPaymentVoucherAccount() {
		return paymentVoucherAccount;
	}
	public void setPaymentVoucherAccount(PaymentVoucherAccount paymentVoucherAccount) {
		this.paymentVoucherAccount = paymentVoucherAccount;
	}
	public String getPayment_voucher_id() {
		return payment_voucher_id;
	}
	public void setPayment_voucher_id(String payment_voucher_id) {
		this.payment_voucher_id = payment_voucher_id;
	}

	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public String getReferenceNo() {
		return referenceNo;
	}
	public void setReferenceNo(String referenceNo) {
		this.referenceNo = referenceNo;
	}
	public String getBookingDateen() {
		return bookingDateen;
	}
	public void setBookingDateen(String bookingDateen) {
		this.bookingDateen = bookingDateen;
	}
	public String getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}
	public String getValueDateen() {
		return valueDateen;
	}
	public void setValueDateen(String valueDateen) {
		this.valueDateen = valueDateen;
	}
	public String getValueDate() {
		return valueDate;
	}
	public void setValueDate(String valueDate) {
		this.valueDate = valueDate;
	}
	public String getNarration() {
		return narration;
	}
	public void setNarration(String narration) {
		this.narration = narration;
	}
	public String getTotalDebitAmount() {
		return totalDebitAmount;
	}
	public void setTotalDebitAmount(String totalDebitAmount) {
		this.totalDebitAmount = totalDebitAmount;
	}
	public String getTotalCreditAmount() {
		return totalCreditAmount;
	}
	public void setTotalCreditAmount(String totalCreditAmount) {
		this.totalCreditAmount = totalCreditAmount;
	}
	public String getInwords() {
		return inwords;
	}
	public void setInwords(String inwords) {
		this.inwords = inwords;
	}
	public String getPreparedBy() {
		return preparedBy;
	}
	public void setPreparedBy(String preparedBy) {
		this.preparedBy = preparedBy;
	}
	public String getCheckedBy() {
		return checkedBy;
	}
	public void setCheckedBy(String checkedBy) {
		this.checkedBy = checkedBy;
	}
	public String getApprovedBy() {
		return approvedBy;
	}
	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}

}
