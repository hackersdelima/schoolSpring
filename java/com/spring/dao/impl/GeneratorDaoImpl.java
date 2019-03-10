package com.spring.dao.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.spring.dao.GeneratorDao;

@Repository
public class GeneratorDaoImpl implements GeneratorDao {
private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate=jdbcTemplate;
	}
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate=new JdbcTemplate(dataSource);
	}

	@Override
	public int getmaxid(String tablename) {
		String query = "select max(id) from "+tablename+"";
		return jdbcTemplate.queryForObject(query, Integer.class);
	}

	@Override
	public String invoiceIdGenerator() {

		String invoiceNo="";
		
		DateFormat yy = new SimpleDateFormat("yy");
		DateFormat mm = new SimpleDateFormat("MM");
		DateFormat dd = new SimpleDateFormat("dd");
		
		Date currentDate=new Date();
		System.out.println(yy.format(currentDate));
		System.out.println(mm.format(currentDate));
		System.out.println(dd.format(currentDate));
		String day=dd.format(currentDate);
		String month=mm.format(currentDate);
		String yr=yy.format(currentDate);
		
		
		String query="select max(invoiceNo) from fee_invoice_tbl where invoiceNo LIKE '"+yr+month+day+"%' order by fee_invoice_id DESC;";
		System.out.println(query);
		try {
			System.out.println(jdbcTemplate);
		 invoiceNo= (String)jdbcTemplate.queryForObject(query, String.class);
		 if(invoiceNo!=null) {
				int number=0;
				System.out.println(invoiceNo);
				
				String[] splitCode = invoiceNo.split(yr+month+day);
				
				System.out.println("tid"+splitCode[1]);
				number=Integer.parseInt(splitCode[1]);
				number++;
				String num=String.format("%03d", number);
				
				invoiceNo = yr+month+day+num;
				System.out.println(invoiceNo);
				
				}
				
				return invoiceNo;
		}catch(Exception e){
			System.out.println("caught"+e);
			invoiceNo= yr+month+day+"001";
			System.out.println(invoiceNo);
			return invoiceNo;
		}
		
		
		
	}

	public String multitransactionidgenerator(String branchid) {

		String transactionid="";
		
		DateFormat yy = new SimpleDateFormat("yy");
		DateFormat mm = new SimpleDateFormat("MM");
		DateFormat dd = new SimpleDateFormat("dd");
		
		Date currentDate=new Date();
		System.out.println(yy.format(currentDate));
		System.out.println(mm.format(currentDate));
		System.out.println(dd.format(currentDate));
		String day=dd.format(currentDate);
		String month=mm.format(currentDate);
		String yr=yy.format(currentDate);
		
		
		String query="select max(transactionId) from payment_voucher where transactionId LIKE '%MT"+yr+month+day+branchid+"%' order by payment_voucher_id DESC;";

		try {
		 transactionid= jdbcTemplate.queryForObject(query, String.class);
		}catch(Exception e){
			System.out.println("caught");
			transactionid= "MT"+yr+month+day+branchid+"001";
			System.out.println(transactionid);
			return transactionid;
		}
		
		
		if(transactionid!=null) {
		int number=0;
		System.out.println(transactionid);
		System.out.println(branchid);
		String[] splitCode = transactionid.split(yr+month+day);
		
		System.out.println("tid"+splitCode[1]);
		number=Integer.parseInt(splitCode[1]);
		number++;
		String num=String.format("%06d", number);
		
		transactionid = "MT"+yr+month+day+num;
		System.out.println(transactionid);
		
		}
		
		return transactionid;
	}
	

}
