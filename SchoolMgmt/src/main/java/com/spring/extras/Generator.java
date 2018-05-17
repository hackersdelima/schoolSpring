package com.spring.extras;

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

}
