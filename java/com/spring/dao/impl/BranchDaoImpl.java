package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.spring.dao.BranchDao;
import com.spring.model.BranchModel;

public class BranchDaoImpl implements BranchDao {
private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate=jdbcTemplate;
	}
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate=new JdbcTemplate(dataSource);
	}
	public List<BranchModel> getBranches() {
		String sql = "select * from branchtbl";
		return jdbcTemplate.query(sql, new BranchMapper());
	}
	
	public static final class BranchMapper implements RowMapper<BranchModel>{

		@Override
		public BranchModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			BranchModel b = new BranchModel();
			b.setBranchId(rs.getString("branchId"));
			b.setBranchName(rs.getString("branchName"));
			
			return b;
		}
		
	}

}
