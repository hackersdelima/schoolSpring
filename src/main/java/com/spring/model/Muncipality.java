package com.spring.model;

public class Muncipality {
	private String vdccode, vdcname, wardcount;
	
	public String getWardcount() {
		return wardcount;
	}

	public void setWardcount(String wardcount) {
		this.wardcount = wardcount;
	}

	public String getVdccode() {
		return vdccode;
	}

	public void setVdccode(String vdccode) {
		this.vdccode = vdccode;
	}

	public String getVdcname() {
		return vdcname;
	}

	public void setVdcname(String vdcname) {
		this.vdcname = vdcname;
	}

	@Override
	public String toString() {
		return "Muncipality [vdccode=" + vdccode + ", vdcname=" + vdcname + ", wardcount=" + wardcount + "]";
	}

}
