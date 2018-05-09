package com.spring.dao;

import com.spring.model.ClaimBillModel;

public interface ClaimBillDao {

	public boolean insertClaimBill(ClaimBillModel c);
	public String maxClaimBillId();
	public boolean insertClaimBillContent(ClaimBillModel c, int i);
}
