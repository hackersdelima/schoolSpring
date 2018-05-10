package com.spring.dao;

import javax.servlet.http.HttpSession;

import com.spring.model.ClaimBillModel;

public interface ClaimBillDao {

	public boolean insertClaimBill(ClaimBillModel c);
	public String maxClaimBillId();
	public boolean insertClaimBillContent(ClaimBillModel c, int i);
	
}
