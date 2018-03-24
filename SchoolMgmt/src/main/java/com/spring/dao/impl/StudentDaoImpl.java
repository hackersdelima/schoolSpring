package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.spring.dao.StudentDao;
import com.spring.dao.impl.UserDaoImpl.ClassMapper;
import com.spring.model.FormDetails;
import com.spring.model.UserModel;

public class StudentDaoImpl implements StudentDao {
private JdbcTemplate jdbcTemplate;
	

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	 
	 @Autowired
	 private void setDataSource(DataSource dataSource)
	 {
		 this.jdbcTemplate=new JdbcTemplate(dataSource);
		 
	 }
	 
	 public List<FormDetails> getDistricts(){
		 String sql="SELECT * FROM DISTRICTCODES";
			return jdbcTemplate.query(sql, new ClassMapper());
	 }
	 public static final class ClassMapper implements RowMapper<FormDetails>{

			@Override
			public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormDetails form=new FormDetails();
				form.setDistrictCode(rs.getString("DistrictCode"));
				form.setDistrictName(rs.getString("DistrictName"));
				return form;
			}
	 }
	 public List<FormDetails> getDisabledType(){
		 String sql="SELECT * FROM DISABLEDTYPE";
			return jdbcTemplate.query(sql, new DisabledType());
	 }
	 public static final class DisabledType implements RowMapper<FormDetails>{
			@Override
			public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormDetails form=new FormDetails();
				form.setId(rs.getString("id"));
				form.setTypehead(rs.getString("typehead"));
				return form;
			}
	 }
	

	 public List<FormDetails> getAdmissionClass(){
		 String sql="SELECT * FROM CLASSLIST";
			return jdbcTemplate.query(sql, new AdmissionClass());
	 }
	 public static final class AdmissionClass implements RowMapper<FormDetails>{
			@Override
			public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormDetails form=new FormDetails();
				form.setClassid(rs.getString("classid"));
				form.setClassname(rs.getString("classname"));
				return form;
			}
	 }
	 
	 public List<FormDetails> getSection(){
		 String sql="SELECT * FROM sectiontbl";
			return jdbcTemplate.query(sql, new Section());
	 }
	 public static final class Section implements RowMapper<FormDetails>{
			@Override
			public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormDetails form=new FormDetails();
				form.setSectionid(rs.getString("sectionid"));
				form.setSectionname(rs.getString("sectionname"));
				return form;
			}
	 }
	 
	 public List<FormDetails> HouseGroup(){
		 String sql="SELECT * FROM housegrouptbl";
			return jdbcTemplate.query(sql, new HouseGroup());
	 }
	 public static final class HouseGroup implements RowMapper<FormDetails>{
			@Override
			public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormDetails form=new FormDetails();
				form.setHousegroupid(rs.getString("housegroupid"));
				form.setHousegroupname(rs.getString("housegroupname"));
				return form;
			}
	 }
	 
	 
	 public List<FormDetails> SpecialInterest(){
		 String sql="SELECT * FROM specialinteresttbl";
			return jdbcTemplate.query(sql, new SpecialInterest());
	 }
	 public static final class SpecialInterest implements RowMapper<FormDetails>{
			@Override
			public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormDetails form=new FormDetails();
			form.setSpecialInterestId(rs.getString("specialinterestid"));
			form.setSpecialInterestName(rs.getString("specialinterestname"));
				return form;
			}
	 }
}
