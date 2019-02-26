package com.spring.dao.impl;

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

}
