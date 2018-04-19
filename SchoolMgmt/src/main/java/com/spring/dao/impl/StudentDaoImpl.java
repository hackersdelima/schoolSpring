package com.spring.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.spring.dao.StudentDao;
import com.spring.model.FormDetails;
import com.spring.model.StudentModel;
import com.spring.model.UserModel;

public class StudentDaoImpl implements StudentDao {
private JdbcTemplate jdbcTemplate;
	

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	 
	 @Autowired
	 private void setDataSource(DataSource dataSource)
	 {
		 this.jdbcTemplate=new JdbcTemplate(dataSource);
		 
	 }
	 
	 public List<FormDetails> getDistricts(){
		 String sql="SELECT * FROM DISTRICTCODES";
			return jdbcTemplate.query(sql, new ClassMapper());
	 }
	 public static final class ClassMapper implements RowMapper<FormDetails>{

			@Override
			public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormDetails form=new FormDetails();
				form.setDistrictCode(rs.getString("DistrictCode"));
				form.setDistrictName(rs.getString("DistrictName"));
				return form;
			}
	 }
	 public List<FormDetails> getDisabledType(){
		 String sql="SELECT * FROM DISABLEDTYPE";
			return jdbcTemplate.query(sql, new DisabledType());
	 }
	 public static final class DisabledType implements RowMapper<FormDetails>{
			@Override
			public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormDetails form=new FormDetails();
				form.setId(rs.getString("id"));
				form.setTypehead(rs.getString("typehead"));
				return form;
			}
	 }
	

	 public List<FormDetails> getAdmissionClass(){
		 String sql="SELECT * FROM CLASSLIST";
			return jdbcTemplate.query(sql, new AdmissionClass());
	 }
	 public static final class AdmissionClass implements RowMapper<FormDetails>{
			@Override
			public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormDetails form=new FormDetails();
				form.setClassid(rs.getString("classid"));
				form.setClassname(rs.getString("classname"));
				return form;
			}
	 }
	 
	 public List<FormDetails> getSection(){
		 String sql="SELECT * FROM sectiontbl";
			return jdbcTemplate.query(sql, new Section());
	 }
	 public static final class Section implements RowMapper<FormDetails>{
			@Override
			public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormDetails form=new FormDetails();
				form.setSectionid(rs.getString("sectionid"));
				form.setSectionname(rs.getString("sectionname"));
				return form;
			}
	 }
	 
	 public List<FormDetails> HouseGroup(){
		 String sql="SELECT * FROM housegrouptbl";
			return jdbcTemplate.query(sql, new HouseGroup());
	 }
	 public static final class HouseGroup implements RowMapper<FormDetails>{
			@Override
			public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormDetails form=new FormDetails();
				form.setHousegroupid(rs.getString("housegroupid"));
				form.setHousegroupname(rs.getString("housegroupname"));
				return form;
			}
	 }
	 
	 
	 public List<FormDetails> SpecialInterest(){
		 String sql="SELECT * FROM specialinteresttbl";
			return jdbcTemplate.query(sql, new SpecialInterest());
	 }
	 public static final class SpecialInterest implements RowMapper<FormDetails>{
			@Override
			public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormDetails form=new FormDetails();
			form.setSpecialInterestId(rs.getString("specialinterestid"));
			form.setSpecialInterestName(rs.getString("specialinterestname"));
				return form;
			}
	 }
	 public List<FormDetails> getLanguages(){
		 String sql="SELECT * FROM LANGUAGETBL";
			return jdbcTemplate.query(sql, new Languages());
	 }
	 public static final class Languages implements RowMapper<FormDetails>{

		@Override
		public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
			FormDetails form=new FormDetails();
			form.setLanguageid(rs.getString("languageid"));
			form.setLanguagename(rs.getString("languagename"));
			return form;
		}
		 
	 }
	 public List<FormDetails> getCaste(){
		 String sql="SELECT * FROM CASTETBL";
			return jdbcTemplate.query(sql, new Caste());
	 }
	 public static final class Caste implements RowMapper<FormDetails>{
		@Override
		public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
			FormDetails form=new FormDetails();
			form.setCasteid(rs.getString("casteid"));
			form.setCastename(rs.getString("castename"));
			return form;
		}
	 }
	 public List<FormDetails> getExamType(){
		 String sql="SELECT * FROM EXAM_TYPE";
			return jdbcTemplate.query(sql, new Exam());
	 }
	 public static final class Exam implements RowMapper<FormDetails>{

		@Override
		public FormDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
			FormDetails form=new FormDetails();
			form.setExamtypeid(rs.getString("examtypeid"));
			form.setExamtypename(rs.getString("examtypename"));
			form.setDescription(rs.getString("description"));
			return form;
		}
		 
	 }
	 public int insertStudent(StudentModel s)
	 {
		 String inputter="inputter";
		 boolean status=false;
		String sql="insert into studentinfo(LegacyId,studentname,sex,smotherlanguage,sethinicgroup,sreligion,dob,doben,differentlyabledYN,differentlyabledtype,admissionclass,section,rollno,housegroup,oldschool,reasonleav,hobby,specialinterest,inputter,entrydate,admissiondate,admissiondateen)values('"+s.getLegacyId()+"','"+s.getStudentname()+"','"+s.getSex()+"','"+s.getSmotherlanguage()+"','"+s.getSethinicgroup()+"','"+s.getSReligion()+"','"+s.getDob()+"','"+s.getDoben()+"','"+s.getDifferentlyabledYN()+"','"+s.getDifferentlyabledtype()+"','"+s.getAdmissionclass()+"','"+s.getSection()+"','"+s.getRollno()+"','"+s.getHousegroup()+"','"+s.getOldschool()+"','"+s.getReasonleav()+"','"+s.getHobby()+"','"+s.getSpecialinterest()+"','"+inputter+"',CURDATE(),'"+s.getAdmissiondate()+"','"+s.getAdmissiondateen()+"')";
		String sql1="select max(studentid) from studentinfo";
		jdbcTemplate.update(sql);
		return jdbcTemplate.queryForObject(sql1, Integer.class);
		
		
	 }
	 public boolean insertStudentOtherDetails(StudentModel s, int studentid){
			String sql1="insert into smotherdetailtbl(studentid,mothername,maddress,moffice,mposition,mincome,mmobile,mtelephone,memail,mephone,mcitizenshipno,mcitizenshipissuedby,mcitizenshipissueddate,mcitizenshipissueddateen,mlicenseno,mlicenseissuedby,mlicenseissueddate,mlicenseissueddateen,mofficialidno,mofficialidissuedby,mofficialidissueddate,mofficialidissueddateen,mvoteridno,mvoteridissuedby,mvoteridissueddate,mvoteridissueddateen,mpassportno,mpassportissuedby,mpassportissueddate,mpassportissueddateen)values('"+studentid+"','"+s.getMothername()+"','"+s.getMaddress()+"','"+s.getMoffice()+"','"+s.getMposition()+"','"+s.getMincome()+"','"+s.getMmobile()+"','"+s.getMtelephone()+"','"+s.getMemail()+"','"+s.getMephone()+"','"+s.getMcitizenshipno()+"','"+s.getMcitizenshipissuedby()+"','"+s.getMcitizenshipissueddate()+"','"+s.getMcitizenshipissueddateen()+"','"+s.getMlicenseno()+"','"+s.getMlicenseissuedby()+"','"+s.getMlicenseissueddate()+"','"+s.getMlicenseissueddateen()+"','"+s.getMofficialidno()+"','"+s.getMofficialidissuedby()+"','"+s.getMofficialidissueddate()+"','"+s.getMofficialidissueddateen()+"','"+s.getMvoteridno()+"','"+s.getMvoteridissuedby()+"','"+s.getMvoteridissueddate()+"','"+s.getMvoteridissueddateen()+"','"+s.getMpassportno()+"','"+s.getMpassportissuedby()+"','"+s.getMpassportissueddate()+"','"+s.getMpassportissueddateen()+"')";
			String sql2="insert into sfatherdetailtbl(studentid,fathername,faddress,foffice,fposition,fincome,fmobile,ftelephone,femail,fephone,fcitizenshipno,fcitizenshipissuedby,fcitizenshipissueddate,fcitizenshipissueddateen,flicenseno,flicenseissuedby,flicenseissueddate,flicenseissueddateen,fofficialidno,fofficialidissuedby,fofficialidissueddate,fofficialidissueddateen,fvoteridno,fvoteridissuedby,fvoteridissueddate,fvoteridissueddateen,fpassportno,fpassportissuedby,fpassportissueddate,fpassportissueddateen)values('"+studentid+"','"+s.getFathername()+"','"+s.getFaddress()+"','"+s.getFoffice()+"','"+s.getFposition()+"','"+s.getFincome()+"','"+s.getFmobile()+"','"+s.getFtelephone()+"','"+s.getFemail()+"','"+s.getFephone()+"','"+s.getFcitizenshipno()+"','"+s.getFcitizenshipissuedby()+"','"+s.getFcitizenshipissueddate()+"','"+s.getFcitizenshipissueddateen()+"','"+s.getFlicenseno()+"','"+s.getFlicenseissuedby()+"','"+s.getFlicenseissueddate()+"','"+s.getFlicenseissueddateen()+"','"+s.getFofficialidno()+"','"+s.getFofficialidissuedby()+"','"+s.getFofficialidissueddate()+"','"+s.getFofficialidissueddateen()+"','"+s.getFvoteridno()+"','"+s.getFvoteridissuedby()+"','"+s.getFvoteridissueddate()+"','"+s.getFvoteridissueddateen()+"','"+s.getFpassportno()+"','"+s.getFpassportissuedby()+"','"+s.getFpassportissueddate()+"','"+s.getFpassportissueddateen()+"')";
			String sql3="insert into sbirthcertificatetbl(studentid,sbirthcertificateno,sbirthcertificateissuedby,sbirthcertificateissueddate,sbirthcertificateissueddateen)values('"+studentid+"','"+s.getBirthcertificateno()+"','"+s.getBirthcertificateissuedby()+"','"+s.getBirthcertificateissueddate()+"','"+s.getBirthcertificateissueddateen()+"') ";
			String sql4="insert into sbirthcertificatetbl(studentid,sbirthcertificateno,sbirthcertificateissuedby,sbirthcertificateissueddate,sbirthcertificateissueddateen)values('"+studentid+"','"+s.getBirthcertificateno()+"','"+s.getBirthcertificateissuedby()+"','"+s.getBirthcertificateissueddate()+"','"+s.getBirthcertificateissueddateen()+"') ";
			String sql5="insert into slocalguardiantbl(studentid,localguardianname,localadd,relationtype,localmob)values('"+studentid+"','"+s.getLocal1()+"','"+s.getLocaladd1()+"','"+s.getRelaiontype1()+"','"+s.getLocalmob1()+"')";
			String sql6="insert into slocalguardiantbl(studentid,localguardianname,localadd,relationtype,localmob)values('"+studentid+"','"+s.getLocal2()+"','"+s.getLocaladd2()+"','"+s.getRelationtype2()+"','"+s.getLocalmob2()+"')";

			ApplicationContext context=new ClassPathXmlApplicationContext("root-context.xml");
			DataSource dataSource=(DataSource) context.getBean("dataSource");
			boolean status=false;
			int[] i = null;
			Connection con=null;
			Statement st=null;
			try {
				con=dataSource.getConnection();
				st=con.createStatement();
				st.addBatch(sql1);
				st.addBatch(sql2);
				st.addBatch(sql3);
				st.addBatch(sql4);
				st.addBatch(sql5);
				st.addBatch(sql6);
				i=st.executeBatch();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(i.length==6){
				status=true;
				
			}
		 return status; 
	 }
	 public List<StudentModel> getAllStudents(){
		 String query="select * from studentinfo";
		 return jdbcTemplate.query(query, new StudentMapper());
	 }
		public static final class StudentMapper implements RowMapper<StudentModel>{

			@Override
			public StudentModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				StudentModel s=new StudentModel();
				s.setStudentname(rs.getString("studentname"));
				s.setAdmissionclass(rs.getString("admissionclass"));
				s.setSection(rs.getString("section"));
				s.setStudentid(rs.getString("studentid"));
				s.setRollno(rs.getString("rollno"));
				
				return s;
			}
			
		}
	 
}
