package com.spring.model;

import java.util.List;

public class ClaimBillModel {
	private String receivedby, claim_bill_id, fromDateEn, fromDateNep, toDateEn, toDateNep, invoiceNo, invoiceDateEn, invoiceDateNep, remarks, inwords;
	private String accountNumber,taxable,admissionclass;
	private String frequency,startmonth,paymenttype,pid,generateduptpmonth;
	private Double tamount,namount,frate,discountamount;
	
	public String getGenerateduptpmonth() {
		return generateduptpmonth;
	}
	public void setGenerateduptpmonth(String generateduptpmonth) {
		this.generateduptpmonth = generateduptpmonth;
	}
	
	public Double getTamount() {
		return tamount;
	}
	public void setTamount(Double tamount) {
		this.tamount = tamount;
	}
	public Double getNamount() {
		return namount;
	}
	public void setNamount(Double namount) {
		this.namount = namount;
	}
	public void setFrate(Double frate) {
		this.frate = frate;
	}
	public void setDiscountamount(Double discountamount) {
		this.discountamount = discountamount;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPaymenttype() {
		return paymenttype;
	}
	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
	}
	public String getFrequency() {
		return frequency;
	}
	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
	public String getStartmonth() {
		return startmonth;
	}
	public void setStartmonth(String startmonth) {
		this.startmonth = startmonth;
	}
	
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getTaxable() {
		return taxable;
	}
	public void setTaxable(String taxable) {
		this.taxable = taxable;
	}
	public String getAdmissionclass() {
		return admissionclass;
	}
	public void setAdmissionclass(String admissionclass) {
		this.admissionclass = admissionclass;
	}
	
	public Double getFrate() {
		return frate;
	}
	public Double getDiscountamount() {
		return discountamount;
	}

	private StudentModel student;
	private CategoryModel category;
	private List<String> nontaxableamount, taxableamount, totalamount;
	private String nontaxable_totalfees, taxable_totalfees, totalfees;
	private String nontaxable_discount, taxable_discount, totaldiscount;
	private String nontaxable_total, taxable_total, total;
	private String tax_percentage, tax_amount;
	private String grand_total;
	private String drcr_previous_balance, total_receivable;
	public String getReceivedby() {
		return receivedby;
	}
	public void setReceivedby(String receivedby) {
		this.receivedby = receivedby;
	}
	public String getClaim_bill_id() {
		return claim_bill_id;
	}
	public void setClaim_bill_id(String claim_bill_id) {
		this.claim_bill_id = claim_bill_id;
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
	public List<String> getNontaxableamount() {
		return nontaxableamount;
	}
	public void setNontaxableamount(List<String> nontaxableamount) {
		this.nontaxableamount = nontaxableamount;
	}
	public List<String> getTaxableamount() {
		return taxableamount;
	}
	public void setTaxableamount(List<String> taxableamount) {
		this.taxableamount = taxableamount;
	}
	public List<String> getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(List<String> totalamount) {
		this.totalamount = totalamount;
	}
	public String getNontaxable_totalfees() {
		return nontaxable_totalfees;
	}
	public void setNontaxable_totalfees(String nontaxable_totalfees) {
		this.nontaxable_totalfees = nontaxable_totalfees;
	}
	public String getTaxable_totalfees() {
		return taxable_totalfees;
	}
	public void setTaxable_totalfees(String taxable_totalfees) {
		this.taxable_totalfees = taxable_totalfees;
	}
	public String getTotalfees() {
		return totalfees;
	}
	public void setTotalfees(String totalfees) {
		this.totalfees = totalfees;
	}
	public String getNontaxable_discount() {
		return nontaxable_discount;
	}
	public void setNontaxable_discount(String nontaxable_discount) {
		this.nontaxable_discount = nontaxable_discount;
	}
	public String getTaxable_discount() {
		return taxable_discount;
	}
	public void setTaxable_discount(String taxable_discount) {
		this.taxable_discount = taxable_discount;
	}
	public String getTotaldiscount() {
		return totaldiscount;
	}
	public void setTotaldiscount(String totaldiscount) {
		this.totaldiscount = totaldiscount;
	}
	public String getNontaxable_total() {
		return nontaxable_total;
	}
	public void setNontaxable_total(String nontaxable_total) {
		this.nontaxable_total = nontaxable_total;
	}
	public String getTaxable_total() {
		return taxable_total;
	}
	public void setTaxable_total(String taxable_total) {
		this.taxable_total = taxable_total;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getTax_percentage() {
		return tax_percentage;
	}
	public void setTax_percentage(String tax_percentage) {
		this.tax_percentage = tax_percentage;
	}
	public String getTax_amount() {
		return tax_amount;
	}
	public void setTax_amount(String tax_amount) {
		this.tax_amount = tax_amount;
	}
	public String getGrand_total() {
		return grand_total;
	}
	public void setGrand_total(String grand_total) {
		this.grand_total = grand_total;
	}
	public String getDrcr_previous_balance() {
		return drcr_previous_balance;
	}
	public void setDrcr_previous_balance(String drcr_previous_balance) {
		this.drcr_previous_balance = drcr_previous_balance;
	}
	public String getTotal_receivable() {
		return total_receivable;
	}
	public void setTotal_receivable(String total_receivable) {
		this.total_receivable = total_receivable;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getInwords() {
		return inwords;
	}
	public void setInwords(String inwords) {
		this.inwords = inwords;
	}
	@Override
	public String toString() {
		return "ClaimBillModel [receivedby=" + receivedby + ", claim_bill_id=" + claim_bill_id + ", fromDateEn="
				+ fromDateEn + ", fromDateNep=" + fromDateNep + ", toDateEn=" + toDateEn + ", toDateNep=" + toDateNep
				+ ", invoiceNo=" + invoiceNo + ", invoiceDateEn=" + invoiceDateEn + ", invoiceDateNep=" + invoiceDateNep
				+ ", remarks=" + remarks + ", inwords=" + inwords + ", accountNumber=" + accountNumber + ", taxable="
				+ taxable + ", admissionclass=" + admissionclass + ", frate=" + frate + ", frequency=" + frequency
				+ ", startmonth=" + startmonth + ", discountamount=" + discountamount + ", paymenttype=" + paymenttype
				+ ", student=" + student + ", category=" + category + ", nontaxableamount=" + nontaxableamount
				+ ", taxableamount=" + taxableamount + ", totalamount=" + totalamount + ", nontaxable_totalfees="
				+ nontaxable_totalfees + ", taxable_totalfees=" + taxable_totalfees + ", totalfees=" + totalfees
				+ ", nontaxable_discount=" + nontaxable_discount + ", taxable_discount=" + taxable_discount
				+ ", totaldiscount=" + totaldiscount + ", nontaxable_total=" + nontaxable_total + ", taxable_total="
				+ taxable_total + ", total=" + total + ", tax_percentage=" + tax_percentage + ", tax_amount="
				+ tax_amount + ", grand_total=" + grand_total + ", drcr_previous_balance=" + drcr_previous_balance
				+ ", total_receivable=" + total_receivable + "]";
	}
	
	

	
}
