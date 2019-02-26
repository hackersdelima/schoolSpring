package com.spring.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.model.CsvTable;

public interface UploadDao {

	public boolean upload(String fileLocation, String saveFileName, MultipartFile file);
	public boolean uploadcsv(String fileLocation, String tablename, String columns);
	public String getColumnsForCsv(String tablename);
	
	public List<CsvTable> getTableNames();

}
