package com.spring.school;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dao.UploadDao;
import com.spring.model.CsvTable;

@Controller
@RequestMapping("csv")
public class CsvUploadController {
	@Autowired
	UploadDao uploadDao;
	
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public String form(Model model) {
		List<CsvTable> list = uploadDao.getTableNames();
		model.addAttribute("list", list);
		return "csvupload/form";
	}
	
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	@ResponseBody
	public String upload(HttpServletRequest request, @RequestParam("files") MultipartFile file, @RequestParam("tablename") String tablename) {
		boolean importstatus=false;
		boolean uploadstatus=false;
		String msg="";
		try {
			String fileLocation="D:/";
			String uploadFileName=tablename+".csv";
			uploadstatus=uploadDao.upload(fileLocation, uploadFileName, file);
			System.out.println(uploadstatus);
			if(uploadstatus) {
			
			System.out.println("reached here");
			String columns = uploadDao.getColumnsForCsv(tablename);
			System.out.println(columns);
			importstatus=uploadDao.uploadcsv(fileLocation+uploadFileName, tablename, columns);
			System.out.println(importstatus);
			if(importstatus) {
			msg= "import successful";
			}
			else {
				msg= "import Failed";
			}
			}
			else {
				msg="Import Failed";
			}
		}
		catch (Exception e) {
			System.out.println(e);
			msg= "Import Failed. Exception Found: "+e;
		}
		return msg;
	}

}
