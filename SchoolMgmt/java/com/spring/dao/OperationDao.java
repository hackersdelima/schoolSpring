package com.spring.dao;

import java.util.List;
import java.util.Map;

import com.spring.model.ExamModel;
import com.spring.model.ExamTypeModel;
import com.spring.model.FormDetails;
import com.spring.model.Subjects;
import com.spring.model.UserModel;

public interface OperationDao {
	public List<UserModel> getSystemDetails();

	public boolean updateGeneralSetting(UserModel user);

	public boolean insertTableDetail(String tablename,String columns, String value);
	 public List<FormDetails> getSubjectList();
	 
	 public Map<String,String> getAssignedSubjects();

	public boolean checkSubCode(String subjectcode);

	public List<ExamModel> getExamList();
	public List<ExamTypeModel> getExamTypeList();

	public boolean editSubject(String id, Subjects sub);

	public Subjects getSubjectForEdit(String id);
	

	

}
