package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.spring.dao.CategoryDao;
import com.spring.model.AccountTypeModel;
import com.spring.model.CategoryModel;

public class CategoryDaoImpl implements CategoryDao{
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate=jdbcTemplate;
	}
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate=new JdbcTemplate(dataSource);
	}

	public List<CategoryModel> getCategories(){
		String query="select categories.*, accounttype.accountTypeHead from categories join accounttype using(accountType);";
		return jdbcTemplate.query(query, new Categories());
	}
	
	
	
	public static final class Categories implements RowMapper<CategoryModel>{

		@Override
		public CategoryModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			CategoryModel cm=new CategoryModel();
			AccountTypeModel atm=new AccountTypeModel();
			
			cm.setCategoryId(rs.getString("categoryId"));
			cm.setCategoryHead(rs.getString("categoryHead"));
			cm.setInputter(rs.getString("inputter"));
			cm.setAuthorizer(rs.getString("authorizer"));
			
			atm.setAccountType(rs.getString("accountType"));
			atm.setAccountTypeHead(rs.getString("accountTypeHead"));
			cm.setAccountTypeModel(atm);
			return cm;
		}
		
	}
	
}
