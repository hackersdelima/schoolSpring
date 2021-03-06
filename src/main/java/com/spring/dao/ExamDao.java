package com.spring.dao;

import java.util.List;

import com.spring.model.ConsolidateReportModel;
import com.spring.model.ExamModel;
import com.spring.model.ExamSummaryReportModel;
import com.spring.model.GradeModel;
import com.spring.model.StudentModel;
import com.spring.model.Subjects;

public interface ExamDao {
	public List<Subjects> getClassSubjects(String gradeid);
	public List<Subjects> getSpecificClassSubjects(String gradeid);
	public Subjects getSubjectDetail(String gradeid);
	
	public boolean addMarks(ExamModel exam, String studentid, int i);
	
	public boolean addMarks(ExamModel exam, int i);
	public boolean addMissingMarks(ExamModel exam, int i);
	 public boolean insertTableDetail(String tablename,String columns, String value);
	 
	public List<ExamModel> specificStudentMarksReport(ExamModel exam, String studentid);
	
	public ExamSummaryReportModel specificStudentExamSummary(ExamModel exam, String studentid);
	public List<StudentModel> getClassStudents(String classid, String sectionname);
	public boolean checkStudentSubAvailability(ExamModel exammodel, int i);
	public ExamModel editExam(String examId);
	public boolean updateExam(ExamModel emodel, String examId);
	public boolean deleteExam(String examId);
	public List<GradeModel> StudentMarksReport();
	public boolean updateGradeAndResult(String studentid, String subjectid, String grade,String result,String prgrade,String thgrade, double gpa);
	public List<GradeModel> resultCheck(int studentid, String examid);
	public void studentResult(int studentid, String examid, String string);
	public String getGrades(String studentid);
	public List<ExamModel> getBulkReport(String classname, String section, String examid);
	public boolean isOptionalSubject(String subjectcode);
	public List<StudentModel> getOptStudents(String subjectcode,String classid,String section);
	public boolean updateme(String exammarksid, String grade,String result,String prgrade,String thgrade,double gpa);
	public int attendanceInExam(String examid, String totalDays);

	public int insertStudentPresentDays(int examid, int studentid, int presentdays);
	public void updateMarks(Subjects s, String exammarksid);
	
	
	//--------CONSOLIDATE MARKS
	public List<ConsolidateReportModel> getConsolidateReport(int studentid, String academicdate);
	public List<ConsolidateReportModel> getTermReport(int studentid, String academicdate, String examTermId);
	public List<ConsolidateReportModel> getConsolidateTerms(int studentid, String academicdate, int examSize);
	public List<String> getConsolidateGrade(int studentid);

}
