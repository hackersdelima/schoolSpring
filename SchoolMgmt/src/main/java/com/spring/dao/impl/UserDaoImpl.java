package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.dao.UserDao;
import com.spring.model.UserModel;

/**
 * @author Sunil
 *
 */
@Repository
public class UserDaoImpl implements UserDao{

	private JdbcTemplate jdbcTemplate;
	

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
<<<<<<< HEAD

	@Autowired
=======
	 
	 @Autowired
>>>>>>> branch 'master' of https://github.com/hackersdelima/schoolSpring
	 private void setDataSource(DataSource dataSource)
	 {
		 this.jdbcTemplate=new JdbcTemplate(dataSource);
		 
	 }
<<<<<<< HEAD

	/*@Autowired
	public UserDaoImpl(DataSource dataSource)
	{
		 this.jdbcTemplate=new JdbcTemplate(dataSource);

	}*/
	/*public DataSource getDataSource() {
		return datasource;
	}
	
	public void setDataSource(DataSource datasource) {
		JdbcTemplate jdbc=new JdbcTemplate(datasource);
	}*/

=======
>>>>>>> branch 'master' of https://github.com/hackersdelima/schoolSpring

	public boolean verifyUser(UserModel user)
	{
		
		boolean userexists=false;
		
		String sql="SELECT COUNT(*) FROM USERTBL WHERE USERNAME='"+user.getUsername()+"' AND PASSWORD='"+user.getPassword()+"'";
		System.out.println(sql);
		System.out.println(jdbcTemplate+"jdnds");
		int rowcount= jdbcTemplate.queryForObject(sql, Integer.class);
		if(rowcount==1){
			userexists=true;
		}
		return userexists;
		
		
	}
	public UserModel getUserDetails(UserModel user){
		String sql="SELECT * FROM USERTBL WHERE USERNAME='"+user.getUsername()+"' AND PASSWORD='"+user.getPassword()+"'";
		return jdbcTemplate.queryForObject(sql, new ClassMapper());
	}
	

	public static final class ClassMapper implements RowMapper<UserModel>{

		@Override
		public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserModel user=new UserModel();
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			user.setUserid(rs.getString("userid"));
			user.setStatus(rs.getString("status"));
			
			
			return user;
		}
		
	}


	
}
