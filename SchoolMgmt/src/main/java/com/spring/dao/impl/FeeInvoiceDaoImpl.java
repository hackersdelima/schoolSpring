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
	public boolean insertFeeInvoice(FeeInvoiceModel f){
		boolean status=false;
		String sql="insert into fee_invoice_tbl (studentid, fromDateEn, fromDateNep, toDateEn, toDateNep, invoiceNo, invoiceDateEn, invoiceDateNep, subTotal, discountPercentage, discountAmount, total, taxPercentage, taxAmount, grandTotal, amountPaid, balanceDue, inwords, remarks, receivedby) values ('"+f.getStudent().getStudentid()+"','"+f.getFromDateEn()+"','"+f.getFromDateNep()+"','"+f.getToDateEn()+"','"+f.getToDateNep()+"','"+f.getInvoiceNo()+"','"+f.getInvoiceDateEn()+"','"+f.getInvoiceDateNep()+"','"+f.getSubTotal()+"','"+f.getDiscountPercentage()+"','"+f.getDiscountAmount()+"','"+f.getTotal()+"','"+f.getTaxPercentage()+"','"+f.getTaxAmount()+"','"+f.getGrandTotal()+"','"+f.getAmountPaid()+"','"+f.getBalanceDue()+"','"+f.getInwords()+"','"+f.getRemarks()+"','"+f.getReceivedby()+"')";
		System.out.println(sql);
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
