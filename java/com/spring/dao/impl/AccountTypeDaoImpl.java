package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.dao.AccountTypeDao;
import com.spring.model.AccountTypeModel;

@Repository
public class AccountTypeDaoImpl implements AccountTypeDao{
private JdbcTemplate jdbcTemplate;
	

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	 
	 @Autowired
	 private void setDataSource(DataSource dataSource)
	 {
		 this.jdbcTemplate=new JdbcTemplate(dataSource);
		 
	 }
	 
	 public int insert(AccountTypeModel accountTypeModel){
		 String sql = "insert into accounttype(accountType, accountTypeHead, inputter)values('"+accountTypeModel.getAccountType()+"','"+accountTypeModel.getAccountTypeHead()+"','"+accountTypeModel.getInputter()+"')";
		 return jdbcTemplate.update(sql);
	 }
	 
	 public AccountTypeModel getAccountType(String accountType){
		 String sql = "select * from accounttype where accountType = '"+accountType+"'";
		 return jdbcTemplate.queryForObject(sql, new AccountTypeRowMapper());
	 }
	 
	 public int update(AccountTypeModel accountTypeModel){
		 String sql = "update accounttype set accountType='"+accountTypeModel.getAccountType()+"', accountTypeHead = '"+accountTypeModel.getAccountTypeHead()+"', drcr = '"+accountTypeModel.getDrcr()+"' where accountType = '"+accountTypeModel.getPreviousAccountType()+"'";
		 return jdbcTemplate.update(sql);
	 }
	 public int delete(String id){
		 String sql = "delete from accounttype where accountType = '"+id+"'";
		 return jdbcTemplate.update(sql);
	 }
	 public static final class AccountTypeRowMapper implements RowMapper<AccountTypeModel>{

			@Override
			public AccountTypeModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				AccountTypeModel am=new AccountTypeModel();
				am.setAccountType(rs.getString("accountType"));
				am.setAccountTypeHead(rs.getString("accountTypeHead"));
				
				
				return am;
			}
			 
		 }
		 

	

}
