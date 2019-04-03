package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.dao.PaymentVoucherDao;
import com.spring.model.PaymentVoucherAccount;
import com.spring.model.PaymentVoucherAccountSingle;
import com.spring.model.PaymentVoucherModel;
import com.spring.model.StatementModel;

@Repository
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
		String query="insert into payment_voucher_account(payment_voucher_id,accountNo,drcr,amount,narration,chequeNo,curDateTime) values('"+maxId+"','"+p.getPaymentVoucherAccount().getAccountNo().get(i)+"','"+p.getPaymentVoucherAccount().getDrcr().get(i)+"','"+p.getPaymentVoucherAccount().getAmount().get(i)+"','"+p.getPaymentVoucherAccount().getNarration().get(i)+"','"+p.getPaymentVoucherAccount().getChequeNo().get(i)+"',NOW())";
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
		String query="select * from payment_voucher where payment_voucher_id='"+id+"'";
		return jdbcTemplate.queryForObject(query, new PaymentMapper());
	}

	@Override
	public ArrayList<PaymentVoucherAccountSingle> getPayments(String id) {
		String query="select payment_voucher_account.*,accountstbl.accountName from payment_voucher_account join accountstbl on accountstbl.accountNumber=payment_voucher_account.accountNo where payment_voucher_id='"+id+"'";
		
		return (ArrayList<com.spring.model.PaymentVoucherAccountSingle>) jdbcTemplate.query(query, new PaymentAccountMapper());
	}
	
	public static final class PaymentAccountMapper implements RowMapper<PaymentVoucherAccountSingle>{

		@Override
		public PaymentVoucherAccountSingle mapRow(ResultSet rs, int rowNum) throws SQLException {
			PaymentVoucherAccountSingle p=new PaymentVoucherAccountSingle();
			p.setAccountName(rs.getString("accountName"));
			p.setAccountNo(rs.getString("accountNo"));
			p.setAmount(rs.getString("amount"));
			p.setChequeNo(rs.getString("chequeNo"));
			p.setDrcr(rs.getString("drcr"));
			p.setNarration(rs.getString("narration"));
			
			return p;
		}
		
	}

	@Override
	public List<StatementModel> viewStatements(String id) {

		String query="select * from statementtbl where AccountNumber='"+id+"' order by autoId ";
		return jdbcTemplate.query(query,new StatementMapper());
	}

	public static final class StatementMapper implements RowMapper<StatementModel>{

		@Override
		public StatementModel mapRow(ResultSet rs, int rowNum) throws SQLException {

			StatementModel s=new StatementModel();
			s.setBalanceamount(rs.getDouble("balanceamount"));
			s.setBookingDate(rs.getString("bookingDate"));
			s.setCreditamount(rs.getDouble("creditamount"));
			s.setDebitamount(rs.getDouble("debitamount"));
			s.setValueDate(rs.getString("valueDate"));
			s.setNarrative(rs.getString("narrative"));
			s.setAccountNumber(rs.getString("AccountNumber"));
			/*s.setBookingDateen(rs.getString("bookingDateen"));
			s.setValueDateen(rs.getString("valueDateen"));*/
			
			return s;
		}
		
	}
}
