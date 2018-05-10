package com.spring.model;

public class StaffModel {
	
	private String staffCode, staffName, staffAddress, post, branchCode, pid, previouspid;

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

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}
	

	public String getPreviouspid() {
		return previouspid;
	}

	public void setPreviouspid(String previouspid) {
		this.previouspid = previouspid;
	}

	@Override
	public String toString() {
		return "StaffModel [staffCode=" + staffCode + ", staffName=" + staffName + ", staffAddress=" + staffAddress
				+ ", post=" + post + ", branchCode=" + branchCode + ", pid=" + pid + "]";
	}
	

}
