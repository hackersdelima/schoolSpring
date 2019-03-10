package com.spring.model;

public class BranchModel {
	private String companyId, branchId, branchName, branchAddress, branchPhone, branchFax, branchemail;

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getBranchId() {
		return branchId;
	}

	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getBranchAddress() {
		return branchAddress;
	}

	public void setBranchAddress(String branchAddress) {
		this.branchAddress = branchAddress;
	}

	public String getBranchPhone() {
		return branchPhone;
	}

	public void setBranchPhone(String branchPhone) {
		this.branchPhone = branchPhone;
	}

	public String getBranchFax() {
		return branchFax;
	}

	public void setBranchFax(String branchFax) {
		this.branchFax = branchFax;
	}

	public String getBranchemail() {
		return branchemail;
	}

	public void setBranchemail(String branchemail) {
		this.branchemail = branchemail;
	}

	@Override
	public String toString() {
		return "BranchModel [companyId=" + companyId + ", branchId=" + branchId + ", branchName=" + branchName
				+ ", branchAddress=" + branchAddress + ", branchPhone=" + branchPhone + ", branchFax=" + branchFax
				+ ", branchemail=" + branchemail + "]";
	}
	

}
