package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.dao.FeeInvoiceDao;
import com.spring.model.AccountModel;
import com.spring.model.FeeInvoiceModel;
import com.spring.model.InvoiceModel;
import com.spring.model.UserModel;

@Repository
public class FeeInvoiceDaoImpl implements FeeInvoiceDao {

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public boolean insertFeeInvoice(FeeInvoiceModel f) {
		boolean status = false;
		String sql = "insert into fee_invoice_tbl (studentid, fromDateEn, fromDateNep, toDateEn, toDateNep, invoiceNo, invoiceDateEn, invoiceDateNep, subTotal, discountPercentage, discountAmount, total, taxPercentage, taxAmount, grandTotal, amountPaid, balanceDue, inwords, remarks, receivedby) values ('"
				+ f.getStudent().getStudentid() + "','" + f.getFromDateEn() + "','" + f.getFromDateNep() + "','"
				+ f.getToDateEn() + "','" + f.getToDateNep() + "','" + f.getInvoiceNo() + "','" + f.getInvoiceDateEn()
				+ "','" + f.getInvoiceDateNep() + "','" + f.getSubTotal() + "','" + f.getDiscountPercentage() + "','"
				+ f.getDiscountAmount() + "','" + f.getTotal() + "','" + f.getTaxPercentage() + "','" + f.getTaxAmount()
				+ "','" + f.getGrandTotal() + "','" + f.getAmountPaid() + "','" + f.getBalanceDue() + "','"
				+ f.getInwords() + "','" + f.getRemarks() + "','" + f.getReceivedby() + "')";
		System.out.println(sql);

		int i = jdbcTemplate.update(sql);

		if (i > 0) {
			status = true;
		}
		return status;
	}

	public String maxFeeInvoiceId() {
		String sql = "select max(fee_invoice_id) as maxid from fee_invoice_tbl";
		return jdbcTemplate.queryForObject(sql, String.class);
	}

	public boolean insertFeeInvoiceContent(String invoiceNo, List<AccountModel> list,int i) {
		boolean status = false;
		double totalDebit=list.get(i).getDebitBal()-list.get(i).getCreditBal();
		String sql = "insert into fee_invoice_content(categoryId, accountNo, amount, fee_invoice_id,invoiceNo) values('"+list.get(i).getCategoryModel().getCategoryId()+"','"+list.get(i).getAccountNumber()+"','"+totalDebit+"','"+invoiceNo+"','"+invoiceNo+"')";
		System.out.println(sql);

		int j = jdbcTemplate.update(sql);

		if (j > 0) {
			status = true;
		}
		return status;
	}

	public InvoiceModel search(String invoiceNo) {
		String sql = "select * from fee_invoice_tbl where invoiceNo='"+invoiceNo+"'";
		return jdbcTemplate.queryForObject(sql, new FeeInvoiceMapper());
	}

	public final static class FeeInvoiceMapper implements RowMapper<InvoiceModel> {

		@Override
		public InvoiceModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			InvoiceModel im = new InvoiceModel();
			im.setInvoiceNo(rs.getString("invoiceNo"));
			im.setAmountPaid(rs.getDouble("amountPaid"));
			im.setBalanceDue(rs.getDouble("balanceDue"));
			im.setInvoiceDate(rs.getString("invoiceDateNep"));
			im.setInvoiceDateEn(rs.getString("invoiceDateEn"));
			im.setInwords(rs.getString("inwords"));
			im.setRemarks(rs.getString("remarks"));
			im.setStudentid(rs.getInt("studentid"));

			return im;
		}
	}

	@Override
	public boolean insertInvoice(InvoiceModel f) {
		boolean status = false;
		String sql = "insert into fee_invoice_tbl (studentid, invoiceNo, invoiceDateEn, invoiceDateNep,  total, amountPaid, balanceDue, inwords, remarks) values ('"
				+ f.getStudent().getStudentid() + "','" + f.getInvoiceNo() + "','" + f.getInvoiceDateEn()
				+ "','" + f.getInvoiceDate() + "','" + f.getTotal()+ "','" + f.getAmountPaid() + "','" + f.getBalanceDue() + "','"
				+ f.getInwords() + "','" + f.getRemarks() + "')";
		System.out.println(sql);

		int i = jdbcTemplate.update(sql);

		if (i > 0) {
			status = true;
		}
		return status;
	}

	@Override
	public List<InvoiceModel> searchAccounts(String invoiceNo) {
		String sql="select fee_invoice_content.*,categories.categoryHead from fee_invoice_content join categories using(categoryId) where invoiceNo='"+invoiceNo+"'";
		return jdbcTemplate.query(sql, new FeeInvoiceAccountsMapper());
		
	}
	
	public final static class FeeInvoiceAccountsMapper implements RowMapper<InvoiceModel>{

		@Override
		public InvoiceModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			InvoiceModel im = new InvoiceModel();
			im.setAccountNo(rs.getString("accountNo"));
			im.setCategoryHead(rs.getString("categoryHead"));
			im.setCategoryId(rs.getString("categoryId"));
			im.setAmount(rs.getDouble("amount"));
			
			
			return im;
		}
		
	}


	
}
