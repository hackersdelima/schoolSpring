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
import com.spring.dao.InitialDetailsDao;
import com.spring.dao.OperationDao;
import com.spring.dao.PaymentVoucherDao;
import com.spring.dao.RoleDao;
import com.spring.dao.StaffDao;
import com.spring.dao.StudentDao;
import com.spring.dao.UserDao;
import com.spring.extras.Generator;
import com.spring.model.ClaimBillModel;
import com.spring.model.Coursetbl;
import com.spring.model.DynamicData;
import com.spring.model.ExamModel;
import com.spring.model.FeeModel;
import com.spring.model.FormDetails;
import com.spring.model.Muncipality;
import com.spring.model.StatementModel;
import com.spring.model.Status;
import com.spring.model.StudentModel;
import com.spring.service.StatusService;

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
	
	@Autowired
	InitialDetailsDao initialDetailsDao;
	
	@Autowired
	StatusService statusService;
	
	
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
	public String  viewMuncipality(@RequestParam("id") String id, Model model) {
		List<Muncipality> list = initialDetailsDao.getMuncipality(id);
		model.addAttribute("list",list);
		return "onselectpages/viewMuncipality";
	
	}

	@RequestMapping(value = "/viewWardNo")
	public String viewWardNo(@RequestParam("id") String id, Model model) {
		Muncipality mun = initialDetailsDao.getwardcount(id);
		model.addAttribute("mun",mun);
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
		List<FormDetails>  classlist,subjectlist,optsubjectlist;
		classlist=studentDao.getAdmissionClass();
		subjectlist=operationDao.getSubjectList();
		optsubjectlist=operationDao.getOptionalSubject();
		List<StudentModel> list = studentDao.getAllStudents();
		model.addAttribute("slist", list);
		model.addAttribute("assignedsubjects",operationDao.getAssignedSubjects());
		model.addAttribute("classlist",classlist);
		model.addAttribute("subjectlist",subjectlist);
		model.addAttribute("optsubjectlist",optsubjectlist);
		
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
	
	@RequestMapping(value="/bulkGradeReportSearch")
	public String bulkGradeReportSearch(Model model)
	{
		model.addAttribute("examlist",operationDao.getExamList());
		return "exam/bulkGradeReport";
	}
	@RequestMapping(value="/bulkReportSearch")
	public String bulkMarksReportSearch(Model model)
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
		DynamicData d= initialDetailsDao.getDynamicDatas();
		String reporturl = d.getReporturl();
		byte[] bytes=null;
		JasperPrint jasperPrint,jasper;
		  JasperReport jasperReport=JasperCompileManager.compileReport(reporturl+"/trialbalance.jrxml");
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
		DynamicData d= initialDetailsDao.getDynamicDatas();
		String reporturl = d.getReporturl();
		byte[] bytes=null;
		JasperPrint jasperPrint,jasper;
		 
			JasperDesign jd=JRXmlLoader.load(reporturl+"/trialbalancesummary.jrxml");
		  JRDesignQuery query=new JRDesignQuery();
		  query.setText("select demodb.accountstbl.accountNumber,demodb.accountstbl.categoryId,demodb.accountstbl.accountName,demodb.accountstbl.debitBal, demodb.accountstbl.creditBal, demodb.categories.`categoryHead` ,  demodb.mainac.`mainHead` ,  demodb.mainac1.`mainHead1`, demodb.mainac2.`mainHead2` from demodb.accountstbl join  demodb.categories on demodb.accountstbl.categoryId=demodb.categories.categoryId left join  demodb.mainac on demodb.mainac.mainid=mid(demodb.accountstbl.categoryId,1,1) left join  demodb.mainac1 on demodb.mainac1.mainid1=mid(demodb.accountstbl.categoryId,1,2) left join  demodb.mainac2 on demodb.mainac2.mainid2=mid(demodb.accountstbl.categoryId,1,3)");
		  jd.setQuery(query);
		  JasperReport jasperReport=JasperCompileManager.compileReport(jd);
		 
		  jasperPrint = JasperFillManager.fillReport(jasperReport, null, dataSource.getConnection());
		  
		  ServletOutputStream servletOutputStream = response.getOutputStream();
		    bytes = JasperRunManager.runReportToPdf(jasperReport,new HashMap(), dataSource.getConnection());
		    response.setContentType("application/pdf");
		    response.setContentLength(bytes.length);

		    servletOutputStream.write(bytes, 0, bytes.length);
		    servletOutputStream.flush();
		    servletOutputStream.close();
		   
	}
	@RequestMapping(value="/searchStudentClaimbill/{id}")
	public String searchStudentClaimbill(Model model,@PathVariable String id)
	{
		model.addAttribute("id",id);
		return "invoice/claimbill/searchStudentClaimBill";
	}
	
	@RequestMapping(value="/viewClaimBill/{id}", method=RequestMethod.POST)
	@ResponseBody
	public String viewClaimBill(Model model,HttpServletResponse response,@PathVariable String id, @RequestParam(value="month") String monthnumval) throws JRException, SQLException, IOException
	{
		DynamicData d= initialDetailsDao.getDynamicDatas();
		String reporturl = d.getReporturl();
		
		Double rate=13.00;
		String[] monthnumvalarray=monthnumval.split("-");
		String month = monthnumvalarray[0];
		String monthval = monthnumvalarray[1];
		byte[] bytes=null;
		JasperPrint jasperPrint,jasper;
		
		JasperReport jasperReport=JasperCompileManager.compileReport(reporturl+"/claimbill.jrxml");
		 
		 JasperReport jasperSubReport = JasperCompileManager.compileReport(reporturl+"/studentdetails.jrxml");
			
		 Map<String, Object> parameters=new HashMap<String, Object>();
		 
		 Double previousReceivable=claimBillDao.calculatePreviousBalance(id);
		 
		ArrayList<ClaimBillModel> data=claimBillDao.getAllDetails(id, month);
		
		if(data!=null) {
		System.out.println(data.size()+"data size");
		JRBeanCollectionDataSource ds=new JRBeanCollectionDataSource(data);
		
		StudentModel sm=studentDao.getStudentDetail(Integer.parseInt(id));
		sm.setFormonth(monthval);
		ArrayList<StudentModel> smlist=new ArrayList<StudentModel>();
		smlist.add(sm);
		 JRBeanCollectionDataSource subds=new JRBeanCollectionDataSource(smlist);
		  
		  
		  parameters.put("subreportparam",jasperSubReport);
		  parameters.put("dataSourceParam", subds);
		  parameters.put("taxrate",rate);
		  parameters.put("previousReceivable",previousReceivable);
		  
		  jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, ds);
		  bytes=JasperExportManager.exportReportToPdf(jasperPrint);
			//JasperViewer.viewReport(jasperPrint);
		  ServletOutputStream servletOutputStream = response.getOutputStream();
		    response.setContentType("application/pdf");
		    response.setContentLength(bytes.length);

		    servletOutputStream.write(bytes, 0, bytes.length);
		    servletOutputStream.flush();
		    servletOutputStream.close();
		    
		    return "Claim Bill Found";
		}
		else {
			return "Claim Bill Not Found";
		}
		   
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
			  DynamicData d= initialDetailsDao.getDynamicDatas();
				String reporturl = d.getReporturl();
			  byte[] bytes=null;
	
		  JasperReport jasperReport=JasperCompileManager.compileReport(reporturl+"/statements.jrxml");
		 
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
	
	@RequestMapping(value="/attendance")
	public String viewAttendance(Model model) {
		model.addAttribute("examlist",operationDao.getExamList());
		return "exam/attendance";
	}
	
	@RequestMapping(value="/studentattendance")
	public String studentattendance(Model model) {
		model.addAttribute("examlist",operationDao.getExamList());
		return "exam/studentattendance";
	}
	
	@RequestMapping(value="/assignedsubjects")
	public String assignedsubjects(Model model) {
		return "academics/subjects/assigned_subjects_dashboard";
	}
	
	@RequestMapping(value="/v/assignedsubjectsclass")
	public String assignedsubjectsclass(Model model) {
		List<Coursetbl> list = operationDao.coursetbllist();
		model.addAttribute("courselist", list);
		return "academics/subjects/assigned_subjects_class_count";
	}
	@RequestMapping(value="/v/assignedsubjectsstd")
	public String assignedsubjectsstd(Model model) {
		List<Coursetbl> list = operationDao.courseliststdcount();
		model.addAttribute("courselist", list);
		return "academics/subjects/assigned_subjects_std_count";
	}
	
	@RequestMapping(value="/promotion")
	public String promotion(Model model) {
		List<FormDetails> classlist=studentDao.getAdmissionClass();
		List<Status> status = statusService.findAll();
		model.addAttribute("status",status);
	model.addAttribute("classlist",classlist);
		return "student/promotion/promotion";
	}
	
	@RequestMapping(value="/v/getClassStudents", method=RequestMethod.POST)
	public String getClassStudents(@RequestParam("classid") String classid, Model model) {
		System.out.println(classid);
		List<StudentModel> list = studentDao.getStudents(classid);
		System.out.println("list is"+list);
	model.addAttribute("slist",list);
		return "student/promotion/studentlist";
	}
	
	@RequestMapping(value="/rateSetting")
	public String rateSetting(Model model) {
		return "settings/rateSetup";
	}
	
	
}

