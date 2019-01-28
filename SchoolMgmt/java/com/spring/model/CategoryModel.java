package com.spring.model;

import java.util.List;

public class CategoryModel {
	private String previousid, categoryId, categoryHead, accountType, inputter,authorizer;
	private String taxable;
	private List<String> categoryIdList;
	private List<String> categoryHeadList;
	
	
	
	public String getTaxable() {
		return taxable;
	}

	public void setTaxable(String taxable) {
		this.taxable = taxable;
	}
	public List<String> getCategoryIdList() {
		return categoryIdList;
	}

	public void setCategoryIdList(List<String> categoryIdList) {
		this.categoryIdList = categoryIdList;
	}

	public List<String> getCategoryHeadList() {
		return categoryHeadList;
	}

	public void setCategoryHeadList(List<String> categoryHeadList) {
		this.categoryHeadList = categoryHeadList;
	}

	public String getPreviousid() {
		return previousid;
	}

	public void setPreviousid(String previousid) {
		this.previousid = previousid;
	}

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

	@Override
	public String toString() {
		return "CategoryModel [previousid=" + previousid + ", categoryId=" + categoryId + ", categoryHead="
				+ categoryHead + ", accountType=" + accountType + ", inputter=" + inputter + ", authorizer="
				+ authorizer + ", accountTypeModel=" + accountTypeModel + "]";
	}

	
}
