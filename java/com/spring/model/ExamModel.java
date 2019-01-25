package com.spring.model;

import java.util.List;

public class ExamModel {
	private String examid, examname,examcode, examtype,startdate, studentid,subjectid,companydb,classid,settings_id, type, description, totalmarks;
	
	private List<String> studentidlist;
	private ExamTypeModel examTypeModel;
	private Subjects subjects;
	
	

	public List<String> getStudentidlist() {
		return studentidlist;
	}

	public void setStudentidlist(List<String> studentidlist) {
		this.studentidlist = studentidlist;
	}

	public String getTotalmarks() {
		return totalmarks;
	}

	public void setTotalmarks(String totalmarks) {
		this.totalmarks = totalmarks;
	}

	public String getExamid() {
		return examid;
	}

	public void setExamid(String examid) {
		this.examid = examid;
	}

	
	
	public Subjects getSubjects() {
		return subjects;
	}

	public void setSubjects(Subjects subjects) {
		this.subjects = subjects;
	}

	public StudentModel getStudentModel() {
		return studentModel;
	}

	public void setStudentModel(StudentModel studentModel) {
		this.studentModel = studentModel;
	}

	private StudentModel studentModel;
	

	public ExamTypeModel getExamTypeModel() {
		return examTypeModel;
	}

	public void setExamTypeModel(ExamTypeModel examTypeModel) {
		this.examTypeModel = examTypeModel;
	}

	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}

	public String getExamcode() {
		return examcode;
	}

	public void setExamcode(String examcode) {
		this.examcode = examcode;
	}

	public String getExamtype() {
		return examtype;
	}

	public void setExamtype(String examtype) {
		this.examtype = examtype;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public String getSubjectid() {
		return subjectid;
	}

	public void setSubjectid(String subjectid) {
		this.subjectid = subjectid;
	}

	public String getCompanydb() {
		return companydb;
	}

	public void setCompanydb(String companydb) {
		this.companydb = companydb;
	}

	public String getClassid() {
		return classid;
	}

	public void setClassid(String classid) {
		this.classid = classid;
	}

	public String getSettings_id() {
		return settings_id;
	}

	public void setSettings_id(String settings_id) {
		this.settings_id = settings_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "ExamModel [examid=" + examid + ", examname=" + examname + ", examcode=" + examcode + ", examtype="
				+ examtype + ", startdate=" + startdate + ", studentid=" + studentid + ", subjectid=" + subjectid
				+ ", companydb=" + companydb + ", classid=" + classid + ", settings_id=" + settings_id + ", type="
				+ type + ", description=" + description + ", examTypeModel=" + examTypeModel + ", subjects=" + subjects
				+ ", studentModel=" + studentModel + "]";
	}
	
}
