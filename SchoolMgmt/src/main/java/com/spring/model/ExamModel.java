package com.spring.model;

public class ExamModel {
	private String examname,examcode, examtype,startdate, studentid,subjectid,companydb,classid,settings_id, type, description;
	private ExamTypeModel examTypeModel;
	

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
}
