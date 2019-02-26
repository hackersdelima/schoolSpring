package com.spring.dao;

import java.util.ArrayList;

import com.spring.model.ClaimBillModel;

public interface ClaimBillDao {

	public boolean insertClaimBill(ClaimBillModel c);
	public String maxClaimBillId();
	public boolean insertClaimBillContent(ClaimBillModel c, int i);
	public ArrayList<ClaimBillModel> getAllDetails(String id, String claimBillStartMonth);
	public int saveClaimBill(String id,ClaimBillModel claimBillModel,String month,Double taxRate);
	public boolean updateBalance(ClaimBillModel claimBillModel, String id);
	public Double calculatePreviousBalance(String id);
	
}
