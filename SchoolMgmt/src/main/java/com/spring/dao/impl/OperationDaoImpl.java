package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.spring.dao.OperationDao;
import com.spring.model.ExamModel;
import com.spring.model.ExamTypeModel;
import com.spring.model.FormDetails;
import com.spring.model.Subjects;
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
	public boolean insertTableDetail(String tablename,String columns, String value){
		boolean status=false;
		String sql="INSERT INTO "+tablename+" "+columns+"  VALUES ('"+value+"')";
		System.out.println(sql);
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
	public boolean checkSubCode(String subjectcode){
		String sql="select count(subjectCode) from subjectlist where subjectCode='"+subjectcode+"'";
		int rowcount=jdbcTemplate.queryForObject(sql, Integer.class);
		if(rowcount==1){
			return true;
		}
		return false;
		
	}
	public List<ExamModel> getExamList(){
		 String sql="SELECT * FROM exam JOIN exam_type USING(examtypeid)";
			return jdbcTemplate.query(sql, new ExamList());
	}
	public static final class ExamList implements RowMapper<ExamModel>{

		@Override
		public ExamModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			ExamModel e=new ExamModel();
			ExamTypeModel em=new ExamTypeModel();
			e.setExamcode(rs.getString("examcode"));
			e.setExamid(rs.getString("examid"));
			e.setExamname(rs.getString("examname"));
			e.setStartdate(rs.getString("startdate"));
			em.setExamtypeid(rs.getString("examtypeid"));
			em.setExamtypename(rs.getString("examtypename"));
			em.setDescription(rs.getString("description"));
			e.setExamTypeModel(em);
			return e;
		}
		
	}
	 public List<FormDetails> getSubjectList(){
		 String sql="SELECT * FROM subjectlist";
			return jdbcTemplate.query(sql, new SubjectList());
	 }
	 public static final class SubjectList implements RowMapper<FormDetails>{
			@Override
			public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormDetails form=new FormDetails();
				Subjects sub=new Subjects();
				form.setSubjectid(rs.getString("subjectid"));
				form.setSubjectname(rs.getString("subjectname"));
				form.setSubjecttype(rs.getString("subjecttype"));
				form.setSubjectCode(rs.getString("subjectCode"));
			sub.setFullmarks(rs.getString("fullmarks"));
			sub.setPassmarks(rs.getString("passmarks"));
			sub.setFullmarks_pr(rs.getString("fullmarks_pr"));
			sub.setPassmarks_pr(rs.getString("passmarks_pr"));
			form.setSubjects(sub);
				
				return form;
			}
	 }
	
	

}
