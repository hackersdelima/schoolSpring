package com.spring.school;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.dao.CategoryDao;
import com.spring.dao.ClaimBillDao;
import com.spring.dao.StudentDao;
import com.spring.model.ClaimBillModel;
import com.spring.model.StudentModel;
import com.spring.model.UserModel;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimplePdfExporterConfiguration;
import net.sf.jasperreports.view.JasperViewer;

@Controller
@RequestMapping("/claimbill")
@SessionAttributes("claimBill")
public class ClaimBillController {
	
	
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	ClaimBillDao claimBillDao;
	
	@Autowired
	private StudentDao studentDao;
	
	@RequestMapping(value="/studentList")
	public String studentList(Model model){
		List<StudentModel> list = studentDao.getAllStudents();
		model.addAttribute("slist", list);
		return "invoice/claimbill/studentList";
	}
	
	/*@RequestMapping(value="/add/{id}")
	public String viewClaimBill(Model model, @PathVariable String id)
	{	
		model.addAttribute("s",studentDao.getStudentDetail(Integer.parseInt(id)));
		model.addAttribute("details",claimBillDao.getAllDetails(id));
		
		return "invoice/claimbill/claimbill";
	}*/

	
	@RequestMapping(value = "/review")
	public String review(@ModelAttribute ClaimBillModel claimBill, ModelMap model) {
		model.addAttribute("claimBill",claimBill);
	return "invoice/claimbill/claimbill_review";
	}
	
	@RequestMapping(value = "/save")
	@ResponseBody
	public String save(HttpSession session, SessionStatus status) {
		ClaimBillModel claimBill = (ClaimBillModel) session.getAttribute("claimBill");
		UserModel userdetail=(UserModel)session.getAttribute("userDetail");
		System.out.println(userdetail.getUsername());
		claimBill.setReceivedby(userdetail.getUsername());
		
		boolean invoiceSaveStatus = claimBillDao.insertClaimBill(claimBill);
		if (invoiceSaveStatus) {
			String maxClaimBillId = claimBillDao.maxClaimBillId();
			claimBill.setClaim_bill_id(maxClaimBillId);

			int size = claimBill.getCategory().getCategoryIdList().size();
			for (int i = 0; i < size; i++) {
				claimBillDao.insertClaimBillContent(claimBill, i);
			}
			status.setComplete();
			return "Data Saved!";
		}
		else{
		status.setComplete();
		return "Data Save Failed!";
		}
	}
	
	@RequestMapping(value = "/cancel")
	@ResponseBody
	public String cancel(@ModelAttribute ClaimBillModel claimBill, SessionStatus status) {
		status.setComplete();
		return "Claim Bill Canceled!";
	}
	
	@RequestMapping(value = "/search/{id}")
	public String search(@PathVariable String id) {

		return "";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/viewClassClaimBill")
	public void viewClassClaimbill(@RequestParam Map<String,String> map,HttpServletResponse response) throws JRException, IOException {
		byte[] bytes=null;
		JasperPrint jasperPrint = null,jasper = null;
		String classid=map.get("classid");
		String section=map.get("sectionname");
		String month=map.get("month");
		 Map<String,Object> parameters=new HashMap<String,Object>();
		List<String> studentlist= studentDao.getStudentId(classid,section);
		
		
		System.out.println(studentlist);
		System.out.println(month+section+classid);
		
		JasperReport jasperReport=JasperCompileManager.compileReport("D://DigiNepal//schoolSpring//SchoolMgmt//reports//claimbill.jrxml");
		//	JasperReport jasperReport=JasperCompileManager.compileReport("/opt/tomcat/webapps/reports/claimbill.jrxml");
		 JasperReport jasperSubReport = JasperCompileManager.compileReport("D://DigiNepal//schoolSpring//SchoolMgmt//reports//studentdetails.jrxml");
		//JasperReport jasperSubReport = JasperCompileManager.compileReport("/opt/tomcat/webapps/reports/studentdetails.jrxml");
		jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JREmptyDataSource());
		  
		
			
			System.out.println(studentlist.size());
			
			List<JasperPrint> jasperPrintList = new ArrayList<JasperPrint>();
			ArrayList<StudentModel> smlist=new ArrayList<StudentModel>();
			
			
			for(int i=0;i<studentlist.size();i++) {
			ArrayList<ClaimBillModel> data=claimBillDao.getAllDetails(studentlist.get(i), month);
			StudentModel sm=studentDao.getStudentDetail(Integer.parseInt(studentlist.get(i)));
			smlist.add(sm);
			
			
			  JRBeanCollectionDataSource ds=new JRBeanCollectionDataSource(data);
			  JRBeanCollectionDataSource subds=new JRBeanCollectionDataSource(smlist);
			  parameters.put("dataSourceParam", subds);
			  parameters.put("subreportparam",jasperSubReport);
			 
			 
			  
			  jasper = JasperFillManager.fillReport(jasperReport, parameters, ds);
			  
			  jasperPrintList.add(jasper);
			  
			  
			 
			   
		}
			JRPdfExporter exporter = new JRPdfExporter();
			
			exporter.setExporterInput(SimpleExporterInput.getInstance(jasperPrintList));
			exporter.setExporterOutput(new SimpleOutputStreamExporterOutput("D://DigiNepal//report.pdf"));
			SimplePdfExporterConfiguration configuration = new SimplePdfExporterConfiguration();
			configuration.setCreatingBatchModeBookmarks(true);
			exporter.setConfiguration(configuration);
			exporter.exportReport();
			
				
			
		
					
			
			
			
			
		/*			ServletOutputStream servletOutputStream = response.getOutputStream();
		//    bytes = JasperRunManager.runReportToPdf(r,parameters, new JREmptyDataSource());
		    response.setContentType("application/pdf");
		    response.setContentLength(b.length);

		    servletOutputStream.write(bytes, 0, bytes.length);
		    servletOutputStream.flush();
		    servletOutputStream.close();*/
		  	
		/*  response.setContentType("application/x-pdf");
		    response.setHeader("Content-disposition", "inline; filename=Report.pdf");

		    final OutputStream outStream = response.getOutputStream();
		    JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);*/
		  
		   
	}

}
