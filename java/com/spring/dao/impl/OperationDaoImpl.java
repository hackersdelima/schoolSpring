package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.spring.dao.OperationDao;
import com.spring.model.ExamModel;
import com.spring.model.ExamTypeModel;
import com.spring.model.FeeModel;
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
	public List<ExamTypeModel> getExamTypeList(){
		 String sql="SELECT * FROM exam_type";
		 try{
			return jdbcTemplate.query(sql, new ExamTypeList());
		 }
		 catch(Exception e){
			 System.out.println(e);
			 return null;
		 }
	}
	public static final class ExamTypeList implements RowMapper<ExamTypeModel>{

		@Override
		public ExamTypeModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			ExamTypeModel em=new ExamTypeModel();
			em.setExamtypeid(rs.getString("examtypeid"));
			em.setExamtypename(rs.getString("examtypename"));
			em.setDescription(rs.getString("description"));
			return em;
		}
		}
	public List<ExamModel> getExamList(){
		 String sql="select * from exam left join exam_type using(examtypeid)";
		 try{
			return jdbcTemplate.query(sql, new ExamList());
		 }
		 catch(Exception e){
			 System.out.println(e);
			 return null;
		 }
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
	
	 public Map<String,String> getAssignedSubjects(){
		 String query="select subjectlist.subjectname, classlist.classname from coursetbl JOIN subjectlist on coursetbl.subjectid=coursetbl.subjectid join classlist on coursetbl.gradeid=classlist.classid";
		 try{
		 return jdbcTemplate.queryForObject(query, new AssignedSubjectsList());
		 }
		 catch(Exception e){
			 System.out.println(e);
			 return null;
		 }
	 }
	 public boolean editSubject(String id,Subjects sub)
	 {
		 boolean status=false;
		 String query="update subjectlist set subjectname='"+sub.getSubjectname()+"', subjecttype='"+sub.getSubjecttype()+"',subjectCode='"+sub.getSubjectcode()+"', fullmarks='"+sub.getFullmarks()+"',passmarks='"+sub.getPassmarks()+"', fullmarks_pr='"+sub.getFullmarks_pr()+"',passmarks_pr='"+sub.getPassmarks_pr()+"' where subjectid='"+id+"'";
		int res= jdbcTemplate.update(query);
		if(res>0)
		{
			status=true;
		}
		 return status;
		 
	 }
	 public Subjects getSubjectForEdit(String id)
	 {
		 String query="select * from subjectlist where subjectid='"+id+"'";
		 return jdbcTemplate.queryForObject(query, new SubjectMapper());
	 }
	 
	 public static final class SubjectMapper implements RowMapper<Subjects>{

		@Override
		public Subjects mapRow(ResultSet rs, int rowNum) throws SQLException {

			Subjects sub=new Subjects();
			sub.setFullmarks(rs.getString("fullmarks"));
			sub.setPassmarks(rs.getString("passmarks"));
			sub.setFullmarks_pr(rs.getString("fullmarks_pr"));
			sub.setPassmarks_pr(rs.getString("passmarks_pr"));
			sub.setSubjectcode(rs.getString("subjectCode"));
			sub.setSubjectname(rs.getString("subjectname"));
			sub.setSubjecttype(rs.getString("subjecttype"));
			sub.setSubjectid(rs.getString("subjectid"));
			return sub;
		}
		 
	 }
	 
	 public static final class AssignedSubjectsList implements RowMapper< Map<String,String>>{
			@Override
			public  Map<String,String> mapRow(ResultSet rs, int rowNum) throws SQLException {
				HashMap<String, String> map=new HashMap<String, String>();
				map.put(rs.getString("classname"), rs.getString("subjectname"));
				return map;
			}
			}
	 
	 public boolean addFeeSetting(String classname, String category, String feerate) {
			
		 boolean status=false;
		 
		 String query = "insert into feerate(sclass,frate,categoryId) values('" + classname + "','" + feerate + "','"+ category + "')";
			System.out.println("q" + query);
			System.out.println(jdbcTemplate);
			
			
			int i=jdbcTemplate.update(query);
			if(i>0){
				status=true;
			}
			return status;

		}

	@Override
	public void editFeeSetting(String feecode, String classname, String category, String feerate) {

		String query="update feerate set sclass='"+classname+"', categoryId='"+category+"',frate='"+feerate+"' where feecode='"+feecode+"'";
		jdbcTemplate.update(query);
	}

	@Override
	public List<FormDetails> getOptionalSubject() {
		 String sql="SELECT * FROM subjectlist where subjecttype='optional'";
			return jdbcTemplate.query(sql, new SubjectList());
	}

	@Override
	public void assignOptionalSubjects(String optSubId, String studentid) {

		 String sql="insert into optcoursetbl(subjectid,studentid) values('"+optSubId+"','"+studentid+"')";
		 jdbcTemplate.update(sql);
	}

	


	


}
