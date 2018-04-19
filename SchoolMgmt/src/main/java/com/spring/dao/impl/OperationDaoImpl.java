package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.spring.dao.OperationDao;
import com.spring.model.UserModel;

public class OperationDaoImpl implements OperationDao {
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Autowired
	private void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);

	}

	public List<UserModel> getSystemDetails() {
		String sql = "select * from generalsettings";
		return jdbcTemplate.query(sql, new SystemDetailMapper());
	}
	public boolean updateGeneralSetting(UserModel user){
		boolean status=false;
		String sql="update generalsettings set description='"+user.getSettingsdescription()+"' where type='"+user.getSettingstype()+"'";
		int i=jdbcTemplate.update(sql);
		if(i>0){
			status=true;
		}
		return status;
	}
	public boolean insertInitialDetail(String tablename,String columns, String value){
		boolean status=false;
		String sql="INSERT INTO "+tablename+" "+columns+"  VALUES ('"+value+"')";
		int i=jdbcTemplate.update(sql);
		if(i>0){
			status=true;
		}
		
		return status;
	}
	public final static class SystemDetailMapper implements RowMapper<UserModel> {

		@Override
		public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserModel user = new UserModel();
			user.setSettingsid(rs.getString("settings_id"));
			user.setSettingstype(rs.getString("type"));
			user.setSettingsdescription(rs.getString("description"));
			return user;
		}
	}
	

}
