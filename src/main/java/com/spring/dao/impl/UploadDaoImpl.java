package com.spring.dao.impl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dao.UploadDao;
import com.spring.model.CsvTable;
import com.spring.model.FeeModel;

@Repository
public class UploadDaoImpl implements UploadDao {
	@Autowired
	private DataSource dataSource;
	
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public boolean upload(String fileLocation, String saveFileName, MultipartFile file) {

		File uploadDir = new File(fileLocation);
		//create folder if not exists
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		try {
			BufferedOutputStream outputStream = new BufferedOutputStream(
					new FileOutputStream(new File(fileLocation, saveFileName)));
			outputStream.write(file.getBytes());
			outputStream.flush();
			outputStream.close();
			return true;
		} catch (IOException e) {
			System.out.println(e);
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean uploadcsv(String fileLocation, String tablename, String columns) {
		boolean status=false;
		try {
        	Connection con=null;
        	Statement stmt = null;
        	System.out.println(dataSource);
        	 con = dataSource.getConnection();
 
                String loadQuery = "LOAD DATA LOCAL INFILE '" + fileLocation + "' INTO TABLE "+tablename+" FIELDS TERMINATED BY ','" + " LINES TERMINATED BY '\n' ("+columns+") ";
                System.out.println(loadQuery);
                 stmt = con.createStatement();
              int  rowcount= stmt.executeUpdate(loadQuery);
              if(rowcount>0) {
            	  status= true;
              }
                System.out.println("reached here status:"+status);
                return status;
		}
		catch (Exception e) {
			System.out.println(e);
			return status;
		}
	}

	@Override
	public String getColumnsForCsv(String tablename) {
		String query="select columns from csvuploadtbl where tablename='"+tablename+"'";
		return jdbcTemplate.queryForObject(query, String.class);
		
	}

	@Override
	public List<CsvTable> getTableNames() {
		String query = "select * from csvuploadtbl";
		return jdbcTemplate.query(query, new CsvUploadMapper() );
	}
	
	public static final class CsvUploadMapper implements RowMapper<CsvTable>
	{

		@Override
		public CsvTable mapRow(ResultSet rs, int rowNum) throws SQLException {
			CsvTable c= new CsvTable();
			c.setId(rs.getInt("id"));
			c.setTablename(rs.getString("tablename"));
			c.setColumns(rs.getString("columns"));
			c.setRelatedname(rs.getString("relatedname"));
			return c;
		}
			
		}

	

}
