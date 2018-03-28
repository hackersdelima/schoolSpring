package com.spring.dao;

import java.util.List;

import javax.security.auth.Subject;

import com.spring.model.FormDetails;
import com.spring.model.UserModel;

public interface OperationDao {
	public List<UserModel> getSystemDetails();

	public boolean updateGeneralSetting(UserModel user);

	public boolean insertInitialDetail(String tablename,String columns, String value);
	 public List<FormDetails> getSubjectList();

	

}
