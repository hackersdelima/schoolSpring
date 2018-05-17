package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.spring.dao.AccountDao;
import com.spring.model.AccountModel;
import com.spring.model.AccountTypeModel;
import com.spring.model.CategoryModel;
import com.spring.model.StudentModel;

public class AccountDaoImpl implements AccountDao{
	
private JdbcTemplate jdbcTemplate;
	

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	 
	 @Autowired
	 private void setDataSource(DataSource dataSource)
	 {
		 this.jdbcTemplate=new JdbcTemplate(dataSource);
		 
	 }
	 
	 public List<AccountTypeModel> getAccountType(){
		 String query="select * from accounttype";
		 return jdbcTemplate.query(query, new AccountType());
	 }
	 public AccountTypeModel getAccountType(String categoryId){
		 String query="select accountType, accountTypeHead from accounttype join categories using(accountType) where categories.categoryId = '"+categoryId+"'";
		 return jdbcTemplate.queryForObject(query, new AccountType());
	 }
	 
	 public static final class AccountType implements RowMapper<AccountTypeModel>{

		@Override
		public AccountTypeModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			AccountTypeModel am=new AccountTypeModel();
			am.setAccountType(rs.getString("accountType"));
			am.setAccountTypeHead(rs.getString("accountTypeHead"));
			am.setDrcr(rs.getString("drcr"));
			/*am.setAuthorizer(rs.getString("authorizer"));
			am.setInputter(rs.getString("inputter"));*/
			
			return am;
		}
		 
	 }
	 
	 public boolean addAccount(AccountModel am){
			boolean status=false;
			System.out.println(am);
			String sql="insert into accountstbl (accountNumber, pid, alternativeAccountId, categoryId, accountType, accountName, inputter) values ('"+am.getAccountNumber()+"','"+am.getMemberId()+"','"+am.getAlternativeAccountId()+"','"+am.getCategoryModel().getCategoryId()+"','"+am.getAccountTypeModel().getAccountType()+"','"+am.getAccountName()+"','"+am.getInputter()+"')";
			int i=jdbcTemplate.update(sql);
			if(i>0){
				status=true;
			}
			return status;
		}
	 public int updateAccount(AccountModel am){
		 String sql = "update accountstbl set accountNumber = '"+am.getAccountNumber()+"', pid = '"+am.getMemberId()+"', alternativeAccountId = '"+am.getAlternativeAccountId()+"', categoryId = '"+am.getCategoryModel().getCategoryId()+"', accountType = '"+am.getAccountTypeModel().getAccountType()+"', accountName = '"+am.getAccountName()+"' where accountNumber = '"+am.getPreviousAccountNumber()+"'";
		 return jdbcTemplate.update(sql);
	 }
	 
	 public int deleteAccount(String id){
		 String sql = "delete from accountstbl where accountNumber = '"+id+"'";
		 return jdbcTemplate.update(sql);
	 }
	 public List<AccountModel> getAccount(){
		 String query="select * from accountstbl join categories using(categoryId)";
		 return jdbcTemplate.query(query, new AccountRow());
	 }
	 
	 public AccountModel getAccount(String accountNo){
		 String query="select * from accountstbl join categories using(categoryId) where accountNumber = '"+accountNo+"'";
		 return jdbcTemplate.queryForObject(query, new AccountRow());
	 }
	 
	 public static final class AccountRow implements RowMapper<AccountModel>{

			@Override
			public AccountModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				AccountModel am=new AccountModel();
				StudentModel s=new StudentModel();
				AccountTypeModel atm = new AccountTypeModel();
				CategoryModel cm = new CategoryModel();
				
				am.setAccountNumber(rs.getString("accountNumber"));
				am.setAccountName(rs.getString("accountName"));
				am.setAlternativeAccountId(rs.getString("alternativeAccountId"));
				am.setMemberId(rs.getString("pid"));
				atm.setAccountType(rs.getString("accountType"));
				cm.setCategoryHead(rs.getString("categoryHead"));
				cm.setCategoryId(rs.getString("categoryId"));
				
				
				am.setAccountTypeModel(atm);
				am.setCategoryModel(cm);
				
				
				return am;
			}
			 
		 }
	 

}
