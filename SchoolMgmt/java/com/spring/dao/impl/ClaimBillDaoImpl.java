package com.spring.dao.impl;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.spring.dao.ClaimBillDao;
import com.spring.model.ClaimBillModel;
import com.spring.model.FeeInvoiceModel;
import com.spring.model.UserModel;

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
		String sql = "insert into claim_bill_tbl(fromDateEn,fromDateNep,toDateEn,toDateNep,invoiceNo,invoiceDateEn,invoiceDateNep,receivedby,nontaxable_totalfees,taxable_totalfees,totalfees,nontaxable_discount,taxable_discount,totaldiscount,nontaxable_total,taxable_total,total,tax_percentage,tax_amount,grand_total,drcr_previous_balance,total_receivable,studentid) "
				                     + "values('"+c.getFromDateEn()+"','"+c.getFromDateNep()+"','"+c.getToDateEn()+"','"+c.getToDateNep()+"','"+c.getInvoiceNo()+"','"+c.getInvoiceDateEn()+"','"+c.getInvoiceDateNep()+"','"+c.getReceivedby()+"','"+c.getNontaxable_totalfees()+"','"+c.getTaxable_totalfees()+"','"+c.getTotalfees()+"','"+c.getNontaxable_discount()+"','"+c.getTaxable_discount()+"','"+c.getTotaldiscount()+"','"+c.getNontaxable_total()+"','"+c.getTaxable_total()+"','"+c.getTotal()+"','"+c.getTax_percentage()+"','"+c.getTax_amount()+"','"+c.getGrand_total()+"','"+c.getDrcr_previous_balance()+"','"+c.getTotal_receivable()+"','"+c.getStudent().getStudentid()+"')";
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
		String sql = "insert into claim_bill_content(categoryId, nontaxableamount, taxableamount, totalamount, claim_bill_id) values('"+c.getCategory().getCategoryIdList().get(i)+"','"+c.getNontaxableamount().get(i)+"','"+c.getTaxableamount().get(i)+"','"+c.getTotalamount().get(i)+"','"+c.getClaim_bill_id()+"')";
		int j = jdbcTemplate.update(sql);

		if (j > 0) {
			status = true;
		}
		return status;
		
	}

}
