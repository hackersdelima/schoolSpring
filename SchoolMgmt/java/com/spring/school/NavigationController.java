package com.spring.school;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dao.AccountDao;
import com.spring.dao.BranchDao;
import com.spring.dao.CategoryDao;
import com.spring.dao.DateConverterDao;
import com.spring.dao.OperationDao;
import com.spring.dao.RoleDao;
import com.spring.dao.StaffDao;
import com.spring.dao.StudentDao;
import com.spring.dao.UserDao;
import com.spring.model.ExamModel;
import com.spring.model.FormDetails;
import com.spring.model.StudentModel;

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
		model.addAttribute("categorylist",categoryDao.getCategories());
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
	public String paymentVoucher(){
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
	
}

