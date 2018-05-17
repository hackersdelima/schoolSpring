package com.spring.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.spring.dao.PaymentVoucherDao;
import com.spring.model.PaymentVoucherAccount;
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
		jdbcTemplate.update(sql);
		
		String sql1="select max(payment_voucher_id) from payment_voucher";
		return jdbcTemplate.queryForObject(sql1, int.class);
	}
	
	public int addPaymentVoucherAccount(int i,int maxId, PaymentVoucherModel p)
	{
		String query="insert into payment_voucher_account(payment_voucher_id,accountNo,drcr,amount) values('"+maxId+"','"+p.getPaymentVoucherAccount().getAccountNo().get(i)+"','"+p.getPaymentVoucherAccount().getDrcr().get(i)+"','"+p.getPaymentVoucherAccount().getAmount().get(i)+"')";
		return jdbcTemplate.update(query);
	}

}
