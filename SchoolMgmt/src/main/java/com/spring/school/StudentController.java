package com.spring.school;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;

import com.spring.dao.StudentDao;
import com.spring.extras.Generator;
import com.spring.model.StudentModel;

@Controller
@RequestMapping("/student")
public class StudentController {
	@Autowired
	private StudentDao studentDao;
	@Autowired
	Generator generator;

	@RequestMapping(value = "/studentRegistration", method = RequestMethod.POST)
	public String insert(@ModelAttribute StudentModel student, Model model) {
		int studentid = studentDao.insertStudent(student);

		boolean otherStatus = studentDao.insertStudentOtherDetails(student, studentid);
		if (otherStatus) {
			model.addAttribute("msg", "Insert Successful");
		}

		else {
			model.addAttribute("msg", "Insert Unsuccessful");
		}
		return "student/studentRegistration";
	}
	
	//For COmmon Attributes
		@ModelAttribute
		public void CommonModels(Model model){
			model.addAttribute("language",studentDao.getLanguages());
			model.addAttribute("interest", studentDao.SpecialInterest());
			model.addAttribute("housegroup", studentDao.HouseGroup());
			model.addAttribute("section", studentDao.getSection());
			model.addAttribute("classlist", studentDao.getAdmissionClass());
			model.addAttribute("dislist", studentDao.getDistricts());
			model.addAttribute("disabledlist", studentDao.getDisabledType());
			model.addAttribute("caste",studentDao.getCaste());
			model.addAttribute("specialinterest",studentDao.SpecialInterest());
		}
		
		@RequestMapping(value="/editStudent/{id}", method=RequestMethod.GET)
		public String edit(@PathVariable int id, Model model)
		{
			StudentModel student=studentDao.getStudentDetail(id);
			List<StudentModel> localguardian=studentDao.getLocalGuardian(id);
			
			String image = generator.imageDownloadPath()+"/"+Integer.toString(id)+".png";
			
			model.addAttribute("image",image);
			model.addAttribute("student", student);
			model.addAttribute("localguardian",localguardian);
			
			return "student/editStudentRegistration";
		}
		
		@RequestMapping(value="/updateStudent")
		public String update(@ModelAttribute StudentModel student, Model model)
		{

			System.out.println("reached herh");
			boolean status=studentDao.updateStudent(student);
			System.out.println(status);
			return "redirect:/nav/listStudents";
		}
		
	
		@RequestMapping(value="/studentName", method=RequestMethod.POST)
		public void studentName(@RequestParam Map<String, String> requestParams, HttpServletResponse response) throws Exception
		{
			PrintWriter out=response.getWriter();
			String classname=requestParams.get("classname");
			String section=requestParams.get("section");
			String rollno = requestParams.get("rollno");
			
			StudentModel studentModel = studentDao.getStudentDetail(classname, section, rollno);
			
			if(studentModel!=null){
			String studentname = studentModel.getStudentname();
			
			out.println(studentname);
			}
			else
			{
				out.println("Student Id Not Found");
			}
		
		}
		@RequestMapping(value = "/photo_upload", method = RequestMethod.POST)
		@ResponseBody
		public String photoUpload(@RequestParam("file") MultipartFile file, @RequestParam("classid") String classid, @RequestParam("sectionid") String sectionid,  @RequestParam("rollno") String rollno, Model model, HttpSession session) throws IOException {
			//operations
			// Save file on system
			
			
			
			
			StudentModel s=studentDao.getStudentDetail(classid, sectionid, rollno);
			if(s!=null){
			String studentid=s.getStudentid();
			
		
			String saveFileName=null;
			String fileLocation=null; 
			if (!file.getOriginalFilename().isEmpty()) {
				saveFileName=studentid+".png";
				fileLocation=generator.imageUploadPath();
				
				//File upload location from database
				 //can be taken from database
				
				//create folder if not exists
				File uploadDir = new File(fileLocation);
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				//upload file
				BufferedOutputStream outputStream = new BufferedOutputStream(
						new FileOutputStream(new File(fileLocation, saveFileName)));
				outputStream.write(file.getBytes());
				outputStream.flush();
				outputStream.close();

				return "file uploaded";
			} else {
				return "please select file";
			}
			}
			else
			{
				return "Student Id Not Found!! Please Validate First";
			}
		

		
		}

}
