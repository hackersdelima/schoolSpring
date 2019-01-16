package com.spring.school;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dao.FeeDao;
import com.spring.model.FeeStructureModel;

@Controller
@RequestMapping("/fee")
public class FeeController {
	
	@Autowired
	FeeDao feeDao;
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String addFeeStructure(Model model,@ModelAttribute FeeStructureModel fm ){
		
		
		
		boolean status=feeDao.addFeeStructure(fm);
		if(status)
		{
			return "Save Successful";
		}
		else {
			return "Save Unsuccessful";
		}
		
	}
	
	@RequestMapping(value="/getFeeAmount", method=RequestMethod.POST)
	@ResponseBody
	public String getFeeAmount(@RequestParam("id") String id, @RequestParam("catId") String catId)
	{
		if(id.isEmpty() || id.equals("0"))
		{
			return "Student Id not found";
		}
		else {
		System.out.println(id+"hello"+catId);
		String amount=feeDao.getFeeAmount(id,catId);
		return amount;
		}
	}

}
