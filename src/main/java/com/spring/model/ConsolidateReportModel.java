package com.spring.model;

import com.spring.dao.impl.StudentDaoImpl.Exam;

public class ConsolidateReportModel {
	private Subjects subjects;
	private double consolidate_prmarks;
	private double consolidate_thmarks;
	private String consolidate_prgrade;
	private String consolidate_thgrade;
	
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
	public Subjects getSubjects() {
		return subjects;
	}
	public void setSubjects(Subjects subjects) {
		this.subjects = subjects;
	}
	@Override
	public String toString() {
		return "ConsolidateReportModel [subjects=" + subjects + ", consolidate_prmarks=" + consolidate_prmarks
				+ ", consolidate_thmarks=" + consolidate_thmarks + ", consolidate_prgrade=" + consolidate_prgrade
				+ ", consolidate_thgrade=" + consolidate_thgrade + "]";
	}
}
