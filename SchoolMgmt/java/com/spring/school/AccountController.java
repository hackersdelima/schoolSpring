package com.spring.school;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dao.AccountDao;
import com.spring.dao.CategoryDao;
import com.spring.dao.StaffDao;
import com.spring.dao.StudentDao;
import com.spring.model.AccountModel;
import com.spring.model.AccountTypeModel;
import com.spring.model.CategoryModel;
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
		try {
		boolean status = accountDao.addAccount(accountModel);
		if(status){
			model.addAttribute("msg","Save Successful!");
		}
		else{
			model.addAttribute("msg","Save Failed!");
		}
		}
		catch(DuplicateKeyException e) {
			System.out.println(e);
			model.addAttribute("msg","Account Exist Already!");
		}
		
		return "message/message";
	}

	@RequestMapping(value="/createBulkAccounts", method = RequestMethod.POST)
	public String createBulkAccounts(Model model,@RequestParam("memberId") String id,HttpSession session) {
		
		UserModel userdetail =(UserModel)session.getAttribute("userDetail");
		List<String> catList=accountDao.getFeeHeadCategories();
		AccountModel am=new AccountModel();
		CategoryModel cat=new CategoryModel();
		AccountTypeModel accType=null;
		
		
		StudentModel student=studentDao.getStudentDetail(Integer.parseInt(id));
		
		for(int i=0;i<catList.size();i++)
		{
			
			try {
				String accountNo=generateBulkAccNo(id,session);
				 accType=accountDao.getAccountType(catList.get(i));
				am.setAccountNumber(accountNo);
				cat.setCategoryId(catList.get(i));
				am.setCategoryModel(cat);
				am.setInputter(userdetail.getUsername());
				am.setMemberId(id);
				am.setAlternativeAccountId("0000");
				am.setAccountName(student.getStudentname());
				
				am.setAccountTypeModel(accType);
				
				
				System.out.println("Account No" +i+accountNo);
				try {
					boolean status = accountDao.addAccount(am);
					if(status){
						model.addAttribute("msg","Save Successful!");
					}
					else{
						model.addAttribute("msg","Save Failed!");
					}
					}
					catch(DuplicateKeyException e) {
						System.out.println(e);
						model.addAttribute("msg","Account Exist Already!");
					}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		model.addAttribute("accountList", accountDao.getBulkAccounts(id));
		return "redirect:/nav/viewAccount";
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

				/*String accountNo = StringUtils.right(maxaccountno, 3);// taking
																		// last
																		// three
																		// digits
																		// from
																		// max
																		// account
							System.out.println(maxaccountno);*/	
				
				//for checking duplicate accounts
				String primaryaccNo=maxaccountno.substring(0,12);
				String accNo=maxaccountno.substring(13, 16);
				int accounNo=Integer.parseInt(accNo);
				accounNo=accounNo+1;
				
				String accountNo = String.format("%03d",accounNo);
				System.out.println(accountNo+"ldkfj");
		
				
				System.out.println(accountNo+"accojndsf");
				// generated account number
				
				generatedAccountNo = companyid + branchId + strI
						+ accountNo;
				System.out.println(generatedAccountNo);

			}
		} else {
			generatedAccountNo="Member ID not Found.";
		}
		System.out.println(userExists +"member status");
		
		
		response.getWriter().println(generatedAccountNo);
	}
	
	@RequestMapping(value = "/generateBulkAccNo")
	public String generateBulkAccNo(String memberid, HttpSession session) throws Exception{
		
		UserModel userdetail = (UserModel)session.getAttribute("userDetail");
		String generatedAccountNo=null;
		String branchId = userdetail.getBranch().getBranchId();
		String companyid=userdetail.getBranch().getCompanyId();
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

				/*String accountNo = StringUtils.right(maxaccountno, 3);// taking
																		// last
																		// three
																		// digits
																		// from
																		// max
																		// account
							System.out.println(maxaccountno);*/	
				
				//for checking duplicate accounts
				String primaryaccNo=maxaccountno.substring(0,12);
				String accNo=maxaccountno.substring(13, 16);
				int accounNo=Integer.parseInt(accNo);
				accounNo=accounNo+1;
				
				String accountNo = String.format("%03d",accounNo);
				System.out.println(accountNo+"ldkfj");
		
				
				System.out.println(accountNo+"accojndsf");
				// generated account number
				
				generatedAccountNo = companyid + branchId + strI
						+ accountNo;
				System.out.println(generatedAccountNo);

			}
		} else {
			generatedAccountNo="Member ID not Found.";
		}
		System.out.println(userExists +"member status");
		
		
		return generatedAccountNo;
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
