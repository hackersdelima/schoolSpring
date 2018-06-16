package com.spring.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.spring.dao.InitialDetailsDao;
import com.spring.model.FormDetails;

public class InitialDetailsDaoImpl implements InitialDetailsDao {
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	 
	 @Autowired
	 private void setDataSource(DataSource dataSource)
	 {
		 this.jdbcTemplate=new JdbcTemplate(dataSource);
	 }
	 
	 public void updateLanguage(FormDetails formDetails){
		 String query="update languagetbl set languagename='"+formDetails.getLanguagename()+"' where languageid='"+formDetails.getLanguageid()+"'";
		 jdbcTemplate.update(query);
	 }
	 public void updateSection(FormDetails formDetails){
		 String query="";
		 jdbcTemplate.update(query);
	 }
	 
	 public void updateHousegroup(FormDetails formDetails){
		 String query="";
		 jdbcTemplate.update(query);
	 }
	 
	 public void UpdateEthnicgroup(FormDetails formDetails){
		 String query="";
		 jdbcTemplate.update(query);
	 }
	 public void UpdateSpecialInterest(FormDetails formDetails){
		 String query="";
		 jdbcTemplate.update(query);
	 }

}
