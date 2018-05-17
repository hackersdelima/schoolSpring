package com.spring.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.spring.dao.PaymentVoucherDao;
import com.spring.model.PaymentVoucherModel;

public class PaymentVoucherDaoImpl implements PaymentVoucherDao {
private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate=jdbcTemplate;
	}
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate=new JdbcTemplate(dataSource);
	}

	public int add(PaymentVoucherModel paymentVoucher){
		String sql = "";
		return jdbcTemplate.update(sql);
	}

}
