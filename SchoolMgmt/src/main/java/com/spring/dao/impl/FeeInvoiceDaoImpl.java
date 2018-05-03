package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.spring.dao.FeeInvoiceDao;
import com.spring.model.FeeInvoiceModel;
import com.spring.model.UserModel;

public class FeeInvoiceDaoImpl implements FeeInvoiceDao{
private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate=jdbcTemplate;
	}
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate=new JdbcTemplate(dataSource);
	}
	public boolean insertFeeInvoice(FeeInvoiceModel feeInvoiceModel){
		boolean status=false;
		String sql="insert into fee_invoice_tbl (fromdateen, fromdatenep, todateen, todatenep, invoiceno, studentid, invoicedateen, invoicedatenep, categoryId, description, charges,) values ()";
		int i=jdbcTemplate.update(sql);
		if(i>0){
			status=true;
		}
		return status;
	}
	
	public FeeInvoiceModel search(String invoiceNo){
		String sql = "select * from fee_invoice_tbl";
		return jdbcTemplate.queryForObject(sql, new FeeInvoiceMapper());
	}
	public final static class FeeInvoiceMapper implements RowMapper<FeeInvoiceModel> {

		@Override
		public FeeInvoiceModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			FeeInvoiceModel fm = new FeeInvoiceModel();
			
			return fm;
		}
	}
}
