package com.spring.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.spring.dao.FundTransferDao;

public class FundTransferDaoImpl implements FundTransferDao{
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	 
	 @Autowired
	 private void setDataSource(DataSource dataSource)
	 {
		 this.jdbcTemplate=new JdbcTemplate(dataSource);
	 }
	 

}
