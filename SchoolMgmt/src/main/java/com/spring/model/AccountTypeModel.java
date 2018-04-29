package com.spring.model;

public class AccountTypeModel {
	private String accountType, accountTypeHead, inputter, authorizer, alternativeAccountId;

	public String getAlternativeAccountId() {
		return alternativeAccountId;
	}

	public void setAlternativeAccountId(String alternativeAccountId) {
		this.alternativeAccountId = alternativeAccountId;
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
