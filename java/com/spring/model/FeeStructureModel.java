package com.spring.model;

public class FeeStructureModel {
	
	private String studentid,categoryid,amount,paymentterm,frequency,discountamount,discountrate,note,startmonth,generateduptomonth,paymenttype;

	public String getPaymenttype() {
		return paymenttype;
	}

	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
	}

	public String getStartmonth() {
		return startmonth;
	}

	public void setStartmonth(String startmonth) {
		this.startmonth = startmonth;
	}

	public String getStudentid() {
		return studentid;
	}

	public String getPaymentterm() {
		return paymentterm;
	}

	public void setPaymentterm(String paymentterm) {
		this.paymentterm = paymentterm;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public String getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(String categoryid) {
		this.categoryid = categoryid;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	

	public String getFrequency() {
		return frequency;
	}

	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}

	

	public String getDiscountamount() {
		return discountamount;
	}

	public void setDiscountamount(String discountamount) {
		this.discountamount = discountamount;
	}

	public String getDiscountrate() {
		return discountrate;
	}

	public void setDiscountrate(String discountrate) {
		this.discountrate = discountrate;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}
