package com.spring.dao;

import com.spring.model.FormDetails;

public interface InitialDetailsDao {

	public void updateLanguage(FormDetails formDetails);

	public void updateSection(FormDetails formDetails);
	
	public void updateHousegroup(FormDetails formDetails);

	public void UpdateEthnicgroup(FormDetails formDetails);

	public void UpdateSpecialInterest(FormDetails formDetails);

	public void UpdateAdmissionClass(FormDetails formDetails);

	public void UpdateExamType(FormDetails formDetails);

}
