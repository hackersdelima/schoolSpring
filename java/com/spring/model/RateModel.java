package com.spring.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name="ratetbl")
public class RateModel {
	
	@Id
	private int rateid;
	
	@Column(name="name")
	private String name;
	
	@Column(name="ratevalue")
	private String ratevalue;
	
	@UpdateTimestamp
	private Date lastUpdatedDate;
	
	@CreationTimestamp
	private Date createDate;
	
	
	
	
	
	
	public Date getLastUpdatedDate() {
		return lastUpdatedDate;
	}

	public void setLastUpdatedDate(Date lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

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

	public int getRateid() {
		return rateid;
	}

	public void setRateid(int rateid) {
		this.rateid = rateid;
	}

	@Override
	public String toString() {
		return "RateModel [rateid=" + rateid + ", name=" + name + ", ratevalue=" + ratevalue + "]";
	}
	
	
	
	
	

}
