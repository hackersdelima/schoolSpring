package com.spring.dao;

import com.spring.model.AccountTypeModel;

public interface AccountTypeDao {

	public int insert(AccountTypeModel accountTypeModel);

	public AccountTypeModel getAccountType(String accountType);

	public int update(AccountTypeModel accountTypeModel);

	public int delete(String id);

}
