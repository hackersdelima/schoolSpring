package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.spring.dao.StaffDao;
import com.spring.model.StaffModel;

public class StaffDaoImpl implements StaffDao{
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Autowired
	private void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);

	}
	public boolean insertStaff(StaffModel s){
		boolean status=false;
		String sql = "insert into staff_tbl (staffName, staffAddress, post, branchCode) values('"+s.getStaffName()+"','"+s.getStaffAddress()+"','"+s.getPost()+"','"+s.getBranchCode()+"')";
		int i=jdbcTemplate.update(sql);
		if(i>0){
			status=true;
		}
		return status;
	}
	public boolean updateStaff(StaffModel s){
		boolean status=false;
		String sql = "update staff_tbl set staffName='"+s.getStaffName()+"', staffAddress='"+s.getStaffAddress()+"', post='"+s.getPost()+"', branchCode='"+s.getBranchCode()+"' where staffCode='"+s.getStaffCode()+"'";
		int i=jdbcTemplate.update(sql);
		if(i>0){
			status=true;
		}
		return status;
	}
	public boolean deleteStaff(String id){
		boolean status=false;
		String sql = "delete from staff_tbl where staffCode='"+id+"'";
		int i=jdbcTemplate.update(sql);
		if(i>0){
			status=true;
		}
		return status;
	}
	public List<StaffModel> listStaffs(){
		String sql = "select * from staff_tbl";
		return jdbcTemplate.query(sql, new StaffMapper());
	}
	public StaffModel recentlyInsertedStaff(){
		String sql = "select * from staff_tbl where staffCode = (SELECT max(staffCode) from staff_tbl)";
		return jdbcTemplate.queryForObject(sql, new StaffMapper());
	}
	public StaffModel staffDetail(int id){
		String sql = "select * from staff_tbl where staffCode = '"+id+"'";
		return jdbcTemplate.queryForObject(sql, new StaffMapper());
	}
	public static final class StaffMapper implements RowMapper<StaffModel>{

		@Override
		public StaffModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			StaffModel s = new StaffModel();
			s.setStaffCode(rs.getString("staffCode"));
			s.setStaffName(rs.getString("staffName"));
			s.setStaffAddress(rs.getString("staffAddress"));
			s.setPost(rs.getString("post"));
			s.setBranchCode(rs.getString("branchCode"));
			return s;
		}
		
	}

}
