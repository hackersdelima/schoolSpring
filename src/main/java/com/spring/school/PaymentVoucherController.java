package com.spring.school;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.dao.InitialDetailsDao;
import com.spring.dao.OperationDao;
import com.spring.dao.PaymentVoucherDao;
import com.spring.exceptions.DataNotFoundException;
import com.spring.model.DynamicData;
import com.spring.model.GeneralDetailsModel;
import com.spring.model.PaymentVoucherAccountSingle;
import com.spring.model.PaymentVoucherModel;
import com.spring.util.Utilities;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

@Controller
@SessionAttributes("paymentVoucher")
@RequestMapping(value = "paymentVoucher")
public class PaymentVoucherController {
	@Autowired
	PaymentVoucherDao paymentVoucherDao;
	@Autowired
	 DataSource dataSource;
	@Autowired
	OperationDao operationDao;
	
	@Autowired
	InitialDetailsDao initialDetailsDao;
	
	


	@RequestMapping(value = "/add")
	@ResponseBody
	public String add(HttpSession session, SessionStatus status) {
		PaymentVoucherModel paymentVoucher = (PaymentVoucherModel) session.getAttribute("paymentVoucher");
		int maxId = paymentVoucherDao.add(paymentVoucher);
		if (maxId != 0) {
			for (int i = 0; i < paymentVoucher.getPaymentVoucherAccount().getAccountNo().size(); i++) {
				System.out.println("SUccess");
				paymentVoucherDao.addPaymentVoucherAccount(i, maxId, paymentVoucher);
			}
			status.setComplete();
			return "Save Successful!";
		}
		status.setComplete();
		return "Save Failed!";
	}

	@RequestMapping(value = "/review")
	public String review(@ModelAttribute PaymentVoucherModel paymentVoucherModel, Model model) {
		model.addAttribute("paymentVoucher", paymentVoucherModel);
		return "generalTransaction/fundsTransfer/paymentVoucher/print";
	}

	@RequestMapping(value = "/cancel")
	@ResponseBody
	public String cancel(SessionStatus status) {
		status.setComplete();
		return "Payment Voucher Cancled!";
	}
	
	@RequestMapping(value="/view/{id}")
	public String viewTransaction(Model model,@PathVariable String id)
	{
		model.addAttribute("paymentVoucher",paymentVoucherDao.getIndividualPayment(id));
		model.addAttribute("paymentVoucherAccount",paymentVoucherDao.getPayments(id));
		return "generalTransaction/fundsTransfer/paymentVoucher/viewTxn";
	}
	
	@RequestMapping(value="/viewPaymentVoucher/{id}")
	public void viewPaymentVoucher(Model model, @PathVariable String id,HttpServletResponse response) throws DataNotFoundException, JRException, IOException
	{
		DynamicData d = initialDetailsDao.getDynamicDatas();
		String reporturl = d.getReporturl();
		byte[] bytes=null;
		JasperPrint jasperPrint,jasper;
		
			JasperDesign jd=JRXmlLoader.load(reporturl+"/paymentVoucher.jrxml");
		
		 JasperReport jasperSubReport = JasperCompileManager.compileReport(reporturl+"/paymentVoucherAccounts.jrxml");
		 
		 Map<String, Object> parameters=new HashMap<String, Object>();
		 
		/*For Initail Details Sub Report*/	
		 
		 JasperReport generalSubReport = JasperCompileManager.compileReport(reporturl+"/generalReport.jrxml");
		 
		 GeneralDetailsModel gdm=operationDao.getGeneralDetails();
		 ArrayList<GeneralDetailsModel> gdlist= new ArrayList<GeneralDetailsModel>();
		 gdlist.add(gdm);
		
		 JRBeanCollectionDataSource generalds=new JRBeanCollectionDataSource(gdlist);
			parameters.put("generalDataSourceParam", generalds);
			parameters.put("generalsubreportparam",generalSubReport);
		
			///------------------sub report-----------------
			
			
			
			ArrayList<PaymentVoucherAccountSingle> subdata= paymentVoucherDao.getPayments(id);
		
			
			
			
			PaymentVoucherModel paymentModel=paymentVoucherDao.getIndividualPayment(id);
			int totalAmount=Integer.parseInt(paymentModel.getTotalDebitAmount());
			
		 
			
			ArrayList data=new ArrayList<PaymentVoucherModel>();
			data.add(paymentModel);
			
			JRBeanCollectionDataSource ds=new JRBeanCollectionDataSource(data);
		
			JRBeanCollectionDataSource subds=new JRBeanCollectionDataSource(subdata);
			parameters.put("dataSourceParam", subds);
			parameters.put("subreportparam",jasperSubReport);
			
			
			
			JasperReport jasperReport=JasperCompileManager.compileReport(jd);
		 
			
			
			jasperPrint = JasperFillManager.fillReport(jasperReport, parameters,ds);
		
		
			 bytes=JasperExportManager.exportReportToPdf(jasperPrint);
			//JasperViewer.viewReport(jasperPrint);
		  ServletOutputStream servletOutputStream = response.getOutputStream();
		    response.setContentType("application/pdf");
		    response.setContentLength(bytes.length);

		    servletOutputStream.write(bytes, 0, bytes.length);
		    servletOutputStream.flush();
		    servletOutputStream.close();
	}
	
	

}
