package com.spring.model;

import java.util.List;

public class Subjects {
private String subjectid, subjectname, subjecttype, subjectcode, classid, sectionid, studentid, subjecttypeid, thmarks, prmarks, totalmarks,examtype,totalgrade,remarks,fullmarks, passmarks, fullmarks_pr, passmarks_pr;
private List<String> subjectidlist, subjecttypelist,fullmarkslist, fullmarks_prlist, passmarkslist, passmarks_prlist, thmarkslist, prmarkslist, totalgradelist, remarkslist ;
public List<String> getSubjecttypelist() {
	return subjecttypelist;
}

public void setSubjecttypelist(List<String> subjecttypelist) {
	this.subjecttypelist = subjecttypelist;
}

public List<String> getFullmarkslist() {
	return fullmarkslist;
}

public void setFullmarkslist(List<String> fullmarkslist) {
	this.fullmarkslist = fullmarkslist;
}

public List<String> getFullmarks_prlist() {
	return fullmarks_prlist;
}

public void setFullmarks_prlist(List<String> fullmarks_prlist) {
	this.fullmarks_prlist = fullmarks_prlist;
}

public List<String> getPassmarkslist() {
	return passmarkslist;
}

public void setPassmarkslist(List<String> passmarkslist) {
	this.passmarkslist = passmarkslist;
}

public List<String> getPassmarks_prlist() {
	return passmarks_prlist;
}

public void setPassmarks_prlist(List<String> passmarks_prlist) {
	this.passmarks_prlist = passmarks_prlist;
}

public List<String> getThmarkslist() {
	return thmarkslist;
}

public void setThmarkslist(List<String> thmarkslist) {
	this.thmarkslist = thmarkslist;
}

public List<String> getPrmarkslist() {
	return prmarkslist;
}

public void setPrmarkslist(List<String> prmarkslist) {
	this.prmarkslist = prmarkslist;
}

public List<String> getTotalgradelist() {
	return totalgradelist;
}

public void setTotalgradelist(List<String> totalgradelist) {
	this.totalgradelist = totalgradelist;
}

public List<String> getRemarkslist() {
	return remarkslist;
}

public void setRemarkslist(List<String> remarkslist) {
	this.remarkslist = remarkslist;
}

public List<String> getSubjectidlist() {
	return subjectidlist;
}

public void setSubjectidlist(List<String> subjectidlist) {
	this.subjectidlist = subjectidlist;
}

public String getFullmarks() {
	return fullmarks;
}

public void setFullmarks(String fullmarks) {
	this.fullmarks = fullmarks;
}

public String getPassmarks() {
	return passmarks;
}

public void setPassmarks(String passmarks) {
	this.passmarks = passmarks;
}

public String getFullmarks_pr() {
	return fullmarks_pr;
}

public void setFullmarks_pr(String fullmarks_pr) {
	this.fullmarks_pr = fullmarks_pr;
}

public String getPassmarks_pr() {
	return passmarks_pr;
}

public void setPassmarks_pr(String passmarks_pr) {
	this.passmarks_pr = passmarks_pr;
}

public String getRemarks() {
	return remarks;
}

public void setRemarks(String remarks) {
	this.remarks = remarks;
}

public String getTotalgrade() {
	return totalgrade;
}

public void setTotalgrade(String totalgrade) {
	this.totalgrade = totalgrade;
}

public String getExamtype() {
	return examtype;
}

public void setExamtype(String examtype) {
	this.examtype = examtype;
}

public String getClassid() {
	return classid;
}

public void setClassid(String classid) {
	this.classid = classid;
}

public String getSectionid() {
	return sectionid;
}

public void setSectionid(String sectionid) {
	this.sectionid = sectionid;
}

public String getStudentid() {
	return studentid;
}

public void setStudentid(String studentid) {
	this.studentid = studentid;
}

public String getSubjecttypeid() {
	return subjecttypeid;
}

public void setSubjecttypeid(String subjecttypeid) {
	this.subjecttypeid = subjecttypeid;
}

public String getThmarks() {
	return thmarks;
}

public void setThmarks(String thmarks) {
	this.thmarks = thmarks;
}

public String getPrmarks() {
	return prmarks;
}

public void setPrmarks(String prmarks) {
	this.prmarks = prmarks;
}

public String getTotalmarks() {
	return totalmarks;
}

public void setTotalmarks(String totalmarks) {
	this.totalmarks = totalmarks;
}

public String getSubjectcode() {
	return subjectcode;
}

public void setSubjectcode(String subjectcode) {
	this.subjectcode = subjectcode;
}

public String getSubjecttype() {
	return subjecttype;
}

public void setSubjecttype(String subjecttype) {
	this.subjecttype = subjecttype;
}

public String getSubjectid() {
	return subjectid;
}

public void setSubjectid(String subjectid) {
	this.subjectid = subjectid;
}

public String getSubjectname() {
	return subjectname;
}

public void setSubjectname(String subjectname) {
	this.subjectname = subjectname;
}

@Override
public String toString() {
	return "Subjects [subjectid=" + subjectid + ", subjectname=" + subjectname + ", subjecttype=" + subjecttype
			+ ", subjectcode=" + subjectcode + ", classid=" + classid + ", sectionid=" + sectionid + ", studentid="
			+ studentid + ", subjecttypeid=" + subjecttypeid + ", thmarks=" + thmarks + ", prmarks=" + prmarks
			+ ", totalmarks=" + totalmarks + ", examtype=" + examtype + ", totalgrade=" + totalgrade + ", remarks="
			+ remarks + ", fullmarks=" + fullmarks + ", passmarks=" + passmarks + ", fullmarks_pr=" + fullmarks_pr
			+ ", passmarks_pr=" + passmarks_pr + ", subjectidlist=" + subjectidlist + ", subjecttypelist="
			+ subjecttypelist + ", fullmarkslist=" + fullmarkslist + ", fullmarks_prlist=" + fullmarks_prlist
			+ ", passmarkslist=" + passmarkslist + ", passmarks_prlist=" + passmarks_prlist + ", thmarkslist="
			+ thmarkslist + ", prmarkslist=" + prmarkslist + ", totalgradelist=" + totalgradelist + ", remarkslist="
			+ remarkslist + "]";
}



}
