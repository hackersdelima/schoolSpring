package com.spring.dao;

import java.util.List;

import com.spring.model.FormDetails;
import com.spring.model.StudentModel;

public interface StudentDao {
	 public List<FormDetails> getDistricts();
	 public List<FormDetails> getDisabledType();
	 public List<FormDetails> getAdmissionClass();
	 public List<FormDetails> getSection();
	 public List<FormDetails> HouseGroup();
	 public List<FormDetails> SpecialInterest();
	 public List<FormDetails> getLanguages();
	 public List<FormDetails> getCaste();
	 public List<FormDetails> getExamType();
	public int insertStudent(StudentModel student);
	 public boolean insertStudentOtherDetails(StudentModel s, int studentid);
	public List<StudentModel> getAllStudents();
	public StudentModel getStudentDetail(int id);
	public StudentModel getStudentDetail(String classname, String section, String rollno);

	public boolean updateStudent(StudentModel student);
	public List<StudentModel> getLocalGuardian(int id);
}
