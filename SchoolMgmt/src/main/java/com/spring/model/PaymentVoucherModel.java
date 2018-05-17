package com.spring.model;

import java.util.List;

public class PaymentVoucherModel {
	private String transactionId, referenceNo, bookingDateen, bookingDate, valueDateen, valueDate, narration,totalDebitAmount,totalCreditAmount, inwords, preparedBy, checkedBy, approvedBy ;
	private List<String> accountNo, drcr, amount;
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
