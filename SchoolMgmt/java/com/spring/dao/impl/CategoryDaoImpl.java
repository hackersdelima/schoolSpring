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
		String query="select categories.*, accounttype.accountTypeHead from categories join accounttype using(accountType) where categoryId like '222%'";
		return jdbcTemplate.query(query, new Categories());
	}

	
	public CategoryModel getCategory(String id){
		String query="select categories.*, accounttype.accountTypeHead from categories join accounttype using(accountType) where categories.categoryId='"+id+"'";
		return jdbcTemplate.queryForObject(query, new Categories());
	}
	
	public int delete(String id){
		String query = "delete from categories where categoryId = '"+id+"'";
		return jdbcTemplate.update(query);
	}
	public int update(CategoryModel category){
		String query = "update categories set categoryId = '"+category.getCategoryId()+"', categoryHead = '"+category.getCategoryHead()+"', accountType = '"+category.getAccountType()+"' where categoryId = '"+category.getPreviousid()+"'";
		return jdbcTemplate.update(query);
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
