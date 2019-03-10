package com.spring.model;

public class StaffModel {
	
	private String staffCode, staffName, staffAddress, post, branchCode, previousStaffCode;

	public String getStaffCode() {
		return staffCode;
	}

	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getStaffAddress() {
		return staffAddress;
	}

	public void setStaffAddress(String staffAddress) {
		this.staffAddress = staffAddress;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getPreviousStaffCode() {
		return previousStaffCode;
	}

	public void setPreviousStaffCode(String previousStaffCode) {
		this.previousStaffCode = previousStaffCode;
	}

	@Override
	public String toString() {
		return "StaffModel [staffCode=" + staffCode + ", staffName=" + staffName + ", staffAddress=" + staffAddress
				+ ", post=" + post + ", branchCode=" + branchCode + ", previousStaffCode=" + previousStaffCode + "]";
	}

	

}
