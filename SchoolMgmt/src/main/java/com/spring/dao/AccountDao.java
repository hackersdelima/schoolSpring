package com.spring.dao;

import java.util.List;

import com.spring.model.AccountModel;
import com.spring.model.AccountTypeModel;

public interface AccountDao {
	 public List<AccountTypeModel> getAccountType();
	 public AccountTypeModel getAccountType(String categoryId);
	 
	 public boolean addAccount(AccountModel am);
	 
	 public int updateAccount(AccountModel am);
	 
	 public List<AccountModel> getAccount();
	 
	 public AccountModel getAccount(String accountNo);
	 
	public int deleteAccount(String id);

}
