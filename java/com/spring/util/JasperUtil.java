package com.spring.util;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperPrint;

public class JasperUtil {
	
	public void jasperprintInBrowser(JasperPrint jasper, HttpServletResponse response) {
		try {
		byte[] bytes = JasperExportManager.exportReportToPdf(jasper);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		response.setContentType("application/pdf");
		response.setContentLength(bytes.length);

		servletOutputStream.write(bytes, 0, bytes.length);
		servletOutputStream.flush();
		servletOutputStream.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}

}
