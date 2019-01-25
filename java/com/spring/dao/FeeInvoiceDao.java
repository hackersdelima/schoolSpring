package com.spring.dao;

import com.spring.model.FeeInvoiceModel;

public interface FeeInvoiceDao {
	public boolean insertFeeInvoice(FeeInvoiceModel feeInvoiceModel);
	
	public String maxFeeInvoiceId();

	public boolean insertFeeInvoiceContent(FeeInvoiceModel feeInvoice, int i);

}
