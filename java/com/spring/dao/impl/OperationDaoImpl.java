package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.dao.OperationDao;
import com.spring.model.Consolidatemarkssetting;
import com.spring.model.Coursetbl;
import com.spring.model.ExamModel;
import com.spring.model.ExamTypeModel;
import com.spring.model.FormDetails;
import com.spring.model.GeneralDetailsModel;
import com.spring.model.Status;
import com.spring.model.StudentModel;
import com.spring.model.Subjects;
import com.spring.model.UserModel;
import com.spring.service.GeneraldetailsService;
import com.spring.service.StatusService;

@Repository
@Transactional
public class OperationDaoImpl implements OperationDao {
	@Autowired
	StatusService statusService;
	
	@Autowired
	GeneraldetailsService generaldetailsService;
	
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	private SessionFactory sessionFactory;
	 
	 @Autowired
	    public void setSessionFactory(SessionFactory sf) {
	        this.sessionFactory = sf;
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
		String sql="INSERT INTO "+tablename+" "+columns+"  VALUES ("+value+")";
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
		 String sql="select * from exam left join exam_type using(examtypeid)  where academicyear=(select academicdates_id from generaldetails where general_details_id=1);";
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

	@Override
	public List<Coursetbl> coursetbllist() {
		String query = "select gradeid, count(subjectid) as subjectid, classlist.classname from coursetbl join classlist on coursetbl.gradeid=classlist.classid group by gradeid";
		return jdbcTemplate.query(query, new Courselist());
	}
	
	 public static final class Courselist implements RowMapper<Coursetbl>{
			@Override
			public Coursetbl mapRow(ResultSet rs, int rowNum) throws SQLException {
				Coursetbl c= new Coursetbl();
				c.setGradeid(rs.getString("gradeid"));
				c.setSubjectid(rs.getString("subjectid"));
				c.setClassname(rs.getString("classname"));
				return c;
			}
		}
	 
	 public static final class ClassCourselist implements RowMapper<Coursetbl>{
			@Override
			public Coursetbl mapRow(ResultSet rs, int rowNum) throws SQLException {
				Coursetbl c= new Coursetbl();
				c.setGradeid(rs.getString("gradeid"));
			c.setClassname(rs.getString("classname"));
				c.setSubjectname(rs.getString("subjectname"));
				c.setSubjectCode(rs.getString("subjectCode"));
				return c;
			}
		}
	@Override
	public List<Coursetbl> getclasssubjects(String id) {
		String query = "select classlist.classname, subjectlist.subjectname,subjectlist.subjectCode, gradeid from coursetbl join classlist on coursetbl.gradeid=classlist.classid join subjectlist using(subjectid) where gradeid='"+id+"'";
		return jdbcTemplate.query(query, new ClassCourselist());
	}

	@Override
	public List<Coursetbl> fingCourseByStd(String studentid) {
		String query="select subjectid, subjectlist.subjectCode, subjectlist.subjectname from coursetbl join subjectlist using(subjectid) where gradeid in (select admissionclass from studentinfo where studentid="+studentid+") and subjectlist.subjecttype='common' union select subjectid, subjectlist.subjectCode, subjectlist.subjectname from optcoursetbl join subjectlist using(subjectid) where studentid="+studentid+""; 
		return jdbcTemplate.query(query, new StdCourselist());
	}
	public static final class StdCourselist implements RowMapper<Coursetbl>{
		@Override
		public Coursetbl mapRow(ResultSet rs, int rowNum) throws SQLException {
			Coursetbl c= new Coursetbl();
			c.setSubjectname(rs.getString("subjectname"));
			c.setSubjectCode(rs.getString("subjectCode"));
			return c;
		}
	}

	@Override
	public List<Coursetbl> courseliststdcount() {
		String query="select studentinfo.studentid, studentinfo.studentname, studentinfo.rollno, studentinfo.section,classlist.classname, count(subjectid) as subjectid from coursetbl join studentinfo on coursetbl.gradeid=studentinfo.admissionclass join classlist on studentinfo.admissionclass=classlist.classid group by studentid";
		return jdbcTemplate.query(query, new StdCourseCount());
	}
	public static final class StdCourseCount implements RowMapper<Coursetbl>{
		@Override
		public Coursetbl mapRow(ResultSet rs, int rowNum) throws SQLException {
			Coursetbl c= new Coursetbl();
			StudentModel s = new StudentModel();
			c.setClassname(rs.getString("classname"));
			c.setSubjectid(rs.getString("subjectid"));
			c.setStudentid(rs.getString("studentid"));
			s.setStudentname(rs.getString("studentname"));
			s.setRollno(rs.getString("rollno"));
			s.setSection(rs.getString("section"));
			c.setStudentModel(s);
			return c;
		}
	}
	@Override
	public GeneralDetailsModel getGeneralDetails() {
		String sql="select * from generaldetails";
		
		return jdbcTemplate.queryForObject(sql, new detailsMapper());
		
	}
	public static final class detailsMapper implements RowMapper<GeneralDetailsModel>{

		@Override
		public GeneralDetailsModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			GeneralDetailsModel g= new GeneralDetailsModel();
			g.setName(rs.getString("name"));
			g.setTitle(rs.getString("title"));
			g.setAddress(rs.getString("address"));
			g.setEmail(rs.getString("email"));
			g.setSession(rs.getString("session"));
			g.setPhone(rs.getString("phone"));
			return g;
		}
	
	}
	@Override
	public void tablevaluessetup(List<Object> initiallist) {
		Status status = (Status) initiallist.get(0);
		statusService.saveOrUpdate(status);
	}

	@Override
	public void setConsolidate(Consolidatemarkssetting consolidatemarkssetting) {
		Session session =this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(consolidatemarkssetting);
	}

	@Override
	public List<Consolidatemarkssetting> getConsolidatemarkslist() {
		Session session =this.sessionFactory.getCurrentSession();
		List<Consolidatemarkssetting> list = session.createQuery("from Consolidatemarkssetting").list();
		return list;
	}

	@Override
	public Consolidatemarkssetting getConsolidatemarks(Consolidatemarkssetting consolidatemarkssetting) {
		Session session =this.sessionFactory.getCurrentSession();
		int id = consolidatemarkssetting.getExamid();
		Consolidatemarkssetting consolidatemarkssetting1 = (Consolidatemarkssetting)session.get(Consolidatemarkssetting.class, id);
		return consolidatemarkssetting1;
	}
}
