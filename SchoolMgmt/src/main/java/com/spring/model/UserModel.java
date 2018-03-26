package com.spring.model;

import org.springframework.context.annotation.Scope;

@Scope("session")
public class UserModel {
private String userid, username, password, status;
private String settingsid, settingstype, settingsdescription;

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

public String getUserid() {
	return userid;
}

public void setUserid(String userid) {
	this.userid = userid;
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

@Override
public String toString() {
	return "UserModel [userid=" + userid + ", username=" + username + ", password=" + password + ", status=" + status
			+ "]";
}
}
