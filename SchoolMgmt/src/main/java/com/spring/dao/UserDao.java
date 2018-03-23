package com.spring.dao;

import com.spring.model.UserModel;

public interface UserDao {

	public boolean verifyUser(UserModel user);

	public UserModel getUserDetails(UserModel user);

}
