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

import com.mysql.jdbc.PreparedStatement;
import com.spring.dao.StudentDao;
import com.spring.model.FormDetails;
import com.spring.model.StudentModel;

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
		 String sql="SELECT * FROM districtcodes";
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
		 String sql="SELECT * FROM disabledtype";
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
		 String sql="SELECT * FROM classlist";
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
		 String sql="SELECT * FROM languagetbl";
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
		 String sql="SELECT * FROM castetbl";
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
		 String sql="SELECT * FROM exam_type";
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
		String sql="insert into studentinfo(LegacyId,studentname,sex,smotherlanguage,sethinicgroup,sreligion,dob,doben,differentlyabledYN,differentlyabledtype,admissionclass,section,rollno,housegroup,oldschool,reasonleav,hobby,specialinterest,inputter,entrydate,admissiondate,admissiondateen)values('"+s.getLegacyId()+"','"+s.getStudentname()+"','"+s.getSex()+"','"+s.getSmotherlanguage()+"','"+s.getSethinicgroup()+"','"+s.getsReligion()+"','"+s.getDob()+"','"+s.getDoben()+"','"+s.getDifferentlyabledYN()+"','"+s.getDifferentlyabledtype()+"','"+s.getAdmissionclass()+"','"+s.getSection()+"','"+s.getRollno()+"','"+s.getHousegroup()+"','"+s.getOldschool()+"','"+s.getReasonleav()+"','"+s.getHobby()+"','"+s.getSpecialinterest()+"','"+inputter+"',CURDATE(),'"+s.getAdmissiondate()+"','"+s.getAdmissiondateen()+"')";
		String sql1="select max(studentid) from studentinfo";
		jdbcTemplate.update(sql);
		return jdbcTemplate.queryForObject(sql1, Integer.class);
		
		
	 }
	 public boolean insertStudentOtherDetails(StudentModel s, int studentid){
			String sql1="insert into smotherdetailtbl(studentid,mothername,maddress,moffice,mposition,mincome,mmobile,mtelephone,memail,mephone,mcitizenshipno,mcitizenshipissuedby,mcitizenshipissueddate,mcitizenshipissueddateen,mlicenseno,mlicenseissuedby,mlicenseissueddate,mlicenseissueddateen,mofficialidno,mofficialidissuedby,mofficialidissueddate,mofficialidissueddateen,mvoteridno,mvoteridissuedby,mvoteridissueddate,mvoteridissueddateen,mpassportno,mpassportissuedby,mpassportissueddate,mpassportissueddateen)values('"+studentid+"','"+s.getMothername()+"','"+s.getMaddress()+"','"+s.getMoffice()+"','"+s.getMposition()+"','"+s.getMincome()+"','"+s.getMmobile()+"','"+s.getMtelephone()+"','"+s.getMemail()+"','"+s.getMephone()+"','"+s.getMcitizenshipno()+"','"+s.getMcitizenshipissuedby()+"','"+s.getMcitizenshipissueddate()+"','"+s.getMcitizenshipissueddateen()+"','"+s.getMlicenseno()+"','"+s.getMlicenseissuedby()+"','"+s.getMlicenseissueddate()+"','"+s.getMlicenseissueddateen()+"','"+s.getMofficialidno()+"','"+s.getMofficialidissuedby()+"','"+s.getMofficialidissueddate()+"','"+s.getMofficialidissueddateen()+"','"+s.getMvoteridno()+"','"+s.getMvoteridissuedby()+"','"+s.getMvoteridissueddate()+"','"+s.getMvoteridissueddateen()+"','"+s.getMpassportno()+"','"+s.getMpassportissuedby()+"','"+s.getMpassportissueddate()+"','"+s.getMpassportissueddateen()+"')";
			String sql2="insert into sfatherdetailtbl(studentid,fathername,faddress,foffice,fposition,fincome,fmobile,ftelephone,femail,fephone,fcitizenshipno,fcitizenshipissuedby,fcitizenshipissueddate,fcitizenshipissueddateen,flicenseno,flicenseissuedby,flicenseissueddate,flicenseissueddateen,fofficialidno,fofficialidissuedby,fofficialidissueddate,fofficialidissueddateen,fvoteridno,fvoteridissuedby,fvoteridissueddate,fvoteridissueddateen,fpassportno,fpassportissuedby,fpassportissueddate,fpassportissueddateen)values('"+studentid+"','"+s.getFathername()+"','"+s.getFaddress()+"','"+s.getFoffice()+"','"+s.getFposition()+"','"+s.getFincome()+"','"+s.getFmobile()+"','"+s.getFtelephone()+"','"+s.getFemail()+"','"+s.getFephone()+"','"+s.getFcitizenshipno()+"','"+s.getFcitizenshipissuedby()+"','"+s.getFcitizenshipissueddate()+"','"+s.getFcitizenshipissueddateen()+"','"+s.getFlicenseno()+"','"+s.getFlicenseissuedby()+"','"+s.getFlicenseissueddate()+"','"+s.getFlicenseissueddateen()+"','"+s.getFofficialidno()+"','"+s.getFofficialidissuedby()+"','"+s.getFofficialidissueddate()+"','"+s.getFofficialidissueddateen()+"','"+s.getFvoteridno()+"','"+s.getFvoteridissuedby()+"','"+s.getFvoteridissueddate()+"','"+s.getFvoteridissueddateen()+"','"+s.getFpassportno()+"','"+s.getFpassportissuedby()+"','"+s.getFpassportissueddate()+"','"+s.getFpassportissueddateen()+"')";
			String sql3="insert into sbirthcertificatetbl(studentid,sbirthcertificateno,sbirthcertificateissuedby,sbirthcertificateissueddate,sbirthcertificateissueddateen)values('"+studentid+"','"+s.getBirthcertificateno()+"','"+s.getBirthcertificateissuedby()+"','"+s.getBirthcertificateissueddate()+"','"+s.getBirthcertificateissueddateen()+"') ";
			String sql4="insert into slocalguardiantbl(studentid,localguardianname,localadd,relationtype,localmob) values('"+studentid+"','"+s.getLocal2()+"','"+s.getLocaladd2()+"','"+s.getRelationtype2()+"','"+s.getLocalmob2()+"')";
			String sql5="insert into slocalguardiantbl(studentid,localguardianname,localadd,relationtype,localmob) values('"+studentid+"','"+s.getLocal1()+"','"+s.getLocaladd1()+"','"+s.getRelationtype1()+"','"+s.getLocalmob1()+"')";
			String sql6="insert into saddresstbl(studentid,district,vdcmun,wardno,tole,tempaddress) values('"+studentid+"','"+s.getDistrict()+"','"+s.getVdcMun()+"','"+s.getWardNo()+"','"+s.getTole()+"','"+s.getTempaddress()+"')";
			
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
		 String query="select * from studentdetail";
		 return jdbcTemplate.query(query, new StudentMapper());
	 }
		public static final class StudentMapper implements RowMapper<StudentModel>{

			@Override
			public StudentModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				StudentModel s=new StudentModel();
				FormDetails f=new FormDetails();
				s.setLegacyId(rs.getString("LegacyId"));
				s.setStudentname(rs.getString("studentname"));
				s.setDob(rs.getString("dob"));
				s.setDoben(rs.getString("doben"));
				s.setBirthcertificateno(rs.getString("sbirthcertificateno"));
				s.setBirthcertificateissuedby(rs.getString("sbirthcertificateissuedby"));
				s.setAdmissionclass(rs.getString("admissionclass"));
				s.setSection(rs.getString("section"));
				s.setStudentid(rs.getString("studentid"));
				s.setRollno(rs.getString("rollno"));
				s.setAdmissiondate(rs.getString("admissiondate"));
				s.setSex(rs.getString("sex"));
				s.setSethinicgroup(rs.getString("sethinicgroup"));
				s.setsReligion(rs.getString("sreligion"));
				s.setDifferentlyabledtype(rs.getString("differentlyabledtype"));
				s.setDifferentlyabledYN(rs.getString("differentlyabledYN"));
				s.setHousegroup(rs.getString("housegroup"));
				s.setOldschool(rs.getString("oldschool"));
				s.setReasonleav(rs.getString("reasonleav"));
				s.setHobby(rs.getString("hobby"));
				s.setSpecialinterest(rs.getString("specialinterest"));
				s.setAdmissiondate(rs.getString("admissiondate"));
				s.setAdmissiondateen(rs.getString("admissiondateen"));
				s.setSmotherlanguage(rs.getString("smotherlanguage"));
				s.setFathername(rs.getString("fathername"));
				s.setFaddress(rs.getString("faddress"));
				s.setFoffice(rs.getString("foffice"));
				s.setFposition(rs.getString("fposition"));
				s.setFincome(rs.getString("fincome"));
				s.setFmobile(rs.getString("fmobile"));
				s.setFtelephone(rs.getString("ftelephone"));
				s.setFemail(rs.getString("femail"));
				s.setFephone(rs.getString("fephone"));
				s.setFcitizenshipno(rs.getString("fcitizenshipno"));
				s.setFcitizenshipissuedby(rs.getString("fcitizenshipissuedby"));
				s.setFcitizenshipissueddate(rs.getString("fcitizenshipissueddate"));
				s.setFcitizenshipissueddateen(rs.getString("fcitizenshipissueddateen"));
				s.setFlicenseno(rs.getString("flicenseno"));
				s.setFlicenseissuedby(rs.getString("flicenseissuedby"));
				s.setFlicenseissueddate(rs.getString("flicenseissueddate"));
				s.setFlicenseissueddateen(rs.getString("flicenseissueddateen"));
				s.setFofficialidno(rs.getString("fofficialidno"));
				s.setFofficialidissuedby(rs.getString("fofficialidissuedby"));
				s.setFofficialidissueddate(rs.getString("fofficialidissueddate"));
				s.setFofficialidissueddateen(rs.getString("fofficialidissueddateen"));
				s.setFvoteridno(rs.getString("fvoteridno"));
				s.setFvoteridissuedby(rs.getString("fvoteridissuedby"));
				s.setFvoteridissueddate(rs.getString("fvoteridissueddate"));
				s.setFvoteridissueddateen(rs.getString("fvoteridissueddateen"));
				s.setFpassportno(rs.getString("fpassportno"));
				s.setFpassportissuedby(rs.getString("fpassportissuedby"));
				s.setFpassportissueddate(rs.getString("fpassportissueddate"));
				s.setFpassportissueddateen(rs.getString("fpassportissueddateen"));
				
				
				s.setMothername(rs.getString("mothername"));
				s.setMaddress(rs.getString("maddress"));
				s.setMoffice(rs.getString("moffice"));
				s.setMposition(rs.getString("mposition"));
				s.setMincome(rs.getString("mincome"));
				s.setMmobile(rs.getString("mmobile"));
				s.setMtelephone(rs.getString("mtelephone"));
				s.setMemail(rs.getString("memail"));
				s.setMephone(rs.getString("mephone"));
				s.setMcitizenshipno(rs.getString("mcitizenshipno"));
				s.setMcitizenshipissuedby(rs.getString("mcitizenshipissuedby"));
				s.setMcitizenshipissueddate(rs.getString("mcitizenshipissueddate"));
				s.setMcitizenshipissueddateen(rs.getString("mcitizenshipissueddateen"));
				s.setMlicenseno(rs.getString("mlicenseno"));
				s.setMlicenseissuedby(rs.getString("mlicenseissuedby"));
				s.setMlicenseissueddate(rs.getString("mlicenseissueddate"));
				s.setMlicenseissueddateen(rs.getString("mlicenseissueddateen"));
				s.setMofficialidno(rs.getString("mofficialidno"));
				s.setMofficialidissuedby(rs.getString("mofficialidissuedby"));
				s.setMofficialidissueddate(rs.getString("mofficialidissueddate"));
				s.setMofficialidissueddateen(rs.getString("mofficialidissueddateen"));
				s.setMvoteridno(rs.getString("mvoteridno"));
				s.setMvoteridissuedby(rs.getString("mvoteridissuedby"));
				s.setMvoteridissueddate(rs.getString("mvoteridissueddate"));
				s.setMvoteridissueddateen(rs.getString("mvoteridissueddateen"));
				s.setMpassportno(rs.getString("mpassportno"));
				s.setMpassportissuedby(rs.getString("mpassportissuedby"));
				s.setMpassportissueddate(rs.getString("mpassportissueddate"));
				s.setMpassportissueddateen(rs.getString("mpassportissueddateen"));
				s.setSpecialinterest(rs.getString("specialinterest"));
				
				s.setDistrict(rs.getString("District"));
				s.setVdcMun(rs.getString("VdcMun"));
				s.setWardNo(rs.getString("WardNo"));
				s.setTole(rs.getString("tole"));
				s.setTempaddress(rs.getString("tempaddress"));
				s.setBirthcertificateno(rs.getString("sbirthcertificateno"));
				s.setBirthcertificateissuedby(rs.getString("sbirthcertificateissuedby"));
				s.setBirthcertificateissueddate(rs.getString("sbirthcertificateissueddate"));
				s.setBirthcertificateissueddateen(rs.getString("sbirthcertificateissueddateen"));
				s.setHousegroup(rs.getString("housegroup"));
				
				f.setLanguageid(rs.getString("languageid"));
				s.setInputter(rs.getString("inputter"));
				s.setEntrydate(rs.getString("entrydate"));
				
				s.setFormdetail(f);
				return s;
			}
			
		}
		
		public StudentModel getStudentDetail(int id)
		{
			String query="select * from studentdetail where studentid='"+id+"'";
			return jdbcTemplate.queryForObject(query, new StudentMapper());
			
		}
		public StudentModel getStudentImage(int id)
		{
			String query="select * from student_image where studentid='"+id+"'";
			return jdbcTemplate.queryForObject(query, new StudentImageMapper());
			
		}
		public static final class StudentImageMapper implements RowMapper<StudentModel>{

			@Override
			public StudentModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				StudentModel s=new StudentModel();
				s.setImageData(rs.getBytes("imageData"));
				return s;
			}
			}
		public List<StudentModel> getLocalGuardian(int id)
		{
			String query="select * from slocalguardiantbl where studentid='"+id+"'";
			return jdbcTemplate.query(query, new LocalGuardiantMapper());
			
		}
		public static final class LocalGuardiantMapper implements RowMapper<StudentModel>{

			@Override
			public StudentModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				StudentModel s=new StudentModel();
				s.setLocalguardianname(rs.getString("localguardianname"));
				s.setLocalmob(rs.getString("localmob"));
				s.setLocaladd(rs.getString("localadd"));
				s.setRelationtype(rs.getString("relationtype"));
				s.setSlocalguardianid(rs.getString("slocalguardianid"));
				
				return s;
				
			}
		}
		
		
		public StudentModel getStudentDetail(String classname, String section, String rollno)
		{
			try{
			String query="select * from studentdetail where admissionclass='"+classname+"' and section='"+section+"' and rollno='"+rollno+"'";
			return jdbcTemplate.queryForObject(query, new StudentMapper());
			
		}catch(Exception e)
			{
			System.out.println(e);
			return null;
			}
		}

		public boolean updateStudent(StudentModel s)
		{
			ApplicationContext context=new ClassPathXmlApplicationContext("root-context.xml");
			DataSource dataSource=(DataSource) context.getBean("dataSource");
			int status=0;
			
			
			String sqlf="update sfatherdetailtbl set fathername='"+s.getFathername()+"',faddress='"+s.getFaddress()+"',foffice='"+s.getFoffice()+"',fposition='"+s.getFposition()+"',fincome='"+s.getFincome()+"',fmobile='"+s.getFmobile()+"', ftelephone='"+s.getFtelephone()+"',femail='"+s.getFemail()+"',fephone='"+s.getFephone()+"' where studentid='"+s.getStudentid()+"'";
			String sqlm="update smotherdetailtbl set mothername='"+s.getMothername()+"',maddress='"+s.getMaddress()+"',moffice='"+s.getMoffice()+"',mposition='"+s.getMposition()+"',mincome='"+s.getMincome()+"',mmobile='"+s.getMmobile()+"', mtelephone='"+s.getMtelephone()+"',memail='"+s.getMemail()+"',mephone='"+s.getMephone()+"' where studentid='"+s.getStudentid()+"'";
			String sqls="update studentinfo set LegacyId='"+s.getLegacyId()+"',studentname='"+s.getStudentname()+"',sex='"+s.getSex()+"',smotherlanguage='"+s.getSmotherlanguage()+"',sethinicgroup='"+s.getSethinicgroup()+"',sreligion='"+s.getsReligion()+"',dob='"+s.getDob()+"',doben='"+s.getDoben()+"',differentlyabledYN='"+s.getDifferentlyabledYN()+"',differentlyabledtype='"+s.getDifferentlyabledtype()+"',admissionclass='"+s.getAdmissionclass()+"',section='"+s.getSection()+"',rollno='"+s.getRollno()+"',housegroup='"+s.getHousegroup()+"',oldschool='"+s.getOldschool()+"',reasonleav='"+s.getReasonleav()+"',hobby='"+s.getHobby()+"',specialinterest='"+s.getSpecialinterest()+"',inputter='"+s.getInputter()+"',entrydate=now(),admissiondate='"+s.getAdmissiondate()+"',admissiondateen='"+s.getAdmissiondateen()+"' where studentid='"+s.getStudentid()+"'";
			String sqla="update  saddresstbl set district='"+s.getDistrict()+"',vdcmun='"+s.getVdcMun()+"',wardno='"+s.getWardNo()+"',tole='"+s.getTole()+"',tempaddress='"+s.getTempaddress()+"' where studentid='"+s.getStudentid()+"'";
			String sqldeletefirst="delete from slocalguardiantbl where studentid='"+s.getStudentid()+"'";
		
			String sqll1="insert into slocalguardiantbl(studentid,localguardianname,localadd,relationtype,localmob) values('"+s.getStudentid()+"','"+s.getLocal2()+"','"+s.getLocaladd2()+"','"+s.getRelationtype2()+"','"+s.getLocalmob2()+"')";
			String sqll2="insert into slocalguardiantbl(studentid,localguardianname,localadd,relationtype,localmob) values('"+s.getStudentid()+"','"+s.getLocal1()+"','"+s.getLocaladd1()+"','"+s.getRelationtype1()+"','"+s.getLocalmob1()+"')";
			
			
			Statement stmt=null;
			Connection con=null;
			
			try{
			con=dataSource.getConnection();
			stmt=con.createStatement();
			
			stmt.addBatch(sqlf);
			stmt.addBatch(sqlm);
			stmt.addBatch(sqldeletefirst);
			
			stmt.addBatch(sqll2);
			stmt.addBatch(sqll1);
			stmt.addBatch(sqls);
			stmt.addBatch(sqla);
			
			stmt.executeBatch();
			}catch(Exception e){
				System.out.println(e);
			}
				
			 if(status>0)
			 {
				 return true;
				 }
			return false;
		}
		
		public void insertImage(StudentModel s){
			try {	
			ApplicationContext context=new ClassPathXmlApplicationContext("root-context.xml");
			DataSource dataSource=(DataSource) context.getBean("dataSource");
			Connection con=null;
			Statement stmt=null;
			
			
			String query="insert into student_image (studentid, imageName, imageData) values('"+s.getStudentid()+"','"+s.getImageName()+"','"+s.getImageData()+"')";
				
				con=dataSource.getConnection();
				stmt=con.createStatement();
				stmt.addBatch(query);
				stmt.executeBatch();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		public List<StudentModel> getSpecificSubjects(String classname, String section)
		{
			
			String query="select studentid,studentname from studentinfo where admissionclass='"+classname+"' and section='"+section+"'";
			System.out.println(query);
			return jdbcTemplate.query(query, new StudentMapper());
		}
		public boolean deleteStudent(String id)
		{
			ApplicationContext context=new ClassPathXmlApplicationContext("root-context.xml");
			DataSource dataSource=(DataSource) context.getBean("dataSource");
			
			Statement stmt=null;
			Connection con=null;
			
			try{
				String query1="delete from slocalguardiantbl where studentid='"+id+"'";
				String query2="delete from smotherdetailtbl where studentid='"+id+"'";
				String query3="delete from sfatherdetailtbl where studentid='"+id+"'";
				String query4="delete from sbirthcertificatetbl where studentid='"+id+"'";
				String query5="delete from saddresstbl where studentid='"+id+"'";
				String query6="delete from studentinfo where studentid='"+id+"'";
			con=dataSource.getConnection();
			stmt=con.createStatement();
			
			stmt.addBatch(query1);
			stmt.addBatch(query2);
			stmt.addBatch(query3);
			stmt.addBatch(query4);
			stmt.addBatch(query5);
			stmt.addBatch(query6);
			stmt.executeBatch();
			}
			catch(Exception e){
				System.out.println(e);
				return false;
			}
			return true;
		}
		public int getTotalStudents(){
			String query="select count(*) from studentinfo";
			return jdbcTemplate.queryForObject(query, Integer.class);
		}
		
		public int getTotalUser()
		{
			String query="select count(*)  from usertbl";
			return jdbcTemplate.queryForObject(query, Integer.class);
		}
		
		public int getTotalTeacher()
		{
			String query="select count(*) from staff_tbl";
			return jdbcTemplate.queryForObject(query, Integer.class);
			
		}
		public String getCurrentBranch()
		{
			String query="select branchName from branchtbl";
			return jdbcTemplate.queryForObject(query, String.class);
			
		}
}
