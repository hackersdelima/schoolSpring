package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.dao.FeeDao;
import com.spring.model.FeeModel;

@Repository
public class FeeDaoImpl implements FeeDao {
	
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Autowired
	private void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);

	}

	@Override
	public List<FeeModel> getFeeDetails() {
		String query="select * from feerate";
		return jdbcTemplate.query(query,  new FeeMapper());
		

}
	
	public static final class FeeMapper implements RowMapper<FeeModel>
	{

		@Override
		public FeeModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			FeeModel f=new FeeModel();
			f.setCategoryId(rs.getString("categoryId"));
			f.setFrate(rs.getString("frate"));
			f.setSclass(rs.getString("sclass"));
			f.setFeecode(rs.getString("feecode"));
			return f;
		}
		
	}

	@Override
	public FeeModel getFeeSetting(String feecode) {
		String query="select * from feerate where feecode='"+feecode+"'";
		return jdbcTemplate.queryForObject(query, new FeeMapper());
	}
	
	
}
