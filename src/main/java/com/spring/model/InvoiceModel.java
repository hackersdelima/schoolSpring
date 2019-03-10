package com.spring.model;

import java.util.List;

public class InvoiceModel {

	private int  studentid;

	private String invoiceDateEn, invoiceDate, inwords,remarks,invoice_id,invoiceNo;
	

	public String getInvoiceNo() {
		return invoiceNo;
	}

	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}

	public String getInvoice_id() {
		return invoice_id;
	}

	public void setInvoice_id(String invoice_id) {
		this.invoice_id = invoice_id;
	}

	private double total, amountPaid, balanceDue;

	private List<String> balance;
	private List<String> account;
	private CategoryModel category;
	private StudentModel student;
	
	
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

	public String getInvoiceDateEn() {
		return invoiceDateEn;
	}

	public void setInvoiceDateEn(String invoiceDateEn) {
		this.invoiceDateEn = invoiceDateEn;
	}

	public String getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	public StudentModel getStudent() {
		return student;
	}

	public void setStudent(StudentModel student) {
		this.student = student;
	}

	public List<String> getBalance() {
		return balance;
	}

	public void setBalance(List<String> balance) {
		this.balance = balance;
	}

	public List<String> getAccount() {
		return account;
	}

	public void setAccount(List<String> account) {
		this.account = account;
	}

	public CategoryModel getCategory() {
		return category;
	}

	public void setCategory(CategoryModel category) {
		this.category = category;
	}

	
	public int getStudentid() {
		return studentid;
	}

	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public double getAmountPaid() {
		return amountPaid;
	}

	public void setAmountPaid(double amountPaid) {
		this.amountPaid = amountPaid;
	}

	public double getBalanceDue() {
		return balanceDue;
	}

	public void setBalanceDue(double balanceDue) {
		this.balanceDue = balanceDue;
	}

}
