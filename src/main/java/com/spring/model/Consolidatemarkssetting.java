package com.spring.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="consolidatemarkssetting")
public class Consolidatemarkssetting {
	
	@Id
	private int examid;
	private double thper;
	private double prper;
	
	public double getThper() {
		return thper;
	}
	public void setThper(double thper) {
		this.thper = thper;
	}
	public double getPrper() {
		return prper;
	}
	public void setPrper(double prper) {
		this.prper = prper;
	}
	public int getExamid() {
		return examid;
	}
	public void setExamid(int examid) {
		this.examid = examid;
	}
	@Override
	public String toString() {
		return "Consolidatemarkssetting [examid=" + examid + ", thper=" + thper + ", prper=" + prper + "]";
	}
}
