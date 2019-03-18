package com.spring.dao;

import java.util.List;

import com.spring.model.AccountModel;
import com.spring.model.FeeInvoiceModel;
import com.spring.model.InvoiceModel;

public interface FeeInvoiceDao {
	public boolean insertFeeInvoice(FeeInvoiceModel feeInvoiceModel);
	
	public String maxFeeInvoiceId();

	public boolean insertFeeInvoiceContent(String invoiceNo, List<AccountModel> list,int i);
	
	public boolean insertInvoice(InvoiceModel f);

	public InvoiceModel search(String invoiceNo);

	public List<InvoiceModel> searchAccounts(String invoiceNo);
	

}
