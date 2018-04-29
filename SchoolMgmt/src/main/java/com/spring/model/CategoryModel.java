package com.spring.model;

public class CategoryModel {
	private String categoryId, categoryHead, accountType, inputter,authorizer;
	private AccountTypeModel accountTypeModel;

	public AccountTypeModel getAccountTypeModel() {
		return accountTypeModel;
	}

	public void setAccountTypeModel(AccountTypeModel accountTypeModel) {
		this.accountTypeModel = accountTypeModel;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryHead() {
		return categoryHead;
	}

	public void setCategoryHead(String categoryHead) {
		this.categoryHead = categoryHead;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
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
