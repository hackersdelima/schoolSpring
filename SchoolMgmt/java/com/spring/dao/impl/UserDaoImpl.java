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
import com.spring.extras.Generator;
import com.spring.model.BranchModel;
import com.spring.model.UserModel;

/**
 * @author Sunil
 *
 */
@Repository
public class UserDaoImpl implements UserDao {

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Autowired
	private void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);

	}

	public boolean verifyUser(UserModel user) {

		boolean userexists = false;

		String sql = "SELECT COUNT(*) FROM usertbl WHERE username='" + user.getUsername() + "' AND password='"
				+ user.getPassword() + "' and staffCode='" + user.getStaffCode() + "'";
		System.out.println(sql);
		System.out.println(jdbcTemplate + "jdnds");
		int rowcount = jdbcTemplate.queryForObject(sql, Integer.class);
		if (rowcount == 1) {
			userexists = true;
		}
		return userexists;

	}

	public UserModel getUserDetails(UserModel user) {
		String sql = "SELECT * FROM usertbl join branchtbl using(branchId) WHERE usertbl.username='" + user.getUsername() + "' AND usertbl.password='"
				+ user.getPassword() + "' and usertbl.staffCode='" + user.getStaffCode() + "'";
		return jdbcTemplate.queryForObject(sql, new UserMapper());
	}

	public UserModel getSpecificUserDetails(String userid) {
		String sql = "SELECT * FROM usertbl WHERE userid = '" + userid + "'";
		return jdbcTemplate.queryForObject(sql, new UserMapper());
	}

	public boolean insertUser(UserModel u) {
		Generator g = new Generator();
		String functionAllowed = g.addHash(u.getFunctionAllowed());
		u.setFunctionAllowed(functionAllowed);
		String query = "insert into usertbl(username,password,givenrole,fullName,post,staffCode,startDate,endDate,branchCode,functionAllowed,functionRestriction,branchAllowed,additionalFunctions) values('"
				+ u.getUsername() + "','" + u.getUsername() + "','" + u.getGivenrole() + "','" + u.getFullName() + "','"
				+ u.getPost() + "','" + u.getStaffCode() + "','" + u.getStartDate() + "','" + u.getEndDate() + "','"
				+ u.getBranch().getBranchId() + "','" + u.getFunctionAllowed() + "','" + u.getFunctionRestriction()
				+ "','" + u.getBranchAllowed() + "','" + u.getAdditionalFunctions() + "')";
		int status = jdbcTemplate.update(query);
		if (status > 0) {
			return true;
		} else {
			return false;
		}
	}

	public int updateUser(UserModel u){
		String sql = "update usertbl set username='"+u.getUsername()+"', givenrole='"+u.getGivenrole()+"',fullName='"+u.getFullName()+"',post='"+u.getPost()+"',staffCode='"+u.getStaffCode()+"',startDate='"+u.getStartDate()+"',endDate='"+u.getEndDate()+"',branchCode='"+u.getBranch().getBranchId()+"',functionAllowed='"+u.getFunctionAllowed()+"',branchAllowed='"+u.getBranchAllowed()+"',additionalFunctions='"+u.getAdditionalFunctions()+"' where userid='"+u.getUserid()+"'";
		System.out.println(sql);
		return jdbcTemplate.update(sql);
	}
	public static final class UserMapper implements RowMapper<UserModel> {

		@Override
		public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserModel user = new UserModel();
			BranchModel branch = new BranchModel();
			user.setStaffCode(rs.getString("staffCode"));
			user.setUserid(rs.getString("userid"));
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			user.setStatus(rs.getString("status"));
			user.setGivenrole(rs.getString("givenrole"));
			user.setFullName(rs.getString("fullName"));
			user.setPost(rs.getString("post"));
			user.setStartDate(rs.getString("startDate"));
			user.setEndDate(rs.getString("endDate"));
			user.setRoleName(rs.getString("roleName"));
			user.setFunctionAllowed(rs.getString("functionAllowed"));
			user.setFunctionRestriction(rs.getString("functionRestriction"));
			user.setBranchAllowed(rs.getString("branchAllowed"));
			user.setAdditionalFunctions(rs.getString("additionalFunctions"));
			user.setBranchAllowedFunctions(rs.getString("branchAllowedFunctions"));

			branch.setBranchId(rs.getString("branchId"));
			branch.setCompanyId(rs.getString("companyId"));
			user.setBranch(branch);

			return user;
		}

	}

	public List<UserModel> getUsers() {
		String sql = "SELECT * FROM usertbl join branchtbl using(branchId)";
		return jdbcTemplate.query(sql, new UserMapper());
	}

}
