package com.spring.model;

public class DynamicData {
	private String id, foldername,reporturl;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getFoldername() {
		return foldername;
	}

	public void setFoldername(String foldername) {
		this.foldername = foldername;
	}

	public String getReporturl() {
		return reporturl;
	}

	public void setReporturl(String reporturl) {
		this.reporturl = reporturl;
	}

	@Override
	public String toString() {
		return "DynamicData [id=" + id + ", foldername=" + foldername + ", reporturl=" + reporturl + "]";
	}

}
