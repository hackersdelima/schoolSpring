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
	public int insertStudent(StudentModel student);
	 public boolean insertStudentOtherDetails(StudentModel s, int studentid);
}
