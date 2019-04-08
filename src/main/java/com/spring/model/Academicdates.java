package com.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="academidates")
public class Academicdates {
	@Id
	@GeneratedValue
	 private int id;
	
	@Column(unique=true)
	private String academicdate;
	private String academicdateen;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAcademicdate() {
		return academicdate;
	}
	public void setAcademicdate(String academicdate) {
		this.academicdate = academicdate;
	}
	public String getAcademicdateen() {
		return academicdateen;
	}
	public void setAcademicdateen(String academicdateen) {
		this.academicdateen = academicdateen;
	}
}

