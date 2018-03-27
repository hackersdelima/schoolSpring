package com.spring.dao;

import java.util.List;

import com.spring.model.UserModel;

public interface OperationDao {
	public List<UserModel> getSystemDetails();

	public boolean updateGeneralSetting(UserModel user);

	public boolean insertInitialDetail(String tablename, String value);

}
