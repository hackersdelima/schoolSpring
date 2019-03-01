package com.spring.model;

import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="GENERALDETAILS")
public class Generaldetails {
	
	@Id
	@Column(name="general_details_id")
	private int id;
	
	private String name;
	private String title;
	private String address;
	private BigInteger phone;
	private String email;
	
	private String academicdate;
	
	private String academicdateen;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public BigInteger getPhone() {
		return phone;
	}
	public void setPhone(BigInteger phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
