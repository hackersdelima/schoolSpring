package com.spring.model;

public class StatementModel {
	String accountNumber,narrative,valueDate,bookingDate,bookingDateen,valueDateen;
	double debitamount,creditamount,balanceamount; 
	
	public String getBookingDateen() {
		return bookingDateen;
	}

	public void setBookingDateen(String bookingDateen) {
		this.bookingDateen = bookingDateen;
	}

	public String getValueDateen() {
		return valueDateen;
	}

	public void setValueDateen(String valueDateen) {
		this.valueDateen = valueDateen;
	}

	
	
	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public double getDebitamount() {
		return debitamount;
	}

	public void setDebitamount(double debitamount) {
		this.debitamount = debitamount;
	}

	public double getCreditamount() {
		return creditamount;
	}

	public void setCreditamount(double creditamount) {
		this.creditamount = creditamount;
	}

	public double getBalanceamount() {
		return balanceamount;
	}

	public void setBalanceamount(double balanceamount) {
		this.balanceamount = balanceamount;
	}

	public String getNarrative() {
		return narrative;
	}

	public void setNarrative(String narrative) {
		this.narrative = narrative;
	}

	public String getValueDate() {
		return valueDate;
	}

	public void setValueDate(String valueDate) {
		this.valueDate = valueDate;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

}
