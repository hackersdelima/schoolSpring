package com.spring.school;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dao.FeeDao;
import com.spring.dao.InitialDetailsDao;
import com.spring.dao.OperationDao;
import com.spring.model.FeeModel;
import com.spring.model.FormDetails;
import com.spring.model.RateModel;

@Controller
@RequestMapping("/initialDetails")
public class InitialDetailsController {
	@Autowired
	InitialDetailsDao initialDetailsDao;
	
	@Autowired
	OperationDao operationDao;
	
	@Autowired
	FeeDao feeDao;
	
	@RequestMapping(value="/languageEdit")
	public String languageEdit(@RequestParam("value") String value,@RequestParam("id") String id, Model model){
		model.addAttribute("languagename",value);
		model.addAttribute("languageid",id);
		
		return "initialdetail/edit/language";
	}
	@RequestMapping(value="/languageUpdate")
	public String languageUpdate(@ModelAttribute FormDetails formDetails){
		initialDetailsDao.updateLanguage(formDetails);
		return "redirect:/nav/initialDetails";
	}
	
	@RequestMapping(value="/sectionEdit")
	public String sectionEdit(@RequestParam("value") String value, @RequestParam("id") String id, Model model){
		model.addAttribute("sectionname",value);
		model.addAttribute("sectionid",id);
		return "initialdetail/edit/section";
	}
	@RequestMapping(value="/sectionUpdate")
	public String sectionUpdate(@ModelAttribute FormDetails formDetails){
		initialDetailsDao.updateSection(formDetails);
		return "redirect:/nav/initialDetails";
	}
	
	@RequestMapping(value="/housegroupEdit")
	public String housegroupEdit(@RequestParam("value") String value,@RequestParam("id") String id, Model model){
		model.addAttribute("housegroupname",value);
		model.addAttribute("housegroupid",id);
		
		return "initialdetail/edit/housegroup";
	}
	@RequestMapping(value="/houseGroupUpdate")
	public String housegroupUpdate(@ModelAttribute FormDetails formDetails){
		initialDetailsDao.updateHousegroup(formDetails);
		return "redirect:/nav/initialDetails";
	}
	
	@RequestMapping(value="/ethnicgroupEdit")
	public String ethnicgroupEdit(@RequestParam("value") String value,@RequestParam("id") String id, Model model){
		model.addAttribute("castename",value);
		model.addAttribute("casteid",id);
		
		return "initialdetail/edit/ethnicgroup";
	}
	@RequestMapping(value="/ethnicGroupUpdate")
	public String ethnicgroupUpdate(@ModelAttribute FormDetails formDetails){
		initialDetailsDao.UpdateEthnicgroup(formDetails);
		return "redirect:/nav/initialDetails";
	}
	
	@RequestMapping(value="/specialInterestEdit")
	public String specialInterestEdit(@RequestParam("value") String value,@RequestParam("id") String id, Model model){
		model.addAttribute("specialInterestName",value);
		model.addAttribute("specialInterestId",id);
		
		return "initialdetail/edit/specialinterest";
	}
	@RequestMapping(value="/specialInterestUpdate")
	public String specialInterestUpdate(@ModelAttribute FormDetails formDetails){
		initialDetailsDao.UpdateSpecialInterest(formDetails);
		return "redirect:/nav/initialDetails";
	}
	
	@RequestMapping(value="/admissionClassEdit")
	public String admissionClassEdit(@RequestParam("value") String value, @RequestParam("id") String id, Model model)
	{
		model.addAttribute("classname",value);
		model.addAttribute("classid",id);
		
		return "initialdetail/edit/admissionclass";
	}
	@RequestMapping(value="/admissionClassUpdate")
	public String admissionClassUpdate(@ModelAttribute FormDetails formDetails){
		initialDetailsDao.UpdateAdmissionClass(formDetails);
		return "redirect:/nav/initialDetails";
	}
	
	@RequestMapping(value="/examTypeEdit")
	public String examTypeEdit(@RequestParam("value") String value, @RequestParam("id") String id, Model model) 
	{
		model.addAttribute("examtypename",value);
		model.addAttribute("examtypeid", id);
		return "initialdetail/edit/examtype";
	}
	
	@RequestMapping(value="/examTypeUpdate")
	public String examTypeUpdate(@ModelAttribute FormDetails formDetails){
		initialDetailsDao.UpdateExamType(formDetails);
		return "redirect:/nav/initialDetails";
	}

	
	
	
	@RequestMapping(value="/deleteLanguage/{id}")
	public String deleteLanguage(@PathVariable String id, Model model)
	{
		initialDetailsDao.deleteLanguage(id);
        return "redirect:/nav/initialDetails";
		
	}
	@RequestMapping(value="/deleteSection/{id}")
	public String deleteSection(@PathVariable String id, Model model)
	{
		initialDetailsDao.deleteSection(id);
        return "redirect:/nav/initialDetails";
		
	}
	@RequestMapping(value="/deleteHousegroup/{id}")
	public String deleteHousegroup(@PathVariable String id, Model model)
	{
		initialDetailsDao.deleteHousegroup(id);
        return "redirect:/nav/initialDetails";
		
	}
	@RequestMapping(value="/deleteEthnicgroup/{id}")
	public String deleteEthnicgroup(@PathVariable String id, Model model)
	{
		initialDetailsDao.deleteEthnicgroup(id);
        return "redirect:/nav/initialDetails";
		
	}
	@RequestMapping(value="/deleteSpecialInterest/{id}")
	public String deleteSpecialInterest(@PathVariable String id, Model model)
	{
		initialDetailsDao.deleteSpecialInterest(id);
        return "redirect:/nav/initialDetails";
		
	}
	@RequestMapping(value="/deleteAdmissionClass/{id}")
	public String deleteAdmissionClass(@PathVariable String id, Model model)
	{
		initialDetailsDao.deleteAdmissionClass(id);
        return "redirect:/nav/initialDetails";
		
	}
	
	@RequestMapping(value="/deleteExamType/{id}")
	public String deleteExamType(@PathVariable String id, Model model)
	{
		initialDetailsDao.deleteExamType(id);
        return "redirect:/nav/initialDetails";
		
	}
	
	@RequestMapping(value="/feeSetting/add")
	public String addFeeSetting(@RequestParam Map<String, String> params){
		String classname=params.get("classname");
		String category=params.get("category");
		String feerate=params.get("feerate");
		
		
		operationDao.addFeeSetting(classname,category,feerate);
				
		
		return "redirect:/nav/feeSetting";
	}
	
	
	@RequestMapping(value="/editFeeSetting/{feecode}")
	public String editFeeSetting(@PathVariable String feecode,Model model,RedirectAttributes redirect)
	{
		FeeModel fmodel=feeDao.getFeeSetting(feecode);
		
		redirect.addFlashAttribute("fm",fmodel);
		return "redirect:/nav/feeSetting";
		
		
	}
	
	@RequestMapping(value="/updateFeeSetting/{feecode}")
	public String updateFeeSetting(@PathVariable String feecode,@RequestParam Map<String, String> params){
		
		String classname=params.get("classname");
		String category=params.get("category");
		String feerate=params.get("feerate");
		
		operationDao.editFeeSetting(feecode,classname,category,feerate);
		return "redirect:/nav/feeSetting";
	}
	
	@RequestMapping(value="/addFeeHead")
	public String feeHead(Model model,@RequestParam Map<String,String> params) {
		
		String catIdHead=params.get("categoryId");
		String[] catlist=catIdHead.split("-");
		String catId=catlist[0];
		String catHead=catlist[1];
		
		boolean status=feeDao.addFeeHead(catId,catHead);
		if(status) {
			model.addAttribute("msg","Fee Head Saved");
		return "redirect:/nav/viewFeeHead";
		}
		else {
			model.addAttribute("msg","Fee Head Failed");
			return "redirect:/nav/viewFeeHead";
		}
	}
	
	@RequestMapping(value="/rate/add")
	@ResponseBody
	public String addRate(Model model,@ModelAttribute RateModel rm) {
		boolean status=initialDetailsDao.addRate(rm);
		return "Saved";
	}
	

}
