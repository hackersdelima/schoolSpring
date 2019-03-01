package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.dao.InitialDetailsDao;
import com.spring.model.DynamicData;
import com.spring.model.FormDetails;
import com.spring.model.Muncipality;
import com.spring.model.RateModel;

@Repository
@Transactional
public class InitialDetailsDaoImpl implements InitialDetailsDao {

	private JdbcTemplate jdbcTemplate;
	
	private SessionFactory sessionFactory;
	
	 @Autowired
	    public void setSessionFactory(SessionFactory sf) {
	        this.sessionFactory = sf;
	        
	    }

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

	@Override
	public List<Muncipality> getMuncipality(String id) {
		String query = "select * from vdccodes where (DistrictCode='" + id +"')";
		return jdbcTemplate.query(query, new MuncipalityMapper());
	}
	
	@Override
	public Muncipality getwardcount(String id) {
		String query = "select * from vdccodes where (vdccode='" + id +"')";
		return jdbcTemplate.queryForObject(query, new MuncipalityMapper());
	}
	public static final class MuncipalityMapper implements RowMapper<Muncipality>{

		@Override
		public Muncipality mapRow(ResultSet rs, int rowNum) throws SQLException {
			Muncipality m = new Muncipality();
			m.setVdccode(rs.getString("vdccode"));
			m.setVdcname(rs.getString("vdcname"));
			m.setWardcount(rs.getString("wardcount"));
			return m;
		}
		}
	@Override
	public DynamicData getDynamicDatas() {
		String query="select * from dynamicdatatbl where id=1";
		return jdbcTemplate.queryForObject(query, new DynamicDataRowMapper());
	}
	
	public static final class DynamicDataRowMapper implements RowMapper<DynamicData>{
	@Override
	public DynamicData mapRow(ResultSet rs, int rowNum) throws SQLException {
		DynamicData d = new DynamicData();
		d.setId(rs.getString("id"));
		d.setFoldername(rs.getString("foldername"));
		d.setReporturl(rs.getString("reporturl"));
		return d;
	}
	}
	@Override
	public boolean addRate(RateModel rm) {

		Session session =this.sessionFactory.getCurrentSession();
	
		/*String hql="update RateModel set ratevalue=:ratevalue where rateid=:rateid";
		Query query=session.createQuery(hql);
		query.setParameter("rateid", 1);
		query.setParameter("ratevalue", rm.getRatevalue());
		int result = query.executeUpdate();
		System.out.println("Rows affected: " + result);*/
		
		rm.setRateid(1);
		session.saveOrUpdate(rm);
		return true;
	}

	
	
	@Override
	public List<RateModel> viewRate() {
		Session session =this.sessionFactory.getCurrentSession();
		List<RateModel> list=session.createQuery("from RateModel").list();
		System.out.println(list);
		return list;
	}


}
