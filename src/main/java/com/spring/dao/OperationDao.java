package com.spring.dao;

import java.util.List;
import java.util.Map;

import com.spring.model.Consolidatemarkssetting;
import com.spring.model.Coursetbl;
import com.spring.model.ExamModel;
import com.spring.model.ExamTypeModel;
import com.spring.model.FormDetails;
import com.spring.model.GeneralDetailsModel;
import com.spring.model.Status;
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
	public boolean addFeeSetting(String classname, String category, String feerate);

	public void editFeeSetting(String feecode, String classname, String category, String feerate);

	public List<FormDetails> getOptionalSubject();

	public void assignOptionalSubjects(String optSubId, String string);

	public List<Coursetbl> coursetbllist();

	public List<Coursetbl> getclasssubjects(String id);

	public List<Coursetbl> fingCourseByStd(String studentid);
	
	public List<Coursetbl> courseliststdcount();

	public GeneralDetailsModel getGeneralDetails();
	
	
	public void tablevaluessetup(List<Object> initiallist);
	
	public void setConsolidate(Consolidatemarkssetting consolidatemarkssetting);

	public List<Consolidatemarkssetting> getConsolidatemarkslist();
	
	public Consolidatemarkssetting getConsolidatemarks(Consolidatemarkssetting consolidatemarkssetting);
	


	

	

}
