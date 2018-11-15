package com.spring.dao;

import java.util.List;

import com.spring.model.FeeModel;

public interface FeeDao {

	public List<FeeModel> getFeeDetails();

	public FeeModel getFeeSetting(String feecode);

}
