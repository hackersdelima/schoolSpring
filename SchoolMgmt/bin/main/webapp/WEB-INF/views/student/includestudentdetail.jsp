<%@page import="com.controller.student.classes.StudentOperations" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%if((session.getAttribute("userdetail"))!=null){
	String studentid=request.getParameter("id");%>
<%StudentOperations s=new StudentOperations();
ResultSet sd=s.registeredstudentdetail(studentid);ResultSet districts=s.districts();ResultSet disablelist=s.disabletypelist();
ResultSet language=s.getlanguage(); ResultSet caste=s.getcaste();ResultSet section=s.getsection();ResultSet housegroup=s.gethousegroup();ResultSet specialinterest=s.getspecialinterest();
if(sd.next()){
%>
   		<div class="panel panel-default" >
  		<div class="panel-heading"><h4><strong>View/Update Student Detail</strong></h4>
		<button type="submit" class="btn btn-success "  form="form"><i class="fa fa-check"></i> UPDATE</button>
  		<form method="post" action="studentregistration" id="form"></form>

  		</div>
  		<div class="panel-body">
  			<ul class="nav nav-tabs">
			  <li class="active"><a data-toggle="tab" data-target="#1" class="clickable">Student Detail</a></li>
			  <li><a data-toggle="tab" data-target="#2" class="clickable">Father's Detail</a></li>
			   <li><a data-toggle="tab" data-target="#5" class="clickable">Mother's Detail</a></li>
			  <li><a data-toggle="tab" data-target="#3" class="clickable">Local Guardian</a></li>
			  <li><a data-toggle="tab" data-target="#4" class="clickable">Class Detail</a></li>
			</ul>
			<div class="tab-content">
			
			  <div id="1" class="tab-pane fade in active">
			   <table class="table">
			   	<tbody>
			   		<tr>
			   			<td>
			   			<h5><strong>Student Legacy ID</strong></h5>
			   			<input type="text" class="form-control" name="LegacyId" form="form" value="<%=sd.getString("LegacyId")%>">
			   			</td>
			   			<td>
			   			<h5><strong>Student Name</strong></h5>
			   			<input type="text" class="form-control" name="studentname" id="studentname" form="form" value="<%=sd.getString("studentname")%>" required>
			   			</td>
			   		</tr>
			   		<tr>
			   			<td>
			   				<h5><strong>Sex</strong></h5>
				   			<select class="form-control" name="sex" form="form" >
				   				<option value="" <%if(sd.getString("sex").equals("")){ %>selected<%} %>>Select sex</option>
				   				<option value="m"<%if(sd.getString("sex").equals("m")){ %>selected<%} %>>Male</option>
				   				<option value="f"<%if(sd.getString("sex").equals("f")){ %>selected<%} %>>Female</option>
				   				<option value="o"<%if(sd.getString("sex").equals("o")){ %>selected<%} %>>Other</option>
				   			</select>
			   			</td>
			   			<td>
			   				<h5><strong>Mother Language</strong></h5>
			   				<select class="form-control" name="Language" form="form" >
				   				<option value=""<%if(sd.getString("smotherlanguage").isEmpty()){%>selected<%} %>>Select mother language</option>
				   				<option value="<%=sd.getString("smotherlanguage")%>" <%if(sd.getString("smotherlanguage").length()>0){%>selected<%} %>><%=sd.getString("smotherlanguage")%></option>
				   				<%
										while (language.next()) {
										%>
											<option value="<%=language.getString(2)%>"><%=language.getString(2) %></option>
											<%} %>
				   			</select>
			   			</td>
			   			<td>
			   				<h5><strong>Ethnic Group</strong></h5>
			   				<select class="form-control" name="SCast" form="form" >
				   				<option value="" selected>Select ethnic group</option>
				   				<%
										while (caste.next()) {
										%>
											<option value="<%=caste.getString(2)%>"><%=caste.getString(2) %></option>
											<%} %>
				   			</select>
			   			</td>
			   		</tr>
			   		<tr>
			   			<td>
			   				<h5><strong>Religion</strong></h5>
			   				<select class="form-control" name="SReligion" form="form" >
				   				<option value="" selected>Select religion</option>
				   				<option value="Hindu">Hindu</option>
				   				<option value="Muslim">Muslim</option>
				   				<option value="Buddhism">Buddhism</option>
				   				<option value="Christian">Christian</option>
				   			</select>
			   			</td>
			   			<td>
			   				<h5><strong>Differently-able?</strong></h5>
			   				<select class="form-control" name="DisabledYN" form="form" >
				   				<option value="n">No</option>
				   				<option value="y">Yes</option>
				   			</select>
			   			</td>
			   			<td>
			   				<h5 style="color:blue"><strong>If Differently-able yes</strong></h5>
			   				<select class="form-control" name="DisableType" form="form" >
			   					<option value="" selected >Select disabled type</option>
			   					<%
										while (disablelist.next()) {
										%>
											<option value="<%=disablelist.getString(1)%>"><%=disablelist.getString(2) %></option>
											<%} %>
				   			</select>
			   			</td>
			   		</tr>
			   		<tr>
			   			<td>
			   				<h5><strong>DOB(YYYYMMDD) B.S.</strong></h5>
			   				<input type="text" class="form-control" name="dob" maxlength="10" id="nepaliDate1" form="form" placeholder="2051-07-25" value="<%=sd.getString("dob")%>" >
			   			</td>
			   			<td>
			   				<h5><strong>DOB(YYYYMMDD) A.D.</strong></h5>
			   				<input type="text" class="form-control" name="doben" maxlength="10" form="form" id="englishDate1" placeholder="1994-11-11"  value="<%=sd.getString("doben")%>">
			   			</td>
			   		</tr>
			   		<tr>
			   			<td>
			   			<h4 style="text-decoration:underline;"><strong>Birth Certificate Detail:-</strong></h4>
			   			<hr>
			   			</td>
			   		</tr>
			   		<tr>
			   			<td>
			   				<h5><strong>Birth Certificate No.</strong></h5>
			   				<input type="text" class="form-control" name="birthcertificateno" form="form"  value="<%=sd.getString("sbirthcertificateno")%>">
			   			</td>
			   			<td>
			   				<h5><strong>Issued By</strong></h5>
			   				<input type="text" class="form-control" name="birthcertificateissuedby" form="form" value="<%=sd.getString("sbirthcertificateissuedby")%>">
			   			</td>
			   		</tr>
			   		<tr>
			   			<td>
			   				<h5><strong>Issued Date(YYYYMMDD) B.S.</strong></h5>
			   				<input type="text" class="form-control" name="birthcertificateissueddate" maxlength="10" id="nepaliDate2" form="form" placeholder="2051-07-25" value="<%=sd.getString("sbirthcertificateissueddate")%>">
			   			</td>
			   			<td>
			   				<h5><strong>Issued Date(YYYYMMDD) A.D.</strong></h5>
			   				<input type="text" class="form-control" name="birthcertificateissueddateen" maxlength="10" form="form" id="englishDate2" placeholder="1994-11-11" value="<%=sd.getString("sbirthcertificateissueddateen")%>">
			   			</td>
			   		</tr>
			   		<tr>
			   			<td>
			   			<h4 style="text-decoration:underline;"><strong>Permanent Address:-</strong></h4>
			   			<hr>
			   			</td>
			   		</tr>
			   		
			   		<tr>
			   			<td>
			   				<h5><strong>District</strong></h5>
			   				<select class="form-control selectpicker district" data-show-subtext="true" data-live-search="true" name="District" form="form" >
			   					<option value="" selected>Select district</option>
			   					<%
										while (districts.next()) {
										%>
											<option value="<%=districts.getString(1)%>"><%=districts.getString(2) %></option>
											<%} %>
				   			</select>
			   			</td>
			   			<td>
			   				<h5><strong>Municipality or Village Council</strong></h5>
			   				<select class="form-control vdcmun" name="VdcMun" form="form" >
			   					 <option value="" selected>Select muncipality or VDC</option>
				   			</select>
			   			</td>
			   			<td>
			   				<h5><strong>Ward No.</strong></h5>
			   				<select class="form-control wardno" name="WardNo" form="form" >
			   					<option  value="0" selected>Select ward no.</option>
				   			</select>
			   			</td>
			   		</tr>
			   		<tr>
			   			<td>
			   				<h5><strong>Tole</strong></h5>
			   				<input type="text" class="form-control" name="tole" form="form" value="<%=sd.getString("tole")%>">
			   			</td>
			   		</tr>
			   		<tr>
			   			<td>
			   				<h5><strong>Temp. Address</strong></h5>
			   				<input type="text" class="form-control" name="tempaddress" form="form" value="<%=sd.getString("tempaddress")%>">
			   			</td>
			   		</tr>
			   		
			   	</tbody>
			   </table>
			  </div>
			  <div id="2" class="tab-pane fade">
			     <table class="table">
				   	<tbody>
				   		<tr>
				   			<td><h4 style="text-decoration:underline"><strong>Father's Detail</strong></h4></td>
				   		</tr>
				   		<tr>
				   			<td>
				   			<h5><strong>Name</strong></h5>
				   			<input type="text" class="form-control" name="fathername" form="form" >
				   			</td>
				   			<td>
				   			<h5><strong>Address</strong></h5>
				   			<input type="text" class="form-control" name="faddress" form="form" >
				   			</td>
				   		</tr>
				   		<tr>
				   			<td>
				   			<h5><strong>Name of Office</strong></h5>
				   			<input type="text" class="form-control" name="foffice" form="form" >
				   			</td>
				   			<td>
					   			<h5><strong>Office Position</strong></h5>
					   			<input type="text" class="form-control" name="fposition" form="form" >
				   			</td>
				   			<td>
				   				<h5><strong>Expected Annual Income</strong></h5>
				   				<input type="text" class="form-control" name="fincome" value="0" form="form" >
				   			</td>
				   		</tr>
				   		<tr>
				   			<td>
				   				<h5><strong>Mobile No.</strong></h5>
				   				<input type="text" class="form-control" maxlength="10" name="fmobile" form="form" value="0">
				   			</td>
				   			<td>
				   				<h5><strong>Telephone No.</strong></h5>
				   				<input type="text" class="form-control" maxlength="10" name="ftelephone" form="form" value="0">
				   			</td>
				   			<td>
				   				<h5><strong>Email ID</strong></h5>
				   				<input type="email" class="form-control" name="femail" form="form" >
				   			</td>
				   			<td>
				   				<h5><strong>Emergency Contact No.</strong></h5>
				   				<input type="text" class="form-control" name="fephone" maxlength="10" form="form" value="0" >
				   			</td>
				   		</tr>
				   		<tr>
				   			<td>
				   				<h5><strong>Citizenship No.</strong></h5>
				   				<input type="text" class="form-control" name="fcitizenshipno" form="form" >
				   			</td>
				   			<td>
				   				<h5><strong>Issued By</strong></h5>
				   				<input type="text" class="form-control" name="fcitizenshipissuedby" form="form" >
				   			</td>
				   			<td>
				   				<h5><strong>Issued Date B.S.</strong></h5>
				   				<input type="text" class="form-control" name="fcitizenshipissueddate" maxlength="10" id="nepaliDate3" form="form" placeholder="2051-07-25" >
			   				</td>
				   			<td>
				   				<h5><strong>Issued Date A.D.</strong></h5>
				   				<input type="text" class="form-control" name="fcitizenshipissueddateen" maxlength="10" form="form" id="englishDate3" placeholder="1994-11-11" >
				   			</td>
				   		</tr>
				   		<tr>
				   			<td>
				   				<h5><strong>License No.</strong></h5>
				   				<input type="text" class="form-control" name="flicenseno" form="form" >
				   			</td>
				   			<td>
				   				<h5><strong>Issued By</strong></h5>
				   				<input type="text" class="form-control" name="flicenseissuedby" form="form" >
				   			</td>
				   			<td>
				   				<h5><strong>Issued Date B.S.</strong></h5>
				   				<input type="text" class="form-control" name="flicenseissueddate" maxlength="10" id="nepaliDate4" form="form" placeholder="2051-07-25" >
			   				</td>
				   			<td>
				   				<h5><strong>Issued Date A.D.</strong></h5>
				   				<input type="text" class="form-control" name="flicenseissueddateen" maxlength="10" form="form" id="englishDate4" placeholder="1994-11-11" >
				   			</td>
				   		</tr>
				   		<tr>
				   			<td>
				   				<h5><strong>Official Identity No.</strong></h5>
				   				<input type="text" class="form-control" name="fofficialidno" form="form" >
				   			</td>
				   			<td>
				   				<h5><strong>Issued By</strong></h5>
				   				<input type="text" class="form-control" name="fofficialidissuedby" form="form" >
				   			</td>
				   			<td>
				   				<h5><strong>Issued Date B.S.</strong></h5>
				   				<input type="text" class="form-control" name="fofficialidissueddate" maxlength="10" id="nepaliDate5" form="form" placeholder="2051-07-25" >
			   				</td>
				   			<td>
				   				<h5><strong>Issued Date A.D.</strong></h5>
				   				<input type="text" class="form-control" name="fofficialidissueddateen" maxlength="10" form="form" id="englishDate5" placeholder="1994-11-11" >
				   			</td>
				   		</tr>
				   		<tr>
				   			<td>
				   				<h5><strong>Voter ID No.</strong></h5>
				   				<input type="text" class="form-control" name="fvoteridno" form="form" >
				   			</td>
				   			<td>
				   				<h5><strong>Issued By</strong></h5>
				   				<input type="text" class="form-control" name="fvoteridissuedby" form="form" >
				   			</td>
				   			<td>
				   				<h5><strong>Issued Date B.S.</strong></h5>
				   				<input type="text" class="form-control" name="fvoteridissueddate" maxlength="10" id="nepaliDate6" form="form" placeholder="2051-07-25" >
			   				</td>
				   			<td>
				   				<h5><strong>Issued Date A.D.</strong></h5>
				   				<input type="text" class="form-control" name="fvoteridissueddateen" maxlength="10" form="form" id="englishDate6" placeholder="1994-11-11" >
				   			</td>
				   		</tr>
				   		<tr>
				   			<td>
				   				<h5><strong>Passport No.</strong></h5>
				   				<input type="text" class="form-control" name="fpassportno" form="form" >
				   			</td>
				   			<td>
				   				<h5><strong>Issued By</strong></h5>
				   				<input type="text" class="form-control" name="fpassportissuedby" form="form" >
				   			</td>
				   			<td>
				   				<h5><strong>Issued Date B.S.</strong></h5>
				   				<input type="text" class="form-control" name="fpassportissueddate" maxlength="10" id="nepaliDate7" form="form" placeholder="2051-07-25" >
			   				</td>
				   			<td>
				   				<h5><strong>Issued Date A.D.</strong></h5>
				   				<input type="text" class="form-control" name="fpassportissueddateen" maxlength="10" form="form" id="englishDate7" placeholder="1994-11-11" >
				   			</td>
				   		</tr>
				   		</tbody>
				   		</table>
				   		</div>
				   		<div id="5" class="tab-pane fade">
			     			<table class="table">
						   		<tr>
						   			<td>
						   			<h4 style="text-decoration:underline;"><strong>Mother's Detail</strong></h4>
						   			</td>
						   		</tr>
						   		<tr>
						   			<td>
						   			<h5><strong>Name</strong></h5>
						   			<input type="text" class="form-control" name="mothername" form="form" >
						   			</td>
						   			<td>
						   			<h5><strong>Address</strong></h5>
						   			<input type="text" class="form-control" name="maddress" form="form" >
						   			</td>
						   		</tr>
						   		<tr>
						   			<td>
						   			<h5><strong>Name of Office</strong></h5>
						   			<input type="text" class="form-control" name="moffice" form="form" >
						   			</td>
						   			<td>
							   			<h5><strong>Office Position</strong></h5>
							   			<input type="text" class="form-control" name="mposition" form="form" >
						   			</td>
						   			<td>
						   				<h5><strong>Expected Annual Income</strong></h5>
						   				<input type="text" class="form-control" name="mincome" value="0" form="form" >
						   			</td>
						   		</tr>
						   		<tr>
						   			<td>
						   				<h5><strong>Mobile No.</strong></h5>
						   				<input type="text" class="form-control" maxlength="10" name="mmobile" form="form" value="0" >
						   			</td>
						   			<td>
						   				<h5><strong>Telephone No.</strong></h5>
						   				<input type="text" class="form-control" maxlength="10" name="mtelephone" form="form" value="0" >
						   			</td>
						   			<td>
						   				<h5><strong>Email ID</strong></h5>
						   				<input type="email" class="form-control" name="memail" form="form" >
						   			</td>
						   			<td>
						   				<h5><strong>Emergency Contact No.</strong></h5>
						   				<input type="text" class="form-control" maxlength="10" name="mephone" form="form" value="0">
						   			</td>
						   		</tr>
						   		<tr>
						   			<td>
						   				<h5><strong>Citizenship No.</strong></h5>
						   				<input type="text" class="form-control" name="mcitizenshipno" form="form" >
						   			</td>
						   			<td>
						   				<h5><strong>Issued By</strong></h5>
						   				<input type="text" class="form-control" name="mcitizenshipissuedby" form="form" >
						   			</td>
						   			<td>
						   				<h5><strong>Issued Date B.S.</strong></h5>
						   				<input type="text" class="form-control" name="mcitizenshipissueddate" maxlength="10" id="nepaliDate8" form="form" placeholder="2051-07-25" >
					   				</td>
						   			<td>
						   				<h5><strong>Issued Date A.D.</strong></h5>
						   				<input type="text" class="form-control" name="mcitizenshipissueddateen" maxlength="10" form="form" id="englishDate8" placeholder="1994-11-11" >
						   			</td>
						   		</tr>
						   		<tr>
						   			<td>
						   				<h5><strong>License No.</strong></h5>
						   				<input type="text" class="form-control" name="mlicenseno" form="form" >
						   			</td>
						   			<td>
						   				<h5><strong>Issued By</strong></h5>
						   				<input type="text" class="form-control" name="mlicenseissuedby" form="form" >
						   			</td>
						   			<td>
						   				<h5><strong>Issued Date B.S.</strong></h5>
						   				<input type="text" class="form-control" name="mlicenseissueddate" maxlength="10" id="nepaliDate9" form="form" placeholder="2051-07-25" >
					   				</td>
						   			<td>
						   				<h5><strong>Issued Date A.D.</strong></h5>
						   				<input type="text" class="form-control" name="mlicenseissueddateen" maxlength="10" form="form" id="englishDate9" placeholder="1994-11-11" >
						   			</td>
						   		</tr>
						   		<tr>
						   			<td>
						   				<h5><strong>Official Identity No.</strong></h5>
						   				<input type="text" class="form-control" name="mofficialidno" form="form" >
						   			</td>
						   			<td>
						   				<h5><strong>Issued By</strong></h5>
						   				<input type="text" class="form-control" name="mofficialidissuedby" form="form" >
						   			</td>
						   			<td>
						   				<h5><strong>Issued Date B.S.</strong></h5>
						   				<input type="text" class="form-control" name="mofficialidissueddate" maxlength="10" id="nepaliDate10" form="form" placeholder="2051-07-25" >
					   				</td>
						   			<td>
						   				<h5><strong>Issued Date A.D.</strong></h5>
						   				<input type="text" class="form-control" name="mofficialidissueddateen" maxlength="10" form="form" id="englishDate10" placeholder="1994-11-11" >
						   			</td>
						   		</tr>
						   		<tr>
						   			<td>
						   				<h5><strong>Voter ID No.</strong></h5>
						   				<input type="text" class="form-control" name="mvoteridno" form="form" >
						   			</td>
						   			<td>
						   				<h5><strong>Issued By</strong></h5>
						   				<input type="text" class="form-control" name="mvoteridissuedby" form="form" >
						   			</td>
						   			<td>
						   				<h5><strong>Issued Date B.S.</strong></h5>
						   				<input type="text" class="form-control" name="mvoteridissueddate" maxlength="10" id="nepaliDate11" form="form" placeholder="2051-07-25" >
					   				</td>
						   			<td>
						   				<h5><strong>Issued Date A.D.</strong></h5>
						   				<input type="text" class="form-control" name="mvoteridissueddateen" maxlength="10" form="form" id="englishDate11" placeholder="1994-11-11" >
						   			</td>
						   		</tr>
						   		<tr>
						   			<td>
						   				<h5><strong>Passport No.</strong></h5>
						   				<input type="text" class="form-control" name="mpassportno" form="form" >
						   			</td>
						   			<td>
						   				<h5><strong>Issued By</strong></h5>
						   				<input type="text" class="form-control" name="mpassportissuedby" form="form" >
						   			</td>
						   			<td>
						   				<h5><strong>Issued Date B.S.</strong></h5>
						   				<input type="text" class="form-control" name="mpassportissueddate" maxlength="10" id="nepaliDate12" form="form" placeholder="2051-07-25" >
					   				</td>
						   			<td>
						   				<h5><strong>Issued Date A.D.</strong></h5>
						   				<input type="text" class="form-control" name="mpassportissueddateen" maxlength="10" form="form" id="englishDate12" placeholder="1994-11-11" >
						   			</td>
						   		</tr>
				   	</tbody>
			   	</table>
			  </div>
			  <div id="3" class="tab-pane fade">
			  	<table class="table">
			  		<tbody>
			  			<tr>
				   			<td>
					   			<h5><strong>Name 1</strong></h5>
					   			<input type="text" class="form-control" name="local1" form="form" >
				   			</td>
				   			<td>
					   			<h5><strong>Relation Type 1</strong></h5>
					   			<select class="form-control" name="relationtype1" form="form" >
					   				<option value="" selected>Select relation type</option>
									<option value="Grand Father">Grand Father</option>
									<option value="Grand Mother">Grand Mother</option>
									<option value="Aunt">Aunt</option>
									<option value="Uncle">Uncle</option>
									<option value="Sister">Sister</option>
									<option value="Brother">Brother</option>
									<option value="Cousin">Cousin</option>
									<option value="Nephew">Nephew</option>
									<option value="Sister in law">Sister in law</option>
									<option value="Brother in law">Brother in law</option>
									<option value="Daughter in law">Daughter in law</option>
									<option value="Son in law">Son in law</option>
					   			</select>
				   			</td>
				   			<td>
					   			<h5><strong>Address 1</strong></h5>
					   			<input type="text" class="form-control" name="localadd1" form="form" >
				   			</td>
				   			<td>
					   			<h5><strong>Mobile No. 1</strong></h5>
					   			<input type="text" class="form-control" maxlength="10" name="localmob1" form="form" value="0" >
				   			</td>
				   		</tr>
				   		<tr>
				   			<td>
					   			<h5><strong>Name 2</strong></h5>
					   			<input type="text" class="form-control"  name="local2" form="form"  >
				   			</td>
				   			<td>
					   			<h5><strong>Relation Type 2</strong></h5>
					   			<select class="form-control" name="relationtype2" form="form" >
					   				<option selected value="">Select relation type</option>
									<option value="Grand Father">Grand Father</option>
									<option value="Grand Mother">Grand Mother</option>
									<option value="Aunt">Aunt</option>
									<option value="Uncle">Uncle</option>
									<option value="Sister">Sister</option>
									<option value="Brother">Brother</option>
									<option value="Cousin">Cousin</option>
									<option value="Nephew">Nephew</option>
									<option value="Sister in law">Sister in law</option>
									<option value="Brother in law">Brother in law</option>
									<option value="Daughter in law">Daughter in law</option>
									<option value="Son in law">Son in law</option>
					   			</select>
				   			</td>
				   			<td>
					   			<h5><strong>Address 2</strong></h5>
					   			<input type="text" class="form-control" name="localadd2" form="form" >
				   			</td>
				   			<td>
					   			<h5><strong>Mobile No. 2</strong></h5>
					   			<input type="text" class="form-control" maxlength="10" name="localmob2" form="form" value="0">
				   			</td>
				   		</tr>
				   		
			  		</tbody>
			  	</table>
			    
			  </div>
			  <div id="4" class="tab-pane fade">
			    <table class="table">
			  		<tbody>
			  			<tr>
				   			<td>
					   			<h5><strong>Admission Class</strong></h5>
					   			<select class="form-control" name="admissionclass" form="form" required>
					   				<option selected value="">Select admission class</option>
					   				<option value="Nursery">Nursery</option>
					   				<option value="L.K.G">L.K.G</option>
					   				<option value="U.K.G">U.K.G</option>
					   				<option value="1">1</option>
					   				<option value="2">2</option>
					   				<option value="3">3</option>
					   				<option value="4">4</option>
					   				<option value="5">5</option>
					   				<option value="6">6</option>
					   				<option value="7">7</option>
					   				<option value="8">8</option>
					   				<option value="9">9</option>
					   				<option value="10">10</option>
					   				<option value="11">11</option>
					   				<option value="12">12</option>
					   			</select>
				   			</td>
				   			<td>
					   			<h5><strong>Section</strong></h5>
					   			<select  class="form-control" name="section" form="form" >
					   				<option selected value="">Select section</option>
					   				<%
										while (section.next()) {
										%>
											<option value="<%=section.getString(2)%>"><%=section.getString(2) %></option>
											<%} %>
					   			</select>
				   			</td>
				   			<td>
					   			<h5><strong>Roll No.</strong></h5>
					   			<input type="text" class="form-control" name="rollno" form="form">
				   			</td>
				   		</tr>
				   		<tr>
				   			<td>
					   			<h5><strong>House Group</strong></h5>
					   			<select class="form-control" name="housegroup" form="form" >
					   				<option value="" selected>Select house group</option>
					   				<%
										while (housegroup.next()) {
										%>
											<option value="<%=housegroup.getString(2)%>"><%=housegroup.getString(2) %></option>
											<%} %>
					   			</select>
				   			</td>
				   			<td>
					   			<h5><strong>Previous School</strong></h5>
					   			<input type="text" class="form-control" name="oldschool" form="form" >
				   			</td>
				   			<td>
					   			<h5><strong>Reason For Leaving</strong></h5>
					   			<input type="text" class="form-control" name="reasonleav" form="form" >
				   			</td>
				   		</tr>
				   		<tr>
				   			<td>
					   			<h5><strong>Hobby</strong></h5>
					   			<input type="text" class="form-control" name="hobby" form="form" >
				   			</td>
				   			<td>
					   			<h5><strong>Special Interest</strong></h5>
					   			<select class="form-control" name="specialinterest" form="form" >
					   				<option value="" selected>Select special interest</option>
					   				<%
										while (specialinterest.next()) {
										%>
											<option value="<%=specialinterest.getString(2)%>"><%=specialinterest.getString(2) %></option>
											<%} %></select>
				   			</td>
				   		</tr>
				   		
			  		</tbody>
			  	</table>
			  </div>
			</div>
  		</div>
	</div>
	<script src="assets/js/dynamicselector.js"></script>
	<script src="assets/js/dateConverter.js"></script>
	<script>
	$('#form').submit(function() {
	  
	    return confirm('CONFIRM REGISTRATION?'); // return false to cancel form action
	});
	</script>
	
	<%}}%>