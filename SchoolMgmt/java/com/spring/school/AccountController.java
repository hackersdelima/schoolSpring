package com.spring.school;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.spring.dao.CategoryDao;
import com.spring.dao.StaffDao;
import com.spring.dao.StudentDao;
import com.spring.model.AccountModel;
import com.spring.model.AccountTypeModel;
import com.spring.model.StaffModel;
import com.spring.model.StudentModel;
import com.spring.model.UserModel;

@Controller
@RequestMapping("/account")
public class AccountController {
	@Autowired
	AccountDao accountDao;
	
	@Autowired
	StudentDao studentDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	StaffDao staffDao;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addAccount(@ModelAttribute AccountModel accountModel, Model model, HttpSession session){
		UserModel userdetail =(UserModel)session.getAttribute("userDetail");
		accountModel.setInputter(userdetail.getUsername());
		
		System.out.println(accountModel);
		boolean status = accountDao.addAccount(accountModel);
		if(status){
			model.addAttribute("msg","Save Successful!");
		}
		else{
			model.addAttribute("msg","Save Failed!");
		}
		return "message/message";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute AccountModel accountModel, Model model){
		String msg="";
		int status = accountDao.updateAccount(accountModel);
		if(status>0){
			msg = "Update Successful !";
		}
		else{
			msg = "Update Failed !";
		}
		model.addAttribute("msg",msg);
		return "message/message";
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable String id, Model model){
		String msg = "";
		int status = accountDao.deleteAccount(id);
		if(status>0){
			msg = "Delete Successful !";
		}
		else{
			msg = "Delete Failed!";
		}
		model.addAttribute("msg",msg);
		return "message/message";
	}
	
	
	@RequestMapping(value = "/generateAccNo")
	public void generateAccNo(@RequestParam Map<String, String> reqParam, HttpServletResponse response, HttpSession session) throws Exception{
		
		UserModel userdetail = (UserModel)session.getAttribute("userDetail");
		String generatedAccountNo=null;
		String branchId = userdetail.getBranch().getBranchId();
		String companyid=userdetail.getBranch().getCompanyId();
		String memberid=reqParam.get("id");
		boolean userExists=accountDao.checkIfUserExists(memberid);
		
		if (userExists) {
			// setting memberid into 7 digits
			String strI = String.format("%07d", Integer.parseInt(memberid));
			System.out.println(strI+"strI");
			// setting last account number
			String maxaccountno = accountDao.acccountnogen(memberid);
			System.out.println(maxaccountno+ "max account No");
			if (maxaccountno == null) {// if member in accounts table not
										// found
				generatedAccountNo = companyid + branchId + strI + "001";// autogenerated
				System.out.println("New Account No " + generatedAccountNo);
				// the first
				// number
			} else {
				generatedAccountNo = maxaccountno;

				//String accountNo = StringUtils.right(maxaccountno, 3);// taking
																		// last
																		// three
																		// digits
																		// from
																		// max
																		// account
					/*		System.out.println(maxaccountno);											// number+1
				String accountNo=maxaccountno.substring(12, 15);
				System.out.println(accountNo+"accojndsf");
				// generated account number
				generatedAccountNo = companyid + branchId + strI
						+ accountNo;
*/
			}
		} else {
			generatedAccountNo="Member ID not Found.";
		}
		System.out.println(userExists +"member status");
		
		
		response.getWriter().println(generatedAccountNo);
	}
	
	@RequestMapping(value="/generateAccountName", method = RequestMethod.POST)
	@ResponseBody
	public String generateAccountName(@RequestParam("id") String accountNo)
	{
		System.out.println("reached");
		String accountName=accountDao.getAccountName(accountNo);
		System.out.println("account name is"+accountName);
		return accountName;
		
	}
	
	
	@RequestMapping(value = "/membername")
	public void membername(@RequestParam Map<String, String> reqparam, HttpServletResponse response) throws Exception{
		int id = Integer.parseInt(reqparam.get("id"));
		String name;
		if(id<100000){
		StudentModel studentModel = studentDao.getStudentDetail(id);
		 name = studentModel.getStudentname();
		}
		else{
			
			StaffModel staffModel=staffDao.staffDetail(id);
			
			name = staffModel.getStaffName();
		}
		

		response.getWriter().println(name);
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable String id, Model model){
		AccountModel accountModel = accountDao.getAccount(id);
		AccountTypeModel accountTypeModel = accountDao.getAccountType(accountModel.getCategoryModel().getCategoryId());
		model.addAttribute("categorylist",categoryDao.getCategories());
		model.addAttribute("accountDetail",accountModel);
		
		model.addAttribute("accountType", accountTypeModel);
		return "account/editAccountDisplayForm";
		
	}
	
	

}
