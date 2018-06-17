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
		 String query="update sectiontbl set sectionname='"+formDetails.getSectionname()+"' where sectionid='"+formDetails.getSectionid()+"'";
		 jdbcTemplate.update(query);
	 }
	 
	 public void updateHousegroup(FormDetails formDetails){
		 String query="update housegrouptbl set housegroupname='"+formDetails.getHousegroupname()+"' where housegroupid='"+formDetails.getHousegroupid()+"'";
		 System.out.println(query);
		 jdbcTemplate.update(query);
	 }
	 
	 
	 public void UpdateEthnicgroup(FormDetails formDetails){
		 String query="update castetbl set castename='"+formDetails.getCastename()+"' where casteid='"+formDetails.getCasteid()+"'" ;
		 System.out.println(query);
		 jdbcTemplate.update(query);
	 }
	 public void UpdateSpecialInterest(FormDetails formDetails){
		 String query="update specialinteresttbl set specialinterestname='"+formDetails.getSpecialInterestName()+"' where specialinterestid='"+formDetails.getSpecialInterestId()+"'";
		 jdbcTemplate.update(query);
	 }

	public void UpdateAdmissionClass(FormDetails formDetails) {

		String query="update classlist set classname='"+formDetails.getClassname()+"'where classid='"+formDetails.getClassid()+"'";
		jdbcTemplate.update(query);
	}

	public void UpdateExamType(FormDetails formDetails)
	{
		String query="update exam_type set examtypename='"+formDetails.getExamtypename()+"' where examtypeid='"+formDetails.getExamtypeid()+"'";
		jdbcTemplate.update(query);
	}
	
	public void deleteLanguage(FormDetails formDetails)
	{
		
	}
}
