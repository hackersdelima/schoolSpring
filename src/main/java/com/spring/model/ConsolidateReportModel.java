package com.spring.model;

import com.spring.dao.impl.StudentDaoImpl.Exam;

public class ConsolidateReportModel {
	private Subjects subjects;
	private double consolidate_prmarks;
	private double consolidate_thmarks;
	private String consolidate_prgrade;
	private String consolidate_thgrade;
	private String examid;
	
	private double term1_thmarks,term1_prmarks,term2_thmarks,term2_prmarks,term3_thmarks,term3_prmarks,term4_prmarks,term4_thmarks;
	private double totalPr;
	private double totalTh;
	private double finalPercentage;
	private String grade,finalGrade;
	
	public String getFinalGrade() {
		return finalGrade;
	}
	public void setFinalGrade(String finalGrade) {
		this.finalGrade = finalGrade;
	}
	public double getFinalPercentage() {
		return finalPercentage;
	}
	public void setFinalPercentage(double finalPercentage) {
		this.finalPercentage = finalPercentage;
	}
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public double getTotalPr() {
		return totalPr;
	}
	public void setTotalPr(double totalPr) {
		this.totalPr = totalPr;
	}
	public double getTotalTh() {
		return totalTh;
	}
	
	public Subjects getSubjects() {
		return subjects;
	}
	public void setSubjects(Subjects subjects) {
		this.subjects = subjects;
	}
	public double getConsolidate_prmarks() {
		return consolidate_prmarks;
	}
	public void setConsolidate_prmarks(double consolidate_prmarks) {
		this.consolidate_prmarks = consolidate_prmarks;
	}
	public double getConsolidate_thmarks() {
		return consolidate_thmarks;
	}
	public void setConsolidate_thmarks(double consolidate_thmarks) {
		this.consolidate_thmarks = consolidate_thmarks;
	}
	public String getConsolidate_prgrade() {
		return consolidate_prgrade;
	}
	public void setConsolidate_prgrade(String consolidate_prgrade) {
		this.consolidate_prgrade = consolidate_prgrade;
	}
	public String getConsolidate_thgrade() {
		return consolidate_thgrade;
	}
	public void setConsolidate_thgrade(String consolidate_thgrade) {
		this.consolidate_thgrade = consolidate_thgrade;
	}
	public String getExamid() {
		return examid;
	}
	public void setExamid(String examid) {
		this.examid = examid;
	}
	public double getTerm1_thmarks() {
		return term1_thmarks;
	}
	public void setTerm1_thmarks(double term1_thmarks) {
		this.term1_thmarks = term1_thmarks;
	}
	public double getTerm1_prmarks() {
		return term1_prmarks;
	}
	public void setTerm1_prmarks(double term1_prmarks) {
		this.term1_prmarks = term1_prmarks;
	}
	public double getTerm2_thmarks() {
		return term2_thmarks;
	}
	public void setTerm2_thmarks(double term2_thmarks) {
		this.term2_thmarks = term2_thmarks;
	}
	public double getTerm2_prmarks() {
		return term2_prmarks;
	}
	public void setTerm2_prmarks(double term2_prmarks) {
		this.term2_prmarks = term2_prmarks;
	}
	public double getTerm3_thmarks() {
		return term3_thmarks;
	}
	public void setTerm3_thmarks(double term3_thmarks) {
		this.term3_thmarks = term3_thmarks;
	}
	public double getTerm3_prmarks() {
		return term3_prmarks;
	}
	public void setTerm3_prmarks(double term3_prmarks) {
		this.term3_prmarks = term3_prmarks;
	}
	public double getTerm4_prmarks() {
		return term4_prmarks;
	}
	public void setTerm4_prmarks(double term4_prmarks) {
		this.term4_prmarks = term4_prmarks;
	}
	public double getTerm4_thmarks() {
		return term4_thmarks;
	}
	public void setTerm4_thmarks(double term4_thmarks) {
		this.term4_thmarks = term4_thmarks;
	}
	public void setTotalTh(double totalTh) {
		this.totalTh = totalTh;
	}
	@Override
	public String toString() {
		return "ConsolidateReportModel [subjects=" + subjects + ", consolidate_prmarks=" + consolidate_prmarks
				+ ", consolidate_thmarks=" + consolidate_thmarks + ", consolidate_prgrade=" + consolidate_prgrade
				+ ", consolidate_thgrade=" + consolidate_thgrade + ", examid=" + examid + ", term1_thmarks="
				+ term1_thmarks + ", term1_prmarks=" + term1_prmarks + ", term2_thmarks=" + term2_thmarks
				+ ", term2_prmarks=" + term2_prmarks + ", term3_thmarks=" + term3_thmarks + ", term3_prmarks="
				+ term3_prmarks + ", term4_prmarks=" + term4_prmarks + ", term4_thmarks=" + term4_thmarks + ", totalPr="
				+ totalPr + ", totalTh=" + totalTh + "]";
	}
		
}
