package com.spring.model;

public class ConsolidateReportModel {
	private ExamSummaryReportModel examSummaryReportModel;
	private StudentModel studentModel;
	
	public ExamSummaryReportModel getExamSummaryReportModel() {
		return examSummaryReportModel;
	}
	public void setExamSummaryReportModel(ExamSummaryReportModel examSummaryReportModel) {
		this.examSummaryReportModel = examSummaryReportModel;
	}
	public StudentModel getStudentModel() {
		return studentModel;
	}
	public void setStudentModel(StudentModel studentModel) {
		this.studentModel = studentModel;
	}
	@Override
	public String toString() {
		return "ConsolidateReportModel [examSummaryReportModel=" + examSummaryReportModel + ", studentModel="
				+ studentModel + "]";
	}
	
	
	
	

}
