package com.spring.school;

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

import com.spring.dao.AccountDao;
import com.spring.dao.CategoryDao;
import com.spring.dao.FeeDao;
import com.spring.dao.FeeInvoiceDao;
import com.spring.dao.GeneratorDao;
import com.spring.dao.InitialDetailsDao;
import com.spring.dao.OperationDao;
import com.spring.dao.StudentDao;
import com.spring.extras.Generator;
import com.spring.model.AccountModel;
import com.spring.model.DynamicData;
import com.spring.model.FeeInvoiceModel;
import com.spring.model.GeneralDetailsModel;
import com.spring.model.InvoiceModel;
import com.spring.model.StudentModel;
import com.spring.util.Utilities;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

@Controller
@RequestMapping("/invoice")
@SessionAttributes("feeInvoice")
public class FeeInvoiceController {

	@Autowired
	AccountDao accountDao;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	FeeInvoiceDao feeInvoiceDao;
	@Autowired
	InitialDetailsDao initialDetailsDao;
	@Autowired
	OperationDao operationDao;

	@Autowired
	private StudentDao studentDao;
	
	@Autowired
	private GeneratorDao genDao;
	
	@RequestMapping(value = "/add/{id}")
	public String add(Model model, @PathVariable("id") String pid) {
		
		model.addAttribute("invoiceNo",genDao.invoiceIdGenerator());
		model.addAttribute("pid",pid);
		model.addAttribute("scategory",accountDao.getStudentAccount(pid));
		model.addAttribute("categorylist", categoryDao.getCategories());
		return "invoice/invoice";
	}
	
	@RequestMapping(value="/save/{id}")
	public String saveInvoice(Model model,@PathVariable("id") String pid,@ModelAttribute InvoiceModel im) {
		System.out.println("invoice Saving");
		boolean invoiceSaveStatus = feeInvoiceDao.insertInvoice(im);
		if (invoiceSaveStatus) {
			String invoiceNo=im.getInvoiceNo();
			
		
			List<AccountModel> listOfAccount=accountDao.getStudentAccount(pid);
			double amountPaid=im.getAmountPaid();
			System.out.println("Actual Amount Paid "+amountPaid);
			
			for(int i=0;i<listOfAccount.size();i++) {
				double acBalance=listOfAccount.get(i).getDebitBal()-listOfAccount.get(i).getCreditBal();
				System.out.println(acBalance+"acBalance");
				feeInvoiceDao.insertFeeInvoiceContent(invoiceNo,listOfAccount, i);
				
			
				
				if(amountPaid>=acBalance) {
					//
				boolean status=accountDao.updateCreditBal(acBalance,listOfAccount.get(i).getAccountNumber());
				amountPaid=amountPaid-acBalance;
				System.out.println("new Amount Paid "+amountPaid);
				
				}
				else {
					boolean status=accountDao.updateCreditBal(amountPaid,listOfAccount.get(i).getAccountNumber());
					amountPaid=0;
				}
			}
			
			
			
				
				return "redirect:../viewFeeInvoice/"+invoiceNo;
		}
		return "Saving Failed";
	}

	@RequestMapping(value="/viewInvoice/{id}")
	public void viewInvoice(@PathVariable("id") String pid,@RequestParam("amountPaid") int amountPaid,HttpServletResponse response) throws Exception {
		DynamicData d = initialDetailsDao.getDynamicDatas();
		String reporturl = d.getReporturl();
		String foldername=d.getFoldername();
		System.out.println(foldername);
		byte[] bytes=null;
		JasperPrint jasperPrint;
		 Map<String, Object> parameters=new HashMap<String, Object>();
		
		System.out.println(amountPaid);
		
		/*For Initail Details Sub Report*/	
		 
		 JasperReport generalSubReport = JasperCompileManager.compileReport(reporturl+"/generalReport.jrxml");
		 
		 GeneralDetailsModel gdm=operationDao.getGeneralDetails();
		 ArrayList<GeneralDetailsModel> gdlist= new ArrayList<GeneralDetailsModel>();
		 gdlist.add(gdm);
		
		 JRBeanCollectionDataSource generalds=new JRBeanCollectionDataSource(gdlist);
			parameters.put("generalDataSourceParam", generalds);
			parameters.put("generalsubreportparam",generalSubReport);
			parameters.put("invoiceNo", genDao.invoiceIdGenerator());
			parameters.put("foldername","http://124.41.193.91/projectdatas/"+foldername+"/images/logo.jpg");
		
		
			
	/*	For Student Details Sub Report*/	
			 JasperReport jasperSubReport = JasperCompileManager.compileReport(reporturl+"/studentdetails.jrxml");
			StudentModel sm=studentDao.getStudentDetail(Integer.parseInt(pid));
			ArrayList<StudentModel> smlist=new ArrayList<StudentModel>();
			smlist.add(sm);
			 JRBeanCollectionDataSource subds=new JRBeanCollectionDataSource(smlist);
			 
			  parameters.put("subreportparam",jasperSubReport);
			  parameters.put("dataSourceParam", subds);
		
		 
	
		 
	
		 List<AccountModel> data=accountDao.getStudentAccount(pid);
			
		 JRBeanCollectionDataSource ds=new JRBeanCollectionDataSource(data);
			JasperDesign jd=JRXmlLoader.load(reporturl+"/invoice.jrxml");
			JasperReport jasperReport=JasperCompileManager.compileReport(jd);
			
			parameters.put("amountPaid", amountPaid);
			
			/*Utilities util= new Utilities();
			String amountInWord=util.numToWordFromJs(amountPaid);
			parameters.put("amountPaidInWord",amountInWord);
		 */
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
	
	
	@RequestMapping(value="/viewFeeInvoice/{invoiceNo}")
	public void viewFeeInvoice(@PathVariable("invoiceNo") String invoiceNo,HttpServletResponse response) throws Exception {
		DynamicData d = initialDetailsDao.getDynamicDatas();
		String reporturl = d.getReporturl();
		String foldername=d.getFoldername();
		System.out.println(foldername);
		byte[] bytes=null;
		JasperPrint jasperPrint;
		 Map<String, Object> parameters=new HashMap<String, Object>();
		
		
		/*For Initail Details Sub Report*/	
		 
		 JasperReport generalSubReport = JasperCompileManager.compileReport(reporturl+"/generalReport.jrxml");
		 
		 GeneralDetailsModel gdm=operationDao.getGeneralDetails();
		 ArrayList<GeneralDetailsModel> gdlist= new ArrayList<GeneralDetailsModel>();
		 gdlist.add(gdm);
		
		 JRBeanCollectionDataSource generalds=new JRBeanCollectionDataSource(gdlist);
			parameters.put("generalDataSourceParam", generalds);
			parameters.put("generalsubreportparam",generalSubReport);
			parameters.put("invoiceNo", invoiceNo);
			parameters.put("foldername","http://124.41.193.91/projectdatas/"+foldername+"/images/logo.jpg");
		
			 InvoiceModel invoiceData=feeInvoiceDao.search(invoiceNo);
			 int pid=invoiceData.getStudentid();
			 ArrayList<InvoiceModel> list=new ArrayList<InvoiceModel>();
			 list.add(invoiceData);
			 JRBeanCollectionDataSource invoiceds=new JRBeanCollectionDataSource(list);
			 
			 List<InvoiceModel> invoiceAccounts=feeInvoiceDao.searchAccounts(invoiceNo);
			 JRBeanCollectionDataSource ds=new JRBeanCollectionDataSource(invoiceAccounts);
			 
			 
			 
			
	/*	For Student Details Sub Report*/	
			 JasperReport jasperSubReport = JasperCompileManager.compileReport(reporturl+"/studentdetails.jrxml");
			StudentModel sm=studentDao.getStudentDetail(pid);
			ArrayList<StudentModel> smlist=new ArrayList<StudentModel>();
			smlist.add(sm);
			 JRBeanCollectionDataSource subds=new JRBeanCollectionDataSource(smlist);
			 
			  parameters.put("subreportparam",jasperSubReport);
			  parameters.put("dataSourceParam", subds);
			  parameters.put("amountPaid",invoiceData.getAmountPaid());
			  parameters.put("amountPaidInWord", invoiceData.getInwords());
			  parameters.put("balanceDue", invoiceData.getBalanceDue());
		 
	
		
			JasperDesign jd=JRXmlLoader.load(reporturl+"/invoice.jrxml");
			JasperReport jasperReport=JasperCompileManager.compileReport(jd);
			
			
			/*String amountInWord=util.numToWordFromJs(amountPaid);
			parameters.put("amountPaidInWord",amountInWord);
		 */
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
	
	
	@RequestMapping(value = "/review")
	public String review(@ModelAttribute FeeInvoiceModel feeInvoice, ModelMap model) {

		System.out.println(feeInvoice);
		System.out.println("invoking review()");
		model.addAttribute("feeInvoice", feeInvoice);
		return "invoice/printableInvoice";
	}

	/*@RequestMapping(value = "/save")
	@ResponseBody
	public String save(HttpSession session, SessionStatus status,@ModelAttribute FeeInvoiceModel feeInvoice) {
		System.out.println(feeInvoice+" Fee InVoice");
		boolean invoiceSaveStatus = feeInvoiceDao.insertFeeInvoice(feeInvoice);
		if (invoiceSaveStatus) {
			String maxFeeInvoiceId = feeInvoiceDao.maxFeeInvoiceId();
			feeInvoice.setFee_invoice_id(maxFeeInvoiceId);
			
			//for deducting amount from individual account
			int sizeOfAccount=feeInvoice.getAccount().size();
			int totalPaid=Integer.parseInt(feeInvoice.getAmountPaid());
			System.out.println(" Total Paid ="+totalPaid);
			for(int i=0;i<sizeOfAccount;i++)
			{
				int oldWorkingBal=Integer.parseInt(accountDao.getCurWorkingBalance(feeInvoice.getAccount().get(i)));
				System.out.println(feeInvoice.getAccount().get(i)+"="+(oldWorkingBal));
				
				int balAfterDiscount=Integer.parseInt(feeInvoice.getBalance().get(i));
				System.out.println("Balance After Discount "+balAfterDiscount);
				
				if(totalPaid>=balAfterDiscount)
				{
					totalPaid=totalPaid-balAfterDiscount;
					int newWorkingBal=oldWorkingBal-balAfterDiscount;
					System.out.println(newWorkingBal);
					System.out.println("Remaining Total "+ totalPaid);
					int stats=accountDao.updateWorkingBal(feeInvoice.getAccount().get(i),newWorkingBal);
						
				}
				else
				{
					System.out.println("Unsufficent Balance "+ totalPaid);
					int newWorkingBal=oldWorkingBal-totalPaid;
					int stats=accountDao.updateWorkingBal(feeInvoice.getAccount().get(i),newWorkingBal);
				}
			}

			
			
	//-------------------------------------------------------------------------------------------------//
			int size = feeInvoice.getCategory().getCategoryIdList().size();
			for (int i = 0; i < size; i++) {
				feeInvoiceDao.insertFeeInvoiceContent(feeInvoice, i);
			}
			status.setComplete();
			return "<h3>Data Saved!</h3>";

		}
		else{
		status.setComplete();
		return "<h3>Data Save Failed!</h3>";
		}
	}*/

	@RequestMapping(value = "/cancel")
	@ResponseBody
	public String cancel(@ModelAttribute FeeInvoiceModel feeInvoice, SessionStatus status) {
		status.setComplete();
		return "Invoice Canceled!";
	}

	@RequestMapping(value = "/search/{id}")
	public String search(@PathVariable String id) {

		return "";
	}
	
	@RequestMapping(value="/search")
	public String invoiceSearch(Model model)
	{
		List<StudentModel> list = studentDao.getAllStudents();
		model.addAttribute("slist", list);
		return "/invoice/studentList";
	}
	
	


}
