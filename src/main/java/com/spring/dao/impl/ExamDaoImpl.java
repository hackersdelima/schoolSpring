package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.dao.ExamDao;
import com.spring.dao.OperationDao;
import com.spring.model.ConsolidateReportModel;
import com.spring.model.ExamModel;
import com.spring.model.ExamSummaryReportModel;
import com.spring.model.ExamTypeModel;
import com.spring.model.GradeModel;
import com.spring.model.StudentModel;
import com.spring.model.Subjects;

@Repository
public class ExamDaoImpl implements ExamDao {
	@Autowired
	OperationDao operationDao;

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Autowired
	private void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);

	}

	public boolean addMarks(ExamModel exam, String studentid, int i) {
		String tablename = "exam_marks_tbl";
		String columns = "(studentid,examid,subjectid,prmarks,thmarks,totalgrade,remarks,inputDate, fullmarks, passmarks,totalmarks, fullmarks_pr, passmarks_pr)";
		String value = studentid + "','" + exam.getExamid() + "','" + exam.getSubjects().getSubjectid()
				+ "','" + exam.getSubjects().getPrmarkslist().get(i) + "','"
				+ exam.getSubjects().getThmarkslist().get(i) + "','" + exam.getSubjects().getTotalgradelist().get(i)
				+ "','" + exam.getSubjects().getRemarkslist().get(i) + "',NOW()," + "'"
				+ exam.getSubjects().getFullmarkslist().get(i) + "','" + exam.getSubjects().getPassmarkslist().get(i)
				+ "','" + exam.getSubjects().getTotalmarks() + "','" + exam.getSubjects().getFullmarks_prlist().get(i)
				+ "','" + exam.getSubjects().getPassmarks_prlist().get(i);
		System.out.println(value);
		return insertTableDetail(tablename, columns, value);
	}
	
	public boolean addMarks(ExamModel exam, int i) {
		String tablename = "exam_marks_tbl";
		String columns = "(studentid,examid,subjectid,prmarks,thmarks,totalgrade,remarks,input_datetime, fullmarks, passmarks,totalmarks, fullmarks_pr, passmarks_pr)";
		String value = exam.getStudentidlist().get(i) + "','" + exam.getExamid() + "','" + exam.getSubjects().getSubjectid()
				+ "','" + exam.getSubjects().getPrmarkslist().get(i) + "','"
				+ exam.getSubjects().getThmarkslist().get(i) + "','" + exam.getSubjects().getTotalgradelist().get(i)
				+ "','" + exam.getSubjects().getRemarkslist().get(i) + "',NOW() ," + "'"
				+ exam.getSubjects().getFullmarkslist().get(i) + "','" + exam.getSubjects().getPassmarkslist().get(i)
				+ "','" + exam.getSubjects().getTotalmarks() + "','" + exam.getSubjects().getFullmarks_prlist().get(i)
				+ "','" + exam.getSubjects().getPassmarks_prlist().get(i);
		System.out.println(value);
		return insertTableDetail(tablename, columns, value);
	}
	
	public boolean addMissingMarks(ExamModel exam, int i) {
		String tablename = "exam_marks_tbl";
		
		
		String prmarks=exam.getSubjects().getPrmarkslist().get(i);
		String thmarklist=exam.getSubjects().getThmarkslist().get(i);
		String totalgradelist=exam.getSubjects().getTotalgradelist().get(i);
		String remarkslist=exam.getSubjects().getRemarkslist().get(i);
		String fullmarkslist=exam.getSubjects().getFullmarkslist().get(i);
		String passmarkslist=exam.getSubjects().getPassmarkslist().get(i);
		String fullprlist=exam.getSubjects().getFullmarks_prlist().get(i);
		String passprlist=exam.getSubjects().getPassmarks_prlist().get(i);
		
				
		if(prmarks.isEmpty())
		{
			prmarks="0";
			System.out.println("done");
		}
		
		 if(thmarklist.isEmpty())
		{
			thmarklist="0";
		}
		 if(totalgradelist.isEmpty())
		{
			totalgradelist="0";
		}
		 if(remarkslist.isEmpty())
		{
			remarkslist="0";
		}
		 if(fullmarkslist.isEmpty())
		{
			fullmarkslist="0";
		}
		 if(passmarkslist.isEmpty())
		{
			passmarkslist="0";
		}
		 if(fullprlist.isEmpty())
		{
			fullprlist="0";
		}
		 if(passprlist.isEmpty())
		{
			passprlist="0";
		}
			
		
		
		
		
		
		String columns = "(studentid,examid,subjectid,prmarks,thmarks,totalgrade,remarks,input_datetime, fullmarks, passmarks,totalmarks, fullmarks_pr, passmarks_pr)";
		String value = exam.getStudentidlist().get(i) + "','" + exam.getExamid() + "','" + exam.getSubjects().getSubjectid()
				+ "','" + prmarks + "','"
				+ thmarklist + "','" + totalgradelist
				+ "','" + remarkslist + "', NOW() ," + "'"
				+ fullmarkslist + "','" + passmarkslist
				+ "','" + exam.getSubjects().getTotalmarks() + "','" + fullprlist
				+ "','" + passprlist;
		System.out.println(value);
		return insertTableDetail(tablename, columns, value);
	}
	
	public List<Subjects> getClassSubjects(String gradeid) {
		String query = "select subjectlist.* from coursetbl join subjectlist on coursetbl.subjectid=subjectlist.subjectid where coursetbl.gradeid='"
				+ gradeid + "'";
		return jdbcTemplate.query(query, new ClassSubjects());
	}
	
	public List<Subjects> getSpecificClassSubjects(String gradeid) {
		String query = "select subjectlist.*,classlist.* from coursetbl join subjectlist on coursetbl.subjectid=subjectlist.subjectid join classlist on coursetbl.gradeid=classlist.classid  where classlist.classid='"+ gradeid + "'";
		System.out.println(query);
		return jdbcTemplate.query(query, new ClassSubjects());
	}

	public Subjects getSubjectDetail(String subjectCode) {
		try{
		String query = "select * from subjectlist where subjectid='"
				+ subjectCode + "'";
		System.out.println(query);
		return jdbcTemplate.queryForObject(query, new ClassSubjects());
		}
		catch(Exception e){
			System.out.println(e);
			return null;
			
		}
	}

	public static final class ClassSubjects implements RowMapper<Subjects> {

		@Override
		public Subjects mapRow(ResultSet rs, int rowNum) throws SQLException {
			Subjects s = new Subjects();
			s.setSubjectid(rs.getString("subjectid"));
			s.setSubjectname(rs.getString("subjectname"));
			s.setSubjecttype(rs.getString("subjecttype"));
			s.setSubjectcode(rs.getString("subjectCode"));
			s.setFullmarks(rs.getString("fullmarks"));
			s.setPassmarks(rs.getString("passmarks"));
			s.setFullmarks_pr(rs.getString("fullmarks_pr"));
			s.setPassmarks_pr(rs.getString("passmarks_pr"));

			return s;
		}
	}

	public boolean insertTableDetail(String tablename, String columns, String value) {
		boolean status = false;
		String sql = "INSERT INTO " + tablename + " " + columns + "  VALUES ('" + value + "')";
		System.out.println("query"+sql);
		int i = jdbcTemplate.update(sql);
		if (i > 0) {
			status = true;
		}
		return status;
	}

	public List<ExamModel> specificStudentMarksReport(ExamModel exam, String studentid) {
		String query = "select exam_marks_tbl.*, subjectlist.subjectname, subjectlist.subjecttype, subjectlist.subjectCode from exam_marks_tbl left join subjectlist on exam_marks_tbl.subjectid=subjectlist.subjectid where exam_marks_tbl.studentid = '"
				+ studentid + "' and exam_marks_tbl.examid = '" + exam.getExamid() + "'";
		return jdbcTemplate.query(query, new ExamReport());
	}

	public static final class ExamReport implements RowMapper<ExamModel> {

		@Override
		public ExamModel mapRow(ResultSet rs, int rowNum) throws SQLException {

			ExamModel em = new ExamModel();
			Subjects s = new Subjects();
			em.setExammarksid(rs.getString("exammarksid"));
			s.setPrmarks(rs.getString("prmarks"));
			s.setThmarks(rs.getString("thmarks"));
			s.setTotalmarks(rs.getString("totalmarks"));
			s.setTotalgrade(rs.getString("totalgrade"));
			s.setRemarks(rs.getString("remarks"));
			s.setFullmarks(rs.getString("fullmarks"));
			s.setPassmarks(rs.getString("passmarks"));
			s.setFullmarks_pr(rs.getString("fullmarks_pr"));
			s.setPassmarks_pr(rs.getString("passmarks_pr"));
			s.setSubjectname(rs.getString("subjectname"));
			s.setSubjecttype(rs.getString("subjecttype"));
			s.setSubjectcode(rs.getString("subjectCode"));
			em.setSubjects(s);

			return em;
		}
	}

	public ExamSummaryReportModel specificStudentExamSummary(ExamModel exam, String studentid) {
		
		String query = "select * from exam_summary where examid = '"+exam.getExamid()+"' and studentid = '"+studentid+"'";
		return jdbcTemplate.queryForObject(query, new ExamSummary());
	}

	public static final class ExamSummary implements RowMapper<ExamSummaryReportModel> {

		@Override
		public ExamSummaryReportModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			ExamSummaryReportModel esm = new ExamSummaryReportModel();
			
			esm.setConsolidate_prmarks(rs.getString("consolidate_prmarks"));
			esm.setConsolidate_thmarks(rs.getString("consolidate_thmarks"));
			esm.setObtprmarks(rs.getString("obtprmarks"));
			esm.setObtthmarks(rs.getString("obtthmarks"));
			esm.setTotal(rs.getString("fullmarks"));
			esm.setTotal_obtained(rs.getString("obtfullmarks"));
			esm.setPercentage(rs.getString("percentage"));
			esm.setTotaldays(rs.getString("totaldays"));
			esm.setFinalgrade(rs.getString("finalgrade"));
			esm.setFinalgpa(rs.getString("finalgpa"));
			esm.setFinalresult(rs.getString("finalresult"));
			esm.setPresentdays(rs.getString("presentdays"));
			
			
			return esm;
		}
	}
	public List<StudentModel> getClassStudents(String classid, String sectionname){
		String query="select studentid, studentname, rollno from studentinfo where admissionclass='"+classid+"' and section='"+sectionname+"' order by cast(rollno as unsigned)";
		System.out.println(query);
		return jdbcTemplate.query(query, new StudentMapper());
	}
	public boolean checkStudentSubAvailability(ExamModel exammodel, int i){
		boolean status=false;
		String query="select count(*) from exam_marks_tbl where studentid='"+exammodel.getStudentidlist().get(i)+"' and subjectid='"+exammodel.getSubjects().getSubjectid()+"' and examid='"+exammodel.getExamid()+"'";
			System.out.println(query+"qyer");
		int count=jdbcTemplate.queryForObject(query, Integer.class);
		System.out.println("Count is "+count);
		 if(count>0){
			 status=true;
		 }
		 System.out.println("Status is"+status);
			return status;
	}
	public ExamModel editExam(String examId) {
		String query="select * from exam join exam_type using (examtypeid) where examid='"+examId+"'";
		
		return jdbcTemplate.queryForObject(query, new ExamMapper());
	}

	public static final class ExamMapper implements RowMapper<ExamModel>{

		@Override
		public ExamModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			ExamModel em=new ExamModel();
			
			ExamTypeModel etm=new ExamTypeModel();
			etm.setExamtypeid(rs.getString("examtypeid"));
			etm.setDescription(rs.getString("description"));
			etm.setExamtypename(rs.getString("examtypename"));
			em.setExamTypeModel(etm);
			
			em.setExamcode(rs.getString("examcode"));
			em.setExamname(rs.getString("examname"));
			em.setStartdate(rs.getString("startdate"));
			em.setExamid(rs.getString("examid"));
		
			return em;
		}
		
	}
	public static final class StudentMapper implements RowMapper<StudentModel> {

		@Override
		public StudentModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			StudentModel s=new StudentModel();
			s.setStudentid(rs.getString("studentid"));
			s.setStudentname(rs.getString("studentname"));
			s.setRollno(rs.getString("rollno"));
			return s;
		}
		}

	@Override
	public boolean updateExam(ExamModel emodel, String examId) {
		boolean status=false;
		String query="update exam set examname='"+emodel.getExamname()+"', startdate='"+emodel.getStartdate()+"' where examid='"+examId+"'";
		int result=jdbcTemplate.update(query);
		if(result>0)
		{
			status=true;
		}
		
		return status;
	}

	public boolean deleteExam(String examId) {
		boolean status=false;
		String query="delete from exam where examid='"+examId+"'";
		int result=jdbcTemplate.update(query);
		
		if(result>0)
		{
			status=true;
		}
		return status;
	}

	@Override
	public List<GradeModel> StudentMarksReport() {
		String query = "select exam_marks_tbl.*, subjectlist.subjectname, subjectlist.subjecttype, subjectlist.subjectCode from exam_marks_tbl left join subjectlist on exam_marks_tbl.subjectid=subjectlist.subjectCode ";
		return jdbcTemplate.query(query, new GradeMapper());
		
		
			}
	public static final class GradeMapper implements RowMapper<GradeModel> {

		@Override
		public GradeModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			GradeModel s=new GradeModel();
			s.setExammarksid(rs.getString("exammarksid"));
			s.setPrmarks(rs.getString("prmarks"));
			s.setThmarks(rs.getString("thmarks"));
			s.setTotalmarks(rs.getString("totalmarks"));
			s.setTotalgrade(rs.getString("totalgrade"));
			
			s.setFullmarks(rs.getString("fullmarks"));
			s.setPassmarks(rs.getString("passmarks"));
			s.setFullmarks_pr(rs.getString("fullmarks_pr"));
			s.setPassmarks_pr(rs.getString("passmarks_pr"));
			s.setStudentid(rs.getString("studentid"));
			s.setSubjectid(rs.getString("subjectid"));
			s.setSubjecttype(rs.getString("subjecttype"));
			return s;
		}

		
		}

	@Override
	public boolean updateGradeAndResult(String studentid, String subjectid, String grade,String result,String prgrade,String thgrade,double gpa) {

		boolean status=false;
		String query="update exam_marks_tbl set totalgrade='"+grade+"',result='"+result+"',prmarksgrade='"+prgrade+"',thmarksgrade='"+thgrade+"',gpa='"+gpa+"' where studentid='"+studentid+"' and subjectid='"+subjectid+"'";
		int res=jdbcTemplate.update(query);
		if(res>0)
		{
			status=true;
		}
		
		return status;
	}
	
	@Override
	public boolean updateme(String exammarksid, String grade,String result,String prgrade,String thgrade,double gpa) {

		boolean status=false;
		String query="update exam_marks_tbl set totalgrade='"+grade+"',result='"+result+"',prmarksgrade='"+prgrade+"',thmarksgrade='"+thgrade+"',gpa='"+gpa+"' where exammarksid='"+exammarksid+"'";
		int res=jdbcTemplate.update(query);
		if(res>0)
		{
			status=true;
		}
		
		return status;
	}

	@Override
	public List<GradeModel> resultCheck(int studentid, String examid) {
		String query = "select exam_marks_tbl.*, subjectlist.subjectname, subjectlist.subjecttype, subjectlist.subjectCode from exam_marks_tbl left join subjectlist on exam_marks_tbl.subjectid=subjectlist.subjectCode "
				+ "where studentid='"+studentid+"' and examid='"+examid+"'";
		return jdbcTemplate.query(query, new GradeMapper());
	}

	@Override
	public void studentResult(int studentid, String examid, String res) {
		String sql = "INSERT INTO exam_result(Grade,examid,studentid)  VALUES ('"+res+"','"+examid+"','"+studentid+"')";
		
		jdbcTemplate.update(sql);
		
	}

	@Override
	public String getGrades(String studentid) {
		String query="select Grade from exam_result where studentid='"+studentid+"'";
		System.out.println(query);
		return jdbcTemplate.queryForObject(query, String.class);
	}

	@Override
	public List<ExamModel> getBulkReport(String classname, String section, String examid) {
		String query="";
		if(section.isEmpty()) {
			System.out.println(query);
		 query="select studentid from exam_marks_tbl join studentinfo using (studentid) where studentinfo.admissionclass='"+classname+"' and examid='"+examid+"' group by studentid";
		}
		else {
			
			 query="select studentid from exam_marks_tbl join studentinfo using (studentid) where studentinfo.admissionclass='"+classname+"' and examid='"+examid+"' and section='"+section+"' group by studentid ";
			 System.out.println(query);
		}
		
		return jdbcTemplate.query(query, new StudentidMapper());
	}
	
	public static final class StudentidMapper implements RowMapper<ExamModel> {

		@Override
		public ExamModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			ExamModel s=new ExamModel();
			s.setStudentid(rs.getString("studentid"));
			
			return s;
		}
		}

	@Override
	public boolean isOptionalSubject(String subjectcode) {
	
		String query="select subjecttype from subjectlist where subjectid='"+subjectcode+"'";
		System.out.println(query);
		String result= jdbcTemplate.queryForObject(query, String.class);
		if(result.equalsIgnoreCase("common")) {
			return false;
		}
		return true;
	}

	@Override
	public List<StudentModel> getOptStudents(String subjectcode,String classid,String section) {
		String query="SELECT studentdetail.studentid, studentdetail.studentname,studentdetail.rollno from studentdetail  join optcoursetbl on studentdetail.studentid=optcoursetbl.studentid  join subjectlist on optcoursetbl.subjectid=subjectlist.subjectid where subjectlist.subjectid='"+subjectcode+"' and studentdetail.admissionclass='"+classid+"' and studentdetail.section='"+section+"' order by cast(rollno as unsigned)";
		System.out.println(query);
		return jdbcTemplate.query(query, new StudentMapper());
	}

	@Override
	public int insertStudentPresentDays(int examid, int studentid, int presentdays) {
		String query = "insert into studentattendance (examid, studentid, presentdays) values ("+examid+", "+studentid+","+presentdays+")";
		return jdbcTemplate.update(query);
	}
	public int attendanceInExam(String examid, String totalDays) {
		String sql="insert into attendanceinexam(examid,totalDays) values('"+examid+"','"+totalDays+"')";
		return jdbcTemplate.update(sql);
	}

	@Override
	public void updateMarks(Subjects s, String exammarksid) {
		String query="update exam_marks_tbl set thmarks='"+s.getThmarks()+"', prmarks='"+s.getPrmarks()+"', totalmarks=(thmarks+prmarks), totalgrade=getgrade(round((prmarks+thmarks)/(fullmarks_pr+fullmarks)*100)) where exammarksid='"+exammarksid+"'";
		jdbcTemplate.update(query);
	}
	
	
	
	//---------CONSOLIDATE MARKS
	@Override
	public List<ConsolidateReportModel> getConsolidateReport(int studentid, String academicdate) {
		 String query="select * from consolidatemarks where studentid='"+studentid+"'";
		return jdbcTemplate.query(query, new ConsolidateReportMapper());
	}
	
	

	@Override
	public List<ConsolidateReportModel> getTermReport(int studentid, String academicdate, String examTermId) {
		 String query="select * from consolidatemarks where studentid='"+studentid+"' and examid='"+examTermId+"'";
			return jdbcTemplate.query(query, new ConsolidateReportMapper());
	}

	@Override
	public List<ConsolidateReportModel> getConsolidateTerms(int studentid, String academicdate, int examSize) {
		List<Integer> examlist= Arrays.asList(0,7,10,11,13);
		//List<Integer> examlist= Arrays.asList(7,7,7,7,7);
		String query="select * from (select studentid,subjectid, subjectname, fullmarks, fullmarks_pr,passmarks,passmarks_pr, consolidate_thmarks as term1_thmarks, consolidate_prmarks as term1_prmarks from consolidatemarks where examid="+examlist.get(1)+") as A";
		List<String> list= Arrays.asList("z","A","B","C","D","E");
		
		String addQuery="";
		for(int i=2;i<=examSize;i++) {
			if(i==2) {
				addQuery=" join (select studentid,subjectid, subjectname, consolidate_thmarks as term"+i+"_thmarks, consolidate_prmarks as term"+i+"_prmarks from consolidatemarks where examid="+examlist.get(i)+") as "+list.get(i);
			}
			else {
			addQuery=" using(studentid, subjectid) join (select studentid,subjectid, subjectname, consolidate_thmarks as term"+i+"_thmarks, consolidate_prmarks as term"+i+"_prmarks from consolidatemarks where examid="+examlist.get(i)+") as "+list.get(i);
			} query=query+addQuery;
		 
		}
		query=query+" using(subjectid, studentid) where A.studentid='"+studentid+"'";
		System.out.println(query);
		return jdbcTemplate.query(query, new ConsolidateReportMapper());
	}
	
	public static final class ConsolidateReportMapper implements RowMapper<ConsolidateReportModel> {

		@Override
		public ConsolidateReportModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			ConsolidateReportModel c = new ConsolidateReportModel();
			Subjects s = new Subjects();
			s.setSubjectname(rs.getString("subjectname"));
			s.setFullmarks(rs.getString("fullmarks"));
			s.setFullmarks_pr(rs.getString("fullmarks_pr"));
			s.setPassmarks(rs.getString("passmarks"));
			s.setPassmarks_pr(rs.getString("passmarks_pr"));
			
			
			c.setSubjects(s);
			c.setTerm1_prmarks(rs.getDouble("term1_prmarks"));
			c.setTerm1_thmarks(rs.getDouble("term1_thmarks"));
			c.setTerm2_prmarks(rs.getDouble("term2_prmarks"));
			c.setTerm2_thmarks(rs.getDouble("term2_thmarks"));
			c.setTerm3_prmarks(rs.getDouble("term3_prmarks"));
			c.setTerm3_thmarks(rs.getDouble("term3_thmarks"));
			c.setTerm4_prmarks(rs.getDouble("term4_prmarks"));
			c.setTerm4_thmarks(rs.getDouble("term4_thmarks"));
			
			//c.setExamid(rs.getString("examid"));
			return c;
		}
	}

	@Override
	public List<String> getConsolidateGrade(int studentid) {

		String query="select getgrade(sum(consolidate_thmarks)+sum(consolidate_prmarks)) as grade from consolidatemarks where studentid='"+studentid+"' group by subjectid order by subjectid";
		return jdbcTemplate.queryForList(query, String.class);
	}
	
		
	

	

	

	
}
