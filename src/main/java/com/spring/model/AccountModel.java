package com.spring.model;

public class AccountModel {
private String  memberId, accountNumber,alternativeAccountId, accountName, inputter , previousAccountNumber;

private double workingBal,debitBal,creditBal,amountPaid;

public double getAmountPaid() {
	return amountPaid;
}
public void setAmountPaid(double amountPaid) {
	this.amountPaid = amountPaid;
}
private CategoryModel categoryModel;
private AccountTypeModel accountTypeModel;
private StudentModel studentModel;

public String getMemberId() {
	return memberId;
}
public void setMemberId(String memberId) {
	this.memberId = memberId;
}
public String getPreviousAccountNumber() {
	return previousAccountNumber;
}
public void setPreviousAccountNumber(String previousAccountNumber) {
	this.previousAccountNumber = previousAccountNumber;
}
public String getInputter() {
	return inputter;
}
public void setInputter(String inputter) {
	this.inputter = inputter;
}
public StudentModel getStudentModel() {
	return studentModel;
}
public void setStudentModel(StudentModel studentModel) {
	this.studentModel = studentModel;
}
public String getAccountNumber() {
	return accountNumber;
}
public void setAccountNumber(String accountNumber) {
	this.accountNumber = accountNumber;
}
public String getAlternativeAccountId() {
	return alternativeAccountId;
}
public void setAlternativeAccountId(String alternativeAccountId) {
	this.alternativeAccountId = alternativeAccountId;
}
public String getAccountName() {
	return accountName;
}
public void setAccountName(String accountName) {
	this.accountName = accountName;
}

public CategoryModel getCategoryModel() {
	return categoryModel;
}
public void setCategoryModel(CategoryModel categoryModel) {
	this.categoryModel = categoryModel;
}
public AccountTypeModel getAccountTypeModel() {
	return accountTypeModel;
}
public void setAccountTypeModel(AccountTypeModel accountTypeModel) {
	this.accountTypeModel = accountTypeModel;
}





public double getWorkingBal() {
	return workingBal;
}
public void setWorkingBal(double workingBal) {
	this.workingBal = workingBal;
}
public double getDebitBal() {
	return debitBal;
}
public void setDebitBal(double debitBal) {
	this.debitBal = debitBal;
}
public double getCreditBal() {
	return creditBal;
}
public void setCreditBal(double creditBal) {
	this.creditBal = creditBal;
}
@Override
public String toString() {
	return "AccountModel [memberId=" + memberId + ", accountNumber=" + accountNumber + ", alternativeAccountId="
			+ alternativeAccountId + ", accountName=" + accountName + ", inputter=" + inputter
			+ ", previousAccountNumber=" + previousAccountNumber + ", categoryModel=" + categoryModel
			+ ", accountTypeModel=" + accountTypeModel + ", studentModel=" + studentModel + "]";
}



}
