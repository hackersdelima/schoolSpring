package com.spring.dao;

import org.springframework.web.multipart.MultipartFile;

public interface UploadDao {

	void upload(String fileLocation, String saveFileName, MultipartFile file);

}
