package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.spring.dao.FeeDao;
import com.spring.model.FeeModel;
import com.spring.model.FeeStructureModel;

@Repository
public class FeeDaoImpl implements FeeDao {
	private JdbcTemplate jdbcTemplate;

	private NamedParameterJdbcTemplate template;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.template = new NamedParameterJdbcTemplate(dataSource);
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

	@Override
	public boolean addFeeHead(String catId, String catHead) {
		try {
		String sql="insert into feeheadtbl(categoryId,categoryHead) values('"+catId+"','"+catHead+"')";
		int result=jdbcTemplate.update(sql);
		if(result>0)
		{
			return true;
		}
		}
		catch(Exception e)
		{
			return false;
		}
		return false;
	}

	@Override
	public boolean addFeeStructure(FeeStructureModel fm) {
		boolean status=false;
		String sql="insert into feestructuretbl(studentid,categoryid,amount,frequency,discountamount,discountpercent,note,startmonth,generateduptomonth,paymenttype) values('"+fm.getStudentid()+"','"+fm.getCategoryid()+"','"+fm.getAmount()+"','"+fm.getFrequency()+"','"+fm.getDiscountamount()+"','"+fm.getDiscountrate()+"','"+fm.getNote()+"','"+fm.getStartmonth()+"','"+fm.getStartmonth()+"','"+fm.getPaymenttype()+"')";
		int result= jdbcTemplate.update(sql);
		if(result>0) {
			status=true;
		}
		return status;
		
	}

	@Override
	public String getFeeAmount(String id, String catId) {

		String sql="SELECT feerate.frate from feerate join studentinfo on feerate.sclass=studentinfo.admissionclass WHERE feerate.categoryId='"+catId+"' and studentinfo.studentid='"+id+"'"; 
				
		return jdbcTemplate.queryForObject(sql, String.class);
	}
	
	
	
}
