package com.spring.model;

public class FeeInvoiceModel {
	private String fromDateEn, fromDateNep, toDateEn, toDateNep, invoiceNo, invoiceDateEn, invoiceDateNep, description, charges, payments, balance, subTotal, discountPercentage, discountAmount, total, taxPercentage, taxAmount, grandTotal, amountPaid, balanceDue, inwords, remarks;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCharges() {
		return charges;
	}
	public void setCharges(String charges) {
		this.charges = charges;
	}
	public String getPayments() {
		return payments;
	}
	public void setPayments(String payments) {
		this.payments = payments;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
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
	private StudentModel student;
	private CategoryModel category;
	@Override
	public String toString() {
		return "FeeInvoiceModel [fromDateEn=" + fromDateEn + ", fromDateNep=" + fromDateNep + ", toDateEn=" + toDateEn
				+ ", toDateNep=" + toDateNep + ", invoiceNo=" + invoiceNo + ", invoiceDateEn=" + invoiceDateEn
				+ ", invoiceDateNep=" + invoiceDateNep + ", description=" + description + ", charges=" + charges
				+ ", payments=" + payments + ", balance=" + balance + ", subTotal=" + subTotal + ", discountPercentage="
				+ discountPercentage + ", discountAmount=" + discountAmount + ", total=" + total + ", taxPercentage="
				+ taxPercentage + ", taxAmount=" + taxAmount + ", grandTotal=" + grandTotal + ", amountPaid="
				+ amountPaid + ", balanceDue=" + balanceDue + ", inwords=" + inwords + ", remarks=" + remarks
				+ ", student=" + student + ", category=" + category + "]";
	}
	

}
