package com.spring.dao;

import java.util.List;

import com.spring.model.FeeModel;
import com.spring.model.FeeStructureModel;

public interface FeeDao {

	public List<FeeModel> getFeeDetails();

	public FeeModel getFeeSetting(String feecode);

	public boolean addFeeHead(String catId, String catHead);

	public boolean addFeeStructure(FeeStructureModel fm);

	public String getFeeAmount(String id, String catId);

}
