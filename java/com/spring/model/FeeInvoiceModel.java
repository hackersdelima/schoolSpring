package com.spring.model;

import java.util.List;

public class FeeInvoiceModel {
	private StudentModel student;
	private List<String> charges;
	private List<String> discount;
	private List<String> balance;
	private List<String> account;
	private CategoryModel category;
	
	public List<String> getAccount() {
		return account;
	}
	public void setAccount(List<String> account) {
		this.account = account;
	}

	private String receivedby, fee_invoice_id, fromDateEn, fromDateNep, toDateEn, toDateNep, invoiceNo, invoiceDateEn, invoiceDateNep, subTotal, discountPercentage, discountAmount, total, taxPercentage, taxAmount, grandTotal, amountPaid, balanceDue, inwords, remarks;
	public String getReceivedby() {
		return receivedby;
	}
	public void setReceivedby(String receivedby) {
		this.receivedby = receivedby;
	}
	public String getFee_invoice_id() {
		return fee_invoice_id;
	}
	public void setFee_invoice_id(String fee_invoice_id) {
		this.fee_invoice_id = fee_invoice_id;
	}

	
	public String getFromDateEn() {
		return fromDateEn;
	}
	public void setFromDateEn(String fromDateEn) {
		this.fromDateEn = fromDateEn;
	}
	public String getFromDateNep() {
		return fromDateNep;
	}
	public void setFromDateNep(String fromDateNep) {
		this.fromDateNep = fromDateNep;
	}
	public String getToDateEn() {
		return toDateEn;
	}
	public void setToDateEn(String toDateEn) {
		this.toDateEn = toDateEn;
	}
	public String getToDateNep() {
		return toDateNep;
	}
	public void setToDateNep(String toDateNep) {
		this.toDateNep = toDateNep;
	}
	public String getInvoiceNo() {
		return invoiceNo;
	}
	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	public String getInvoiceDateEn() {
		return invoiceDateEn;
	}
	public void setInvoiceDateEn(String invoiceDateEn) {
		this.invoiceDateEn = invoiceDateEn;
	}
	public String getInvoiceDateNep() {
		return invoiceDateNep;
	}
	public void setInvoiceDateNep(String invoiceDateNep) {
		this.invoiceDateNep = invoiceDateNep;
	}
	

	public List<String> getCharges() {
		return charges;
	}
	public void setCharges(List<String> charges) {
		this.charges = charges;
	}
	
	public List<String> getDiscount() {
		return discount;
	}
	public void setDiscount(List<String> discount) {
		this.discount = discount;
	}
	public List<String> getBalance() {
		return balance;
	}
	public void setBalance(List<String> balance) {
		this.balance = balance;
	}
	public String getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(String subTotal) {
		this.subTotal = subTotal;
	}
	public String getDiscountPercentage() {
		return discountPercentage;
	}
	public void setDiscountPercentage(String discountPercentage) {
		this.discountPercentage = discountPercentage;
	}
	public String getDiscountAmount() {
		return discountAmount;
	}
	public void setDiscountAmount(String discountAmount) {
		this.discountAmount = discountAmount;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getTaxPercentage() {
		return taxPercentage;
	}
	public void setTaxPercentage(String taxPercentage) {
		this.taxPercentage = taxPercentage;
	}
	public String getTaxAmount() {
		return taxAmount;
	}
	public void setTaxAmount(String taxAmount) {
		this.taxAmount = taxAmount;
	}
	public String getGrandTotal() {
		return grandTotal;
	}
	public void setGrandTotal(String grandTotal) {
		this.grandTotal = grandTotal;
	}
	public String getAmountPaid() {
		return amountPaid;
	}
	public void setAmountPaid(String amountPaid) {
		this.amountPaid = amountPaid;
	}
	public String getBalanceDue() {
		return balanceDue;
	}
	public void setBalanceDue(String balanceDue) {
		this.balanceDue = balanceDue;
	}
	public String getInwords() {
		return inwords;
	}
	public void setInwords(String inwords) {
		this.inwords = inwords;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public StudentModel getStudent() {
		return student;
	}
	public void setStudent(StudentModel student) {
		this.student = student;
	}
	public CategoryModel getCategory() {
		return category;
	}
	public void setCategory(CategoryModel category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "FeeInvoiceModel [student=" + student + ", category=" + category + ", charges=" + charges + ", discount="
				+ discount + ", balance=" + balance + ", account=" + account + ", receivedby=" + receivedby
				+ ", fee_invoice_id=" + fee_invoice_id + ", fromDateEn=" + fromDateEn + ", fromDateNep=" + fromDateNep
				+ ", toDateEn=" + toDateEn + ", toDateNep=" + toDateNep + ", invoiceNo=" + invoiceNo
				+ ", invoiceDateEn=" + invoiceDateEn + ", invoiceDateNep=" + invoiceDateNep + ", subTotal=" + subTotal
				+ ", discountPercentage=" + discountPercentage + ", discountAmount=" + discountAmount + ", total="
				+ total + ", taxPercentage=" + taxPercentage + ", taxAmount=" + taxAmount + ", grandTotal=" + grandTotal
				+ ", amountPaid=" + amountPaid + ", balanceDue=" + balanceDue + ", inwords=" + inwords + ", remarks="
				+ remarks + "]";
	}

	


	
	
	

}
