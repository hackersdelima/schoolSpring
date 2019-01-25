package com.spring.model;

public class ExamSummaryReportModel {
	private String studentid, examid, total_obtained, total, percentage, examname, startdate, examtypename, curdate,result;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public String getExamid() {
		return examid;
	}

	public void setExamid(String examid) {
		this.examid = examid;
	}

	public String getTotal_obtained() {
		return total_obtained;
	}

	public void setTotal_obtained(String total_obtained) {
		this.total_obtained = total_obtained;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getPercentage() {
		return percentage;
	}

	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}

	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getExamtypename() {
		return examtypename;
	}

	public void setExamtypename(String examtypename) {
		this.examtypename = examtypename;
	}

	public String getCurdate() {
		return curdate;
	}

	public void setCurdate(String curdate) {
		this.curdate = curdate;
	}

	@Override
	public String toString() {
		return "ExamSummaryReportModel [studentid=" + studentid + ", examid=" + examid + ", total_obtained="
				+ total_obtained + ", total=" + total + ", percentage=" + percentage + ", examname=" + examname
				+ ", startdate=" + startdate + ", examtypename=" + examtypename + ", curdate=" + curdate + "]";
	}
	

}
