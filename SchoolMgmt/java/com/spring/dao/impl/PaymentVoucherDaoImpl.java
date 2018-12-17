package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

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
		String query="insert into payment_voucher_account(payment_voucher_id,accountNo,drcr,amount,narration,chequeNo) values('"+maxId+"','"+p.getPaymentVoucherAccount().getAccountNo().get(i)+"','"+p.getPaymentVoucherAccount().getDrcr().get(i)+"','"+p.getPaymentVoucherAccount().getAmount().get(i)+"','"+p.getPaymentVoucherAccount().getNarration().get(i)+"','"+p.getPaymentVoucherAccount().getChequeNo().get(i)+"')";
		return jdbcTemplate.update(query);
	}

	@Override
	public List<PaymentVoucherModel> findAll() {
		String query="select * from payment_voucher";
		return jdbcTemplate.query(query,new PaymentMapper());
	}
	
	public static final class PaymentMapper implements RowMapper<PaymentVoucherModel>
	{

		@Override
		public PaymentVoucherModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			PaymentVoucherModel p=new PaymentVoucherModel();
			p.setApprovedBy(rs.getString("approvedBy"));
			p.setBookingDate(rs.getString("bookingDate"));
			p.setBookingDateen(rs.getString("bookingdateen"));
			p.setCheckedBy(rs.getString("checkedBy"));
			p.setNarration(rs.getString("narration"));
			p.setPayment_voucher_id(rs.getString("payment_voucher_id"));
			p.setPreparedBy(rs.getString("preparedBy"));
			p.setReferenceNo(rs.getString("referenceNo"));
			p.setTotalCreditAmount(rs.getString("totalCreditAmount"));
			p.setTotalDebitAmount(rs.getString("totalDebitAmount"));
			p.setTransactionId(rs.getString("transactionId"));
			p.setValueDate(rs.getString("valueDate"));
			p.setValueDateen(rs.getString("valueDateen"));
			
			return p;
		}
		
	}

	@Override
	public PaymentVoucherModel getIndividualPayment(String id) {
		String query="select * from payment_voucher where transactionId='"+id+"'";
		return jdbcTemplate.queryForObject(query, new PaymentMapper());
	}

}
