package com.spring.model;

public class DynamicData {
	private String id, logourl,reporturl;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLogourl() {
		return logourl;
	}

	public void setLogourl(String logourl) {
		this.logourl = logourl;
	}

	public String getReporturl() {
		return reporturl;
	}

	public void setReporturl(String reporturl) {
		this.reporturl = reporturl;
	}

	@Override
	public String toString() {
		return "DynamicData [id=" + id + ", logourl=" + logourl + ", reporturl=" + reporturl + "]";
	}

}
