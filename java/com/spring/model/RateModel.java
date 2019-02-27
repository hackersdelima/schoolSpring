package com.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ratetbl")
public class RateModel {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int rateid;
	
	@Column(name="name")
	private String name;
	
	@Column(name="ratevalue")
	private String ratevalue;

	@Column(name="ratename")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRatevalue() {
		return ratevalue;
	}

	public void setRatevalue(String ratevalue) {
		this.ratevalue = ratevalue;
	}
	
	

}
