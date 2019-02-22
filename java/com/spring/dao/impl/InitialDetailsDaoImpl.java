package com.spring.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dao.InitialDetailsDao;
import com.spring.model.FormDetails;

@Repository
public class InitialDetailsDaoImpl implements InitialDetailsDao {

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Autowired
	private void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);

	}

	public void updateLanguage(FormDetails formDetails) {
		String query = "update languagetbl set languagename='" + formDetails.getLanguagename() + "' where languageid='"
				+ formDetails.getLanguageid() + "'";
		jdbcTemplate.update(query);
	}

	public void updateSection(FormDetails formDetails) {
		String query = "update sectiontbl set sectionname='" + formDetails.getSectionname() + "' where sectionid='"
				+ formDetails.getSectionid() + "'";
		jdbcTemplate.update(query);
	}

	public void updateHousegroup(FormDetails formDetails) {
		String query = "update housegrouptbl set housegroupname='" + formDetails.getHousegroupname()
				+ "' where housegroupid='" + formDetails.getHousegroupid() + "'";
		System.out.println(query);
		jdbcTemplate.update(query);
	}

	public void UpdateEthnicgroup(FormDetails formDetails) {
		String query = "update castetbl set castename='" + formDetails.getCastename() + "' where casteid='"
				+ formDetails.getCasteid() + "'";
		System.out.println(query);
		jdbcTemplate.update(query);
	}

	public void UpdateSpecialInterest(FormDetails formDetails) {
		String query = "update specialinteresttbl set specialinterestname='" + formDetails.getSpecialInterestName()
				+ "' where specialinterestid='" + formDetails.getSpecialInterestId() + "'";
		jdbcTemplate.update(query);
	}

	public void UpdateAdmissionClass(FormDetails formDetails) {

		String query = "update classlist set classname='" + formDetails.getClassname() + "'where classid='"
				+ formDetails.getClassid() + "'";
		jdbcTemplate.update(query);
	}

	public void UpdateExamType(FormDetails formDetails) {
		String query = "update exam_type set examtypename='" + formDetails.getExamtypename() + "' where examtypeid='"
				+ formDetails.getExamtypeid() + "'";
		jdbcTemplate.update(query);
	}

	public void deleteLanguage(String id) {
		String query = "delete from languagetbl where languageid='" + id + "'";
		jdbcTemplate.update(query);
	}

	public void deleteSection(String id) {
		String query = "delete from sectiontbl where sectionid='" + id + "'";
		jdbcTemplate.update(query);
	}

	public void deleteHousegroup(String id) {
		String query = "delete from housegrouptbl where housegroupid='" + id + "'";
		jdbcTemplate.update(query);
	}

	public void deleteEthnicgroup(String id) {
		String query = "delete from castetbl where casteid='" + id + "'";
		jdbcTemplate.update(query);
	}

	public void deleteSpecialInterest(String id) {
		String query = "delete from specialinteresttbl where specialinterestid='" + id + "'";
		jdbcTemplate.update(query);
	}

	public void deleteAdmissionClass(String id) {
		String query = "delete from classlist where classid='" + id + "'";
		jdbcTemplate.update(query);
	}

	public void deleteExamType(String id) {
		String query = "delete from exam_type where examtypeid='" + id + "'";
		jdbcTemplate.update(query);
	}

	
}
