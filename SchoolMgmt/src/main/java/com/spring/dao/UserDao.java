package com.spring.dao;


import java.util.List;

import com.spring.model.UserModel;

public interface UserDao {

	public boolean verifyUser(UserModel user);

	public UserModel getUserDetails(UserModel user);
	
	public boolean insertUser(UserModel u);
	
	public int updateUser(UserModel u);
	
	public List<UserModel> getUsers();
	
	public UserModel getSpecificUserDetails(String userid);

}
