package com.spring.school;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dao.AccountDao;
import com.spring.dao.BranchDao;
import com.spring.dao.CategoryDao;
import com.spring.dao.ClaimBillDao;
import com.spring.dao.DateConverterDao;
import com.spring.dao.FeeDao;
import com.spring.dao.OperationDao;
import com.spring.dao.PaymentVoucherDao;
import com.spring.dao.RoleDao;
import com.spring.dao.StaffDao;
import com.spring.dao.StudentDao;
import com.spring.dao.UserDao;
import com.spring.extras.Generator;
import com.spring.model.ClaimBillModel;
import com.spring.model.ExamModel;
import com.spring.model.FeeModel;
import com.spring.model.FormDetails;
import com.spring.model.StatementModel;
import com.spring.model.StudentModel;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

@Controller
@RequestMapping("/nav")
public class NavigationController {
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private OperationDao operationDao;
	@Autowired
	private AccountDao accountDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private BranchDao branchDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private StaffDao staffDao;
	@Autowired
	private DateConverterDao dateConverterDao;
	
	@Autowired
	private FeeDao feeDao;
	
	@Autowired
	private PaymentVoucherDao paymentVoucherDao;
	
	@Autowired
	private Generator generator;
	
	@Autowired
	 DataSource dataSource;
	
	@Autowired
	ClaimBillDao claimBillDao;
	
	
@ModelAttribute
private void commonModels(Model model){
	model.addAttribute("language",studentDao.getLanguages());
	model.addAttribute("interest", studentDao.SpecialInterest());
	model.addAttribute("housegroup", studentDao.HouseGroup());
	model.addAttribute("section", studentDao.getSection());
	model.addAttribute("classlist", studentDao.getAdmissionClass());
	model.addAttribute("dislist", studentDao.getDistricts());
	model.addAttribute("disabledlist", studentDao.getDisabledType());
	model.addAttribute("caste",studentDao.getCaste());
	model.addAttribute("specialinterest",studentDao.SpecialInterest());
	model.addAttribute("subject",operationDao.getSubjectList());

}
	@RequestMapping(value = "/studentAdmission")
	public String studentForm(Model model) {
		return "student/studentRegistration";
	}

	@RequestMapping(value = "/createExam")
	public String createExam(Model model, @ModelAttribute(value="em") ExamModel em) {
		model.addAttribute("em",em);
		model.addAttribute("examtypelist",operationDao.getExamTypeList());
		
		if(em.getStartdate()!=null){
		String startdate=dateConverterDao.englishToNepali(em.getStartdate());
		model.addAttribute("stdateen", startdate);
		}
		
		model.addAttribute("examlist",operationDao.getExamList());
		return "exam/createExam";
	}

	@RequestMapping(value = "/viewMuncipality")
	public String viewMuncipality() {
		return "onselectpages/viewMuncipality";
	}

	@RequestMapping(value = "/viewWardNo")
	public String viewWardNo() {
		return "onselectpages/viewWardNo";
	}

	@RequestMapping(value = "/listStudents")
	public String listStudents(Model model) {
		List<StudentModel> list = studentDao.getAllStudents();
		model.addAttribute("slist", list);
		return "student/registeredstudents";
	}

	@RequestMapping(value = "/generalSettings")
	public String generalSettings() {

		return "settings/generalSettings";
	}

	@RequestMapping(value = "/profileSettings")
	public String profileSettings() {
		return "settings/userprofile";
	}
	
	@RequestMapping(value="/initialDetails")
	public String initialDetails(Model model){
		model.addAttribute("adclass",studentDao.getAdmissionClass());
		model.addAttribute("examtype",studentDao.getExamType());
		return "initialdetail/initialdetails";
	}
	
	@RequestMapping(value="/subjects")
	public String subjects(Model model, @ModelAttribute("msg") String msg){
	    model.addAttribute("subject",operationDao.getSubjectList());
		return "academics/subjects/subjects";
	}
	@RequestMapping(value="/assignSubjects")
	public String assignSubjects(Model model){
		List<FormDetails>  classlist,subjectlist;
		
		classlist=studentDao.getAdmissionClass();
		subjectlist=operationDao.getSubjectList();
		
		model.addAttribute("assignedsubjects",operationDao.getAssignedSubjects());
		
		model.addAttribute("classlist",classlist);
		model.addAttribute("subjectlist",subjectlist);
		
		return "academics/subjects/assignsubjects";
	}
	
	@RequestMapping(value="/dashboard")
	public String dashboard(Model model){
		model.addAttribute("totalstudents",studentDao.getTotalStudents());
		model.addAttribute("totaluser",studentDao.getTotalUser());
		model.addAttribute("totalteacher",studentDao.getTotalTeacher());
		model.addAttribute("currentBranch",studentDao.getCurrentBranch());
		return "dashboard";
	}
	@RequestMapping(value="/createMarksReport")
	public String createMarksReport(Model model){
		model.addAttribute("examlist",operationDao.getExamList());
		return "exam/createStudentReport";
	}
	
	@RequestMapping(value="/createReportonSubject")
	public String createMarksReportOnSubject(Model model)
	{
		model.addAttribute("examlist",operationDao.getExamList());
		return "exam/createReportOnSub";
	}
	@RequestMapping(value="/marksReportSearch")
	public String marksReportSearch(Model model){
		model.addAttribute("examlist",operationDao.getExamList());
		return "exam/marksSearchBox";
	}
	
	@RequestMapping(value="/category")
	public String category(Model model){
		model.addAttribute("accounttype", accountDao.getAccountType());
		model.addAttribute("categorylist",categoryDao.getCategories());
		
		return "settings/adminSettings/categories/insertCategory";
	}
	
	@RequestMapping(value="/account")
	public String account(Model model){
		model.addAttribute("accounttypelist",accountDao.getAccountType());
		model.addAttribute("categorylist",categoryDao.getCategories("ACC"));
		return "account/insertAccount";
	}
	@RequestMapping(value="/viewAccount")
	public String viewAccount(Model model){
		model.addAttribute("accountlist",accountDao.getAccount());
		return "account/viewAccount";
	}
	
	@RequestMapping(value = "/fundTransfer")
	public String fundTransfer(){
		return "generalTransaction/fundsTransfer/insert";
	}
	@RequestMapping(value = "/addUser")
	public String addUser(Model model){
		model.addAttribute("userList",userDao.getUsers());
		model.addAttribute("branchlist",branchDao.getBranches());
		model.addAttribute("rolelist",roleDao.getRoles());
		
		return "usersettings/adduser";
	}
	@RequestMapping(value = "/newStaff")
	public String newStaff(){
		return "staff/newStaff";
	}
	@RequestMapping(value = "/staffList")
	public String staffList(Model model){
		model.addAttribute("staffList",staffDao.listStaffs());
		return "staff/staffList";
	}
	@RequestMapping(value = "/student_photo_upload")
	public String studentPhotoUpload(){
		return "student/photo_upload";
	}
	
	@RequestMapping(value = "/accountType")
	public String accountType(Model model){
		model.addAttribute("accounttypelist",accountDao.getAccountType());
		return "settings/adminSettings/accountType/insert";
	}
	
	@RequestMapping(value = "/paymentVoucher")
	public String paymentVoucher(Model model){
		String branchid = "001";
		String mid = generator.multitransactionidgenerator(branchid);
		model.addAttribute("mid", mid);
		return "generalTransaction/fundsTransfer/paymentVoucher/insert";
	}
	
	@RequestMapping(value="/nepaliToEnglish", method = RequestMethod.POST)
	@ResponseBody
	public String nepaliToEnglish(@RequestParam("nepalidate") String nepalidate,HttpServletResponse response)
	{
		String convertedEnglishDate = dateConverterDao.nepaliToEnglish(nepalidate);
		System.out.println(nepalidate+"="+convertedEnglishDate);
		return convertedEnglishDate;
	
	}
	@RequestMapping(value="/englishToNepali", method = RequestMethod.POST)
	@ResponseBody
	public String englishToNepali(@RequestParam("englishdate") String englishdate,HttpServletResponse response)
	{
		System.out.println(englishdate);
		String convertedNepaliDate = dateConverterDao.englishToNepali(englishdate);
		System.out.println(englishdate+"="+convertedNepaliDate);
		return convertedNepaliDate;
	
	}
	
	@RequestMapping(value="/pageNotFound")
	public String pageNotFound(Model model)
	{
		return "pageNotFound";
		
		
	}
	
	@RequestMapping(value="/feeSetting")
	public String feeSetting(Model model,@ModelAttribute("fm") FeeModel fm){
		List<FormDetails>  classlist;
		classlist=studentDao.getAdmissionClass();
		model.addAttribute("classlist",classlist);
		model.addAttribute("categorylist",categoryDao.getCategories());
		model.addAttribute("feeDetails",feeDao.getFeeDetails());
		model.addAttribute("fm",fm);
		return "settings/feeSetting";
	}
	
	@RequestMapping(value="/bulkReportSearch")
	public String bulkReportSearch(Model model)
	{
		model.addAttribute("examlist",operationDao.getExamList());
		return "exam/bulkReport";
	}
	
	@RequestMapping(value="/viewPaymentVoucher")
	public String viewPaymentVoucher(Model model) {
		model.addAttribute("txn",paymentVoucherDao.findAll());
		return "generalTransaction/fundsTransfer/paymentVoucher/view";
				
	}
	
	@RequestMapping(value="/financialAccount")
	public String financialAccount(Model model)
	{
		model.addAttribute("accounttypelist",accountDao.getAccountType());
		model.addAttribute("categorylist",categoryDao.getCategories("FIN"));
		return "account/FinancialAccount/insertFinancialAccount";
	}
	
	@RequestMapping(value="/financialAccountNo")
	@ResponseBody
	public String accountNoGenerator(@RequestParam("categoryid") String catId)
	{
		
		System.out.println("accountNo generating.....");
		String companyid = "01";
		String branchid="001";
		return accountDao.generateAccountNo(branchid,companyid,catId);
		
		 
	}
	
	@RequestMapping(value="/viewTrialBalance")
	@ResponseBody
	public void viewTrialBalance(Model model,HttpServletResponse response) throws JRException, SQLException, IOException
	{
		byte[] bytes=null;
		JasperPrint jasperPrint,jasper;
		 // JasperReport jasperReport=JasperCompileManager.compileReport("D://DigiNepal//schoolSpring//SchoolMgmt//reports//trialbalance.jrxml");
		  JasperReport jasperReport=JasperCompileManager.compileReport("/opt/tomcat/webapps/reports/trialbalance.jrxml");
		  jasperPrint = JasperFillManager.fillReport(jasperReport, null, dataSource.getConnection());
		 
		  
		 
		  ServletOutputStream servletOutputStream = response.getOutputStream();
		    bytes = JasperRunManager.runReportToPdf(jasperReport,new HashMap(), dataSource.getConnection());
		    response.setContentType("application/pdf");
		    response.setContentLength(bytes.length);

		    servletOutputStream.write(bytes, 0, bytes.length);
		    servletOutputStream.flush();
		    servletOutputStream.close();
		   
	}
	
	
	@RequestMapping(value="/viewTrialBalanceSummary")
	@ResponseBody
	public void viewTrialBalanceSummary(Model model,HttpServletResponse response) throws JRException, SQLException, IOException
	{
		byte[] bytes=null;
		JasperPrint jasperPrint,jasper;
		
		
		 
		//JasperDesign jd=JRXmlLoader.load("D://DigiNepal//schoolSpring//SchoolMgmt//reports//trialbalancesummary.jrxml");
		JasperDesign jd=JRXmlLoader.load("/opt/tomcat/webapps/reports/trialbalancesummary.jrxml");
		  JRDesignQuery query=new JRDesignQuery();
		  query.setText("select demodb.accountstbl.accountNumber,demodb.accountstbl.categoryId,demodb.accountstbl.accountName,demodb.accountstbl.debitBal, demodb.accountstbl.creditBal, demodb.categories.`categoryHead` ,  demodb.mainac.`mainHead` ,  demodb.mainac1.`mainHead1`, demodb.mainac2.`mainHead2` from demodb.accountstbl join  demodb.categories on demodb.accountstbl.categoryId=demodb.categories.categoryId left join  demodb.mainac on demodb.mainac.mainid=mid(demodb.accountstbl.categoryId,1,1) left join  demodb.mainac1 on demodb.mainac1.mainid1=mid(demodb.accountstbl.categoryId,1,2) left join  demodb.mainac2 on demodb.mainac2.mainid2=mid(demodb.accountstbl.categoryId,1,3)");
		  jd.setQuery(query);
		  JasperReport jasperReport=JasperCompileManager.compileReport(jd);
		  //JasperReport jasperReport=JasperCompileManager.compileReport("/opt/tomcat/webapps/reports/trialbalancesummary.jrxml");
		 
		  jasperPrint = JasperFillManager.fillReport(jasperReport, null, dataSource.getConnection());
		 // JasperViewer.viewReport(jasperPrint);
		  
		  ServletOutputStream servletOutputStream = response.getOutputStream();
		    bytes = JasperRunManager.runReportToPdf(jasperReport,new HashMap(), dataSource.getConnection());
		    response.setContentType("application/pdf");
		    response.setContentLength(bytes.length);

		    servletOutputStream.write(bytes, 0, bytes.length);
		    servletOutputStream.flush();
		    servletOutputStream.close();
		   
	}
	
	@RequestMapping(value="/viewClaimBill/{id}")
	@ResponseBody
	public void viewClaimBill(Model model,HttpServletResponse response,@PathVariable String id) throws JRException, SQLException, IOException
	{
		byte[] bytes=null;
		JasperPrint jasperPrint,jasper;
		
			//String sourceFileName="D://DigiNepal//schoolSpring//SchoolMgmt//reports//claimbill.jasper";
		JasperReport jasperReport=JasperCompileManager.compileReport("D://DigiNepal//schoolSpring//SchoolMgmt//reports//claimbill.jrxml");
		 //JasperReport jasperReport=JasperCompileManager.compileReport("/opt/tomcat/webapps/reports/claimbill.jrxml");
		
		  
		  
		  ArrayList<ClaimBillModel> data=claimBillDao.getAllDetails(id);
		  StudentModel sm=studentDao.getStudentDetail(Integer.parseInt(id));
		  JRBeanCollectionDataSource ds=new JRBeanCollectionDataSource(data);
		  
		  System.out.println(ds);
		  Map parameters=new HashMap<String,Object>();
		  parameters.put("ds", ds);
		  parameters.put("sm", sm);
		  
		 // jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, ds);
		
		  ServletOutputStream servletOutputStream = response.getOutputStream();
		    bytes = JasperRunManager.runReportToPdf(jasperReport,parameters, new JREmptyDataSource());
		    response.setContentType("application/pdf");
		    response.setContentLength(bytes.length);

		    servletOutputStream.write(bytes, 0, bytes.length);
		    servletOutputStream.flush();
		    servletOutputStream.close();
		   
	}
	
	@RequestMapping(value="/viewStatements/{id}")
	public String viewStatements(Model model,@PathVariable("id") String id)
	{
		List<StatementModel> statements=paymentVoucherDao.viewStatements(id);
		model.addAttribute("statements",statements);
		model.addAttribute("id",id);
		model.addAttribute("name",accountDao.getAccountName(id));
		return "generalTransaction/statements";
				
	}
	
	@RequestMapping(value="/viewDateStatements/{id}")
	public void viewDateStatements(Model model,@PathVariable("id") String id,@RequestParam Map<String, String> map,HttpServletResponse response)
	{
		
		String fromDate=map.get("fromDate");
		String toDate=map.get("toDate");
		System.out.println("reached"+fromDate+toDate);
		
		Map<String, Object> param=new HashMap<String,Object>();
		param.put("accountNoParam", id);
		param.put("fromDate", fromDate);
		param.put("toDate", toDate);
	//	List<StatementModel> statements=paymentVoucherDao.viewStatements(id);
	//	model.addAttribute("statements",statements);
		
		  try {
			  byte[] bytes=null;
	
		//  JasperReport jasperReport=JasperCompileManager.compileReport("D://DigiNepal//schoolSpring//SchoolMgmt//reports//statements.jrxml");
		JasperReport jasperReport=JasperCompileManager.compileReport("/opt/tomcat/webapps/reports/statements.jrxml");
		  //jasperPrint = JasperFillManager.fillReport(jasperReport, null, dataSource.getConnection());
		 
		  
		 
		  ServletOutputStream servletOutputStream = response.getOutputStream();
		    bytes = JasperRunManager.runReportToPdf(jasperReport,param, dataSource.getConnection());
		    response.setContentType("application/pdf");
		    response.setContentLength(bytes.length);

		    servletOutputStream.write(bytes, 0, bytes.length);
		    servletOutputStream.flush();
		  
				servletOutputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
	}
	@RequestMapping(value="/statementDateRange")
	public String statementDateRange(Model model)
	{
		
		
		return "generalTransaction/datedstatements";
				
	}
	
	@RequestMapping(value="/viewFeeHead")
	public String viewFeeHead(Model model) {
		model.addAttribute("allcategory",categoryDao.getCategories());
		model.addAttribute("categorylist",categoryDao.getFeeHeadCategories());
		return "initialdetail/feehead";
		
	}
	
	@RequestMapping(value="/viewFeeStructure")
	public String viewFeeStructure(Model model) {
		model.addAttribute("categorylist",categoryDao.getFeeHeadCategories());
		model.addAttribute("monthlist",categoryDao.getMonthList());
		return "initialdetail/feestructure";
		
	}
	@RequestMapping(value="/viewBulkClaimBill")
	public String viewBulkClaimBill(Model model) {
		model.addAttribute("monthlist",categoryDao.getMonthList());
		return "invoice/claimbill/claimbillbulk";
	}
	
	
}

