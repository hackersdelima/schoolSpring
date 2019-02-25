package com.spring.model;

public class CsvTable {
	private int id;
	private String tablename;
	private String columns;
	private String relatedname;
	
	public String getRelatedname() {
		return relatedname;
	}
	public void setRelatedname(String relatedname) {
		this.relatedname = relatedname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	public String getColumns() {
		return columns;
	}
	public void setColumns(String columns) {
		this.columns = columns;
	}
	
	

}
