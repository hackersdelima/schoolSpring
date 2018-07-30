package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.spring.dao.ExamDao;
import com.spring.dao.OperationDao;
import com.spring.model.ExamModel;
import com.spring.model.ExamSummaryReportModel;
import com.spring.model.ExamTypeModel;
import com.spring.model.StudentModel;
import com.spring.model.Subjects;

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

	public Subjects getSubjectDetail(String subjectid) {
		try{
		String query = "select * from subjectlist where subjectid='"
				+ subjectid + "'";
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
		String query = "select exam_marks_tbl.*, subjectlist.subjectname, subjectlist.subjecttype, subjectlist.subjectCode from exam_marks_tbl left join subjectlist using(subjectid) where exam_marks_tbl.studentid = '"
				+ studentid + "' and exam_marks_tbl.examid = '" + exam.getExamid() + "'";
		return jdbcTemplate.query(query, new ExamReport());
	}

	public static final class ExamReport implements RowMapper<ExamModel> {

		@Override
		public ExamModel mapRow(ResultSet rs, int rowNum) throws SQLException {

			ExamModel em = new ExamModel();
			Subjects s = new Subjects();
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
			
			esm.setTotal(rs.getString("sum(fullmarks)"));
			esm.setTotal_obtained(rs.getString("sum(totalmarks)"));
			Double per=Double.parseDouble(rs.getString("percentage"));
			String percentage=new DecimalFormat("##.##").format(per);
			esm.setPercentage(percentage);
			esm.setCurdate(rs.getString("curdate"));
			
			return esm;
		}
	}
	public List<StudentModel> getClassStudents(String classname, String sectionname){
		String query="select studentid, studentname, rollno from studentinfo where admissionclass='"+classname+"' and section='"+sectionname+"'";
		System.out.println(query);
		return jdbcTemplate.query(query, new StudentMapper());
	}
	public boolean checkStudentSubAvailability(ExamModel exammodel, int i){
		boolean status=false;
		String query="select count(*) from exam_marks_tbl where studentid='"+exammodel.getStudentidlist().get(i)+"' and subjectid='"+exammodel.getSubjects().getSubjectid()+"'";
	
		int count=jdbcTemplate.queryForObject(query, Integer.class);
		 if(count>0){
			 status=true;
		 }
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

	
}
