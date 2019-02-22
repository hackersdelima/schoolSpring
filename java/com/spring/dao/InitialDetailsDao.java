package com.spring.dao;

import java.util.List;

import com.spring.model.FormDetails;
import com.spring.model.Muncipality;

public interface InitialDetailsDao {

	public void updateLanguage(FormDetails formDetails);

	public void updateSection(FormDetails formDetails);
	
	public void updateHousegroup(FormDetails formDetails);

	public void UpdateEthnicgroup(FormDetails formDetails);

	public void UpdateSpecialInterest(FormDetails formDetails);

	public void UpdateAdmissionClass(FormDetails formDetails);

	public void UpdateExamType(FormDetails formDetails);

	public void deleteLanguage(String id);

	public void deleteSection(String id);

	public void deleteHousegroup(String id);

	public void deleteEthnicgroup(String id);

	public void deleteSpecialInterest(String id);

	public void deleteAdmissionClass(String id);
	
	public void deleteExamType(String id);

	public List<Muncipality> getMuncipality(String id);

	public Muncipality getwardcount(String id);
	

	
	
	
	

}
