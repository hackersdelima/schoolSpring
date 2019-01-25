package com.spring.model;

public class AccountTypeModel {
	private String previousAccountType, accountType, accountTypeHead,drcr, inputter, authorizer;



	public String getPreviousAccountType() {
		return previousAccountType;
	}

	public void setPreviousAccountType(String previousAccountType) {
		this.previousAccountType = previousAccountType;
	}

	public String getDrcr() {
		return drcr;
	}

	public void setDrcr(String drcr) {
		this.drcr = drcr;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getAccountTypeHead() {
		return accountTypeHead;
	}

	public void setAccountTypeHead(String accountTypeHead) {
		this.accountTypeHead = accountTypeHead;
	}

	public String getInputter() {
		return inputter;
	}

	public void setInputter(String inputter) {
		this.inputter = inputter;
	}

	public String getAuthorizer() {
		return authorizer;
	}

	public void setAuthorizer(String authorizer) {
		this.authorizer = authorizer;
	}

}
