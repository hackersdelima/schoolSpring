package com.spring.extras;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class Generator {
private JdbcTemplate jdbcTemplate;
	

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	 
	 @Autowired
	 private void setDataSource(DataSource dataSource)
	 {
		 this.jdbcTemplate=new JdbcTemplate(dataSource);
		 
	 }
	public String addHash(String givenValue){
		String[] str=givenValue.split(",");
		String result=null;
		String b="";
		for(int i=0;i<str.length;i++){
			result="#"+str[i];
			b=result+","+b;
		}
		if(b!=null){
			 givenValue=b.substring(0, b.length() - 1);
			 return givenValue;
		}
		
		return null;
	}
	public String imageUploadPath(){
		String sql="select description from administrator_settings where type='image_upload_path'";
		return jdbcTemplate.queryForObject(sql, String.class);
	}
	public String imageDownloadPath(){
		String sql="select description from administrator_settings where type='image_download_path'";
		return jdbcTemplate.queryForObject(sql, String.class);
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
		
		
		String query="select transactionId from payment_voucher where transactionId LIKE '%MT"+yr+month+day+branchid+"%' order by payment_voucher_id DESC;";

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


