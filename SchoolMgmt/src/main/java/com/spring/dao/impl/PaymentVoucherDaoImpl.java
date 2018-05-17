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

	public int add(PaymentVoucherModel p){
		
		//	private String  paymentVoucherId,transactionId, referenceNo, bookingDateen, bookingDate, valueDateen,
		//valueDate, narration,totalDebitAmount,totalCreditAmount, inwords, preparedBy, checkedBy, approvedBy ;

		String sql = "insert into payment_voucher(transactionId, referenceNo, bookingDateen, bookingDate, valueDateen, valueDate, narration,totalDebitAmount,totalCreditAmount, inwords, preparedBy, checkedBy, approvedBy)"
				+ "values('"+p.getTransactionId()+"','"+p.getReferenceNo()+"','"+p.getBookingDateen()+"','"+p.getBookingDate()+"','"+p.getValueDateen()+"','"+p.getValueDate()+"','"+p.getNarration()+"','"+p.getTotalDebitAmount()+"','"+p.getTotalCreditAmount()+"','"+p.getInwords()+"','"+p.getPreparedBy()+"','"+p.getCheckedBy()+"','"+p.getApprovedBy()+"')";
		return jdbcTemplate.update(sql);
	}

}
