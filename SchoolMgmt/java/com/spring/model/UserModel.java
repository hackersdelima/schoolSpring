package com.spring.model;

import java.util.List;

import org.springframework.context.annotation.Scope;

@Scope("session")
public class UserModel {
private String username, password, status,userid,givenrole,fullName,post,staffCode,endDate,startDate,roleName,functionAllowed,functionRestriction,branchAllowed,branchAllowedFunctions,additionalFunctions;
private BranchModel branch;
private String settingsid, settingstype, settingsdescription;
private List<String> list;

public List<String> getList() {
	return list;
}

public void setList(List<String> list) {
	this.list = list;
}

public String getSettingsid() {
	return settingsid;
}

public void setSettingsid(String settingsid) {
	this.settingsid = settingsid;
}

public String getSettingstype() {
	return settingstype;
}

public void setSettingstype(String settingstype) {
	this.settingstype = settingstype;
}

public String getSettingsdescription() {
	return settingsdescription;
}

public void setSettingsdescription(String settingsdescription) {
	this.settingsdescription = settingsdescription;
}

public BranchModel getBranch() {
	return branch;
}

public void setBranch(BranchModel branch) {
	this.branch = branch;
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public String getUserid() {
	return userid;
}

public void setUserid(String userid) {
	this.userid = userid;
}

public String getGivenrole() {
	return givenrole;
}

public void setGivenrole(String givenrole) {
	this.givenrole = givenrole;
}

public String getFullName() {
	return fullName;
}

public void setFullName(String fullName) {
	this.fullName = fullName;
}

public String getPost() {
	return post;
}

public void setPost(String post) {
	this.post = post;
}

public String getStaffCode() {
	return staffCode;
}

public void setStaffCode(String staffCode) {
	this.staffCode = staffCode;
}

public String getEndDate() {
	return endDate;
}

public void setEndDate(String endDate) {
	this.endDate = endDate;
}

public String getStartDate() {
	return startDate;
}

public void setStartDate(String startDate) {
	this.startDate = startDate;
}

public String getRoleName() {
	return roleName;
}

public void setRoleName(String roleName) {
	this.roleName = roleName;
}

public String getFunctionAllowed() {
	return functionAllowed;
}

public void setFunctionAllowed(String functionAllowed) {
	this.functionAllowed = functionAllowed;
}

public String getFunctionRestriction() {
	return functionRestriction;
}

public void setFunctionRestriction(String functionRestriction) {
	this.functionRestriction = functionRestriction;
}

public String getBranchAllowed() {
	return branchAllowed;
}

public void setBranchAllowed(String branchAllowed) {
	this.branchAllowed = branchAllowed;
}

public String getBranchAllowedFunctions() {
	return branchAllowedFunctions;
}

public void setBranchAllowedFunctions(String branchAllowedFunctions) {
	this.branchAllowedFunctions = branchAllowedFunctions;
}

public String getAdditionalFunctions() {
	return additionalFunctions;
}

public void setAdditionalFunctions(String additionalFunctions) {
	this.additionalFunctions = additionalFunctions;
}

}
