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
	

}
