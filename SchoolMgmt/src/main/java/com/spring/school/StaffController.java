package com.spring.school;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dao.StaffDao;
import com.spring.model.StaffModel;

@Controller
@RequestMapping("/staff")
public class StaffController {
	@Autowired
	private StaffDao staffDao;
	
	@RequestMapping(value="/add", method = RequestMethod.POST)
	@ResponseBody
	public String add(@ModelAttribute StaffModel staffModel){
		boolean status = staffDao.insertStaff(staffModel);
		if(status){
		return "Data Saved!";
		}
		else{
			return "Data Save Failed!";
		}
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	@ResponseBody
	public String update(@ModelAttribute StaffModel staffModel){
		boolean status = staffDao.updateStaff(staffModel);
		if(status){
			return "Data Updated!";
			}
			else{
				return "Data Update Failed!";
			}
	}
	@RequestMapping(value="/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable String id, Model model){
		model.addAttribute("staff",staffDao.staffDetail(id));
		return "staff/editStaff";
	}
	
	@RequestMapping(value="/delete/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String delete(@PathVariable String id){
		boolean status = staffDao.deleteStaff(id);
		if(status){
		return "Data Deleted!";
		}
		else{
			return "Data Delete Failed!";
		}
	}
	

}
