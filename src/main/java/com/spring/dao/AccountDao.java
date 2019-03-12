package com.spring.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.model.AccountModel;
import com.spring.model.AccountTypeModel;
import com.spring.model.FeeInvoiceModel;

public interface AccountDao {
	 public List<AccountTypeModel> getAccountType();
	 public AccountTypeModel getAccountType(String categoryId);
	 
	 public boolean addAccount(AccountModel am);
	 
	 public int updateAccount(AccountModel am);
	 
	 public List<AccountModel> getAccount();
	 public List<AccountModel> getBulkAccounts(String studentid);
	 
	 public AccountModel getAccount(String accountNo);
	 
	public int deleteAccount(String id);
	public List<AccountModel> getStudentAccount(String id);
	public boolean checkIfUserExists(String memberid);
	public String acccountnogen(String memberid);
	public String getCurWorkingBalance(String accountNo);
	public int updateWorkingBal(String accountNo,int balAfterDiscount);
	public String getAccountName(String accountNo);
	public String generateAccountNo(String branchid, String companyid, String catId);
	public List<String> getFeeHeadCategories();
	public boolean updateCreditBal(double amountPaid, String accountNo);
	public String getStudentFromInoice(String invoiceNo);

}
