package com.spring.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.spring.dao.ClaimBillDao;
import com.spring.model.ClaimBillModel;
import com.spring.model.FeeInvoiceModel;

public class ClaimBillDaoImpl implements ClaimBillDao {
private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate=jdbcTemplate;
	}
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate=new JdbcTemplate(dataSource);
	}
	public boolean insertClaimBill(ClaimBillModel c) {
		boolean status = false;
		String sql = "";
		int i = jdbcTemplate.update(sql);

		if (i > 0) {
			status = true;
		}
		return status;
	}
	
	public String maxClaimBillId() {
		String sql = "select max(claim_bill_id) as maxid from claim_bill_tbl";
		return jdbcTemplate.queryForObject(sql, String.class);
	}
	
	public boolean insertClaimBillContent(ClaimBillModel c, int i) {
		boolean status = false;
		String sql = "";
		int j = jdbcTemplate.update(sql);

		if (j > 0) {
			status = true;
		}
		return status;
		
	}

}
