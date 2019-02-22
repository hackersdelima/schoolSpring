package com.spring.dao.impl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dao.UploadDao;

@Repository
public class UploadDaoImpl implements UploadDao {

	@Override
	public void upload(String fileLocation, String saveFileName, MultipartFile file) {

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
		} catch (IOException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		
	}

	

}
