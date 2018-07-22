<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
img {
	width: auto;
	height: auto;
	max-height: 100%;
	max-width: 100%;
}
</style>
</head>

<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Student</li>
				<li class="breadcrumb-item active" aria-current="page">Student
					Admission</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>STUDENT Edit</h2>

				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
<spring:url value="/student/updateStudent" var="updateUrl"/>

				<form method="get" action="${updateUrl }" id="form"></form>
				<button type="submit" class="btn btn-success " form="form">
					<i class="fa fa-check"></i> Update
				</button>
				<a href="<spring:url value="/student/deleteStudent/${studentid }"></spring:url>" class="btn btn-danger delete">X Delete</a>
				<div class="clearfix"></div>

			</div>
			<div class="x_content">
				<div class="" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
						<li role="presentation" class="active"><a
							href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
							aria-expanded="true">Personal Details</a></li>
						<li role="presentation" class=""><a href="#tab_content2"
							role="tab" id="profile-tab" data-toggle="tab"
							aria-expanded="false">Father Details</a></li>
						<li role="presentation" class=""><a href="#tab_content3"
							role="tab" id="profile-tab2" data-toggle="tab"
							aria-expanded="false">Mother Details</a></li>
						<li role="presentation" class=""><a href="#tab_content4"
							role="tab" id="profile-tab3" data-toggle="tab"
							aria-expanded="false">Local Guardian Details</a></li>
						<li role="presentation" class=""><a href="#tab_content5"
							role="tab" id="profile-tab4" data-toggle="tab"
							aria-expanded="false">Academic Details</a></li>
						<li role="presentation" class=""><a href="#tab_content6"
							role="tab" id="profile-tab5" data-toggle="tab"
							aria-expanded="false">Uploads</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade active in"
							id="tab_content1" aria-labelledby="home-tab">
							<table class="table">
								<tbody>
									<tr>
										<td>
											<h6>
												<strong>Student Legacy ID</strong>
											</h6> <input type="hidden" name="studentid"
											value="${student.studentid}" form="form"> <input
											type="text" class="form-control" name="LegacyId" form="form"
											value="${student.legacyId}">
										</td>
										<td>
											<h6>
												<strong>Student Name</strong>
											</h6> <input type="text" class="form-control" name="studentname"
											id="studentname" form="form" value="${student.studentname}" pattern="^[a-zA-Z ][a-zA-Z ]{1,30}"">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Sex</strong>
											</h6> <select class="form-control" name="sex" form="form">
												<option value="">Select sex</option>

												<option value="m"
													<c:if test="${student.sex eq 'm' }">selected</c:if>>Male</option>
												<option value="f"
													<c:if test="${student.sex eq 'f' }">selected</c:if>>FeMale</option>
												<option value="o"
													<c:if test="${student.sex eq 'o' }">selected</c:if>>Other</option>
										</select>
										</td>
										<td>
											<h6>
												<strong>Mother Language</strong>
											</h6> <select class="form-control" name="Language" form="form">
												<option value="">Select mother language</option>

												<c:forEach items="${language }" var="lan">
													<option value="${lan.languageid }"
														<c:if test="${student.formdetail.languageid eq lan.languageid }">selected</c:if>>${lan.languagename }</option>
												</c:forEach>


										</select>
										</td>
										<td>
											<h6>
												<strong>Ethnic Group</strong>
											</h6> <select class="form-control" name="sCast" form="form">
												<option value="">Select ethnic group</option>

												<c:forEach items="${caste }" var="caste">
													<option value="${caste.casteid }"
														<c:if test="${student.sethinicgroup eq caste.casteid }">selected</c:if>>${caste.castename }</option>
												</c:forEach>

										</select>
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Religion</strong>
											</h6> <select class="form-control" name="sReligion" form="form">
												<option value="">Select religion</option>
												<option value="Hindu"
													<c:if test="${student.sReligion eq 'Hindu' }">selected</c:if>>Hindu</option>
												<option value="Muslim"
													<c:if test="${student.sReligion eq 'Muslim' }">selected</c:if>>Muslim</option>
												<option value="Buddhism"
													<c:if test="${student.sReligion eq 'Buddhism' }">selected</c:if>>
													Buddhism</option>
												<option value="Christian"
													<c:if test="${student.sReligion eq 'Christian' }">selected</c:if>>Christian</option>
										</select>
										</td>
										<td>
											<h6>
												<strong>Differently-able?</strong>
											</h6> <select class="form-control" name="differentlyabledYN"
											form="form">
												<option value="n"
													<c:if test="${student.differentlyabledYN eq 'n' }">selected</c:if>>No</option>
												<option value="y"
													<c:if test="${student.differentlyabledYN eq 'y' }">selected</c:if>>Yes</option>
										</select>
										</td>
										<td>
											<h5 style="color: blue">
												<strong>If Differently-able yes</strong>
											</h5> <select class="form-control" name="differentlyabledtype"
											form="form">
												<option value="">Select disabled type</option>

												<c:forEach items="${disabledlist }" var="disabled">
													<option value="${disabled.id }"
														<c:if test="${student.differentlyabledtype eq disabled.id }">selected</c:if>>${disabled.typehead }</option>
												</c:forEach>


										</select>
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>DOB(YYYY-MM-DD) B.S.</strong>
											</h6> <input type="text" class="form-control dob" name="dob"
											maxlength="10" id="nepaliDate1" form="form"
											placeholder="2051-07-25" value="${student.dob}"  onblur="nepaliToEnglish('.dob','.doben')"
											pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])">
										</td>
										<td>
											<h6>
												<strong>DOB(YYYY-MM-DD) A.D.</strong>
											</h6> <input type="text" class="form-control doben" name="doben"
											maxlength="10" form="form" id="englishDate1"
											placeholder="1994-11-11" value="${student.doben}" 
											pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" onblur="englishToNepali('.dob','.doben')">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Admission Date(YYYY-MM-DD) B.S.</strong>
											</h6> <input type="text" class="form-control addate" name="admissiondate"
											maxlength="10" id="nepaliDate14" form="form"
											placeholder="2051-07-25" value="${student.admissiondate}" 
											pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" onblur="nepaliToEnglish('.addate','.addateen')">
										</td>
										<td>
											<h6>
												<strong>Admission Date(YYYYMMDD) A.D.</strong>
											</h6> <input type="text" class="form-control addateen"
											name="admissiondateen" maxlength="10" form="form"
											id="englishDate14" placeholder="1994-11-11"
											value="${student.admissiondateen}"
											pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" onblur="englishToNepali('.addate','.addateen')">
										</td>
									</tr>

									<tr>
										<td>
											<h4 style="text-decoration: underline;">
												<strong>Birth Certificate Detail:-</strong>
											</h4>
											<hr>
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Birth Certificate No.</strong>
											</h6> <input type="text" class="form-control"
											name="birthcertificateno" form="form"
											value="${student.birthcertificateno}" pattern="[0-9]+">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="birthcertificateissuedby" form="form"
											value="${student.birthcertificateissuedby}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Issued Date(YYYYMMDD) B.S.</strong>
											</h6> <input type="text" class="form-control isdate"
											name="birthcertificateissueddate" maxlength="10"
											id="nepaliDate2" form="form" placeholder="2051-07-25"
											value="${student.birthcertificateissueddate}" onblur="nepaliToEnglish('.isdate','.isdateen')">
										</td>
										<td>
											<h6>
												<strong>Issued Date(YYYYMMDD) A.D.</strong>
											</h6> <input type="text" class="form-control isdateen"
											name="birthcertificateissueddateen" maxlength="10"
											form="form" id="englishDate2" placeholder="1994-11-11"
											value="${student.birthcertificateissueddateen}" onblur="englishToNepali('.isdate','.isdateen')">
										</td>
									</tr>
									<tr>
										<td>
											<h4 style="text-decoration: underline;">
												<strong>Contact Details:</strong>
											</h4>
											<hr>
										</td>
									</tr>

									<tr>
										<td>
											<h6>
												<strong>District</strong>
											</h6> <select class="form-control selectpicker edistrict"
											data-show-subtext="true" data-live-search="true"
											name="district" form="form">
												<option value="">Select district</option>


												<c:forEach items="${dislist }" var="dis">
													<option value="${dis.districtCode }"
														<c:if test="${student.district eq dis.districtCode }">selected</c:if>>${dis.districtName }</option>
												</c:forEach>

										</select>
										</td>
										<td>
											<h6>
												<strong>Municipality or Village Council</strong>
											</h6> <select class="form-control evdcmun" name="vdcMun"
											form="form">
												<option value="" >Select muncipality or
													VDC</option>
													<option value="${student.vdcMun }" selected="">${student.vdcMun }</option>
													
										</select>
										</td>
										<td>
											<h6>
												<strong>Ward No.</strong>
											</h6> <select class="form-control wardno" name="wardNo"
											form="form">
												<option value="0" >Select ward no.</option>
												<option value="${student.wardNo }" selected>${student.wardNo }</option>
										</select>
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Tole</strong>
											</h6> <input type="text" class="form-control" name="tole"
											form="form" value="${student.tole}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Temp. Address</strong>
											</h6> <input type="text" class="form-control" name="tempaddress"
											form="form" value="${student.tempaddress}">
										</td>
									</tr>

								</tbody>
							</table>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content2"
							aria-labelledby="profile-tab">
							<table class="table">
								<tbody>
									<tr>
										<td><h4 style="text-decoration: underline">
												<strong>Father's Detail</strong>
											</h4></td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Name</strong>
											</h6> <input type="text" class="form-control" name="fathername"
											form="form" value="${student.fathername}">
										</td>
										<td>
											<h6>
												<strong>Address</strong>
											</h6> <input type="text" class="form-control" name="faddress"
											form="form" value="${student.faddress}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Name of Office</strong>
											</h6> <input type="text" class="form-control" name="foffice"
											form="form" value="${student.foffice}">
										</td>
										<td>
											<h6>
												<strong>Office Position</strong>
											</h6> <input type="text" class="form-control" name="fposition"
											form="form" value="${student.fposition}">
										</td>
										<td>
											<h6>
												<strong>Expected Annual Income</strong>
											</h6> <input type="text" class="form-control" name="fincome"
											value="${student.fincome}" form="form">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Mobile No.</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="fmobile" form="form" value="${student.fmobile}" pattern="[0-9]+">
										</td>
										<td>
											<h6>
												<strong>Telephone No.</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="ftelephone" form="form" value="${student.ftelephone}" pattern="[0-9]+">
										</td>
										<td>
											<h6>
												<strong>Email ID</strong>
											</h6> <input type="email" class="form-control" name="femail"
											form="form" value="${student.femail}">
										</td>
										<td>
											<h6>
												<strong>Emergency Contact No.</strong>
											</h6> <input type="text" class="form-control" name="fephone"
											maxlength="10" form="form" value="${student.fephone}" pattern="[0-9]+">
										</td>
									</tr>
									
								</tbody>
							</table>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content3"
							aria-labelledby="profile-tab">
							<table class="table">
								<tbody>
									<tr>
										<td>
											<h4 style="text-decoration: underline;">
												<strong>Mother's Detail</strong>
											</h4>
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Name</strong>
											</h6> <input type="text" class="form-control" name="mothername"
											form="form" value="${student.mothername}">
										</td>
										<td>
											<h6>
												<strong>Address</strong>
											</h6> <input type="text" class="form-control" name="maddress"
											form="form" value="${student.maddress}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Name of Office</strong>
											</h6> <input type="text" class="form-control" name="moffice"
											form="form" value="${student.moffice}">
										</td>
										<td>
											<h6>
												<strong>Office Position</strong>
											</h6> <input type="text" class="form-control" name="mposition"
											form="form" value="${student.mposition}">
										</td>
										<td>
											<h6>
												<strong>Expected Annual Income</strong>
											</h6> <input type="text" class="form-control" name="mincome"
											value="${student.mincome}" form="form">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Mobile No.</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="mmobile" form="form" value="${student.mmobile}">
										</td>
										<td>
											<h6>
												<strong>Telephone No.</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="mtelephone" form="form" value="${student.mtelephone}">
										</td>
										<td>
											<h6>
												<strong>Email ID</strong>
											</h6> <input type="email" class="form-control" name="memail"
											form="form" value="${student.memail}">
										</td>
										<td>
											<h6>
												<strong>Emergency Contact No.</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="mephone" form="form" value="${student.mephone}">
										</td>
									</tr>
									
								</tbody>
							</table>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content4"
							aria-labelledby="profile-tab">
							<table class="table">
								<tbody>
									<tr>
										<td>
											<h6>
												<strong>Name 1</strong>
											</h6> <input type="text" class="form-control" name="local1"
											form="form" value="${localguardian[0].localguardianname}">
										</td>
										<td>
											<h6>
												<strong>Relation Type 1</strong>
											</h6> <select class="form-control" name="relationtype1"
											form="form">
											<c:if test="${not empty localguardian[0].relationtype }">
											<option value="${localguardian[0].relationtype}" selected>${localguardian[0].relationtype}</option>
											</c:if>
											
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
											<h6>
												<strong>Address 1</strong>
											</h6> <input type="text" class="form-control" name="localadd1"
											form="form" value="${localguardian[0].localadd}">
										</td>
										<td>
											<h6>
												<strong>Mobile No. 1</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="localmob1" form="form" value="${localguardian[0].localmob}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Name 2</strong>
											</h6> <input type="text" class="form-control" name="local2"
											form="form" value="${localguardian[1].localguardianname}">
										</td>
										<td>
										
											<h6>
												<strong>Relation Type 2</strong>
											</h6> <select class="form-control" name="relationtype2"
											form="form">
												
												<option value="${localguardian[1].relationtype}">${localguardian[1].relationtype}</option>
												
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
											<h6>
												<strong>Address 2</strong>
											</h6> <input type="text" class="form-control" name="localadd2"
											form="form" value="${localguardian[1].localadd}">
										</td>
										<td>
											<h6>
												<strong>Mobile No. 2</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="localmob2" form="form" value="${localguardian[1].localmob}">
										</td>
									</tr>

								</tbody>
							</table>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content5"
							aria-labelledby="profile-tab">
							<table class="table">
								<tbody>
									<tr>
										<td>
											<h6>
												<strong>Admission Class</strong>
											</h6> <select class="form-control" name="admissionclass"
											form="form">
												<option selected="" value="">Select admission class</option>

												<c:forEach items="${classlist}" var="cl">
													<option value="${cl.classname}"
														<c:if test="${student.admissionclass eq cl.classname }">selected</c:if>>${cl.classname }</option>

												</c:forEach>



										</select>
										</td>
										<td>
											<h6>
												<strong>Section</strong>
											</h6> <select class="form-control" name="section" form="form">
												<option selected="" value="">Select section</option>

												<c:forEach items="${section}" var="sec">
													<option value="${sec.sectionname}"
														<c:if test="${student.section eq sec.sectionname }">selected</c:if>>${sec.sectionname }</option>
												</c:forEach>



										</select>
										</td>
										<td>
											<h6>
												<strong>Roll No.</strong>
											</h6> <input type="text" class="form-control" name="rollno"
											form="form" value="${student.rollno}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>House Group</strong>
											</h6> <select class="form-control" name="housegroup" form="form">
												<option value="" selected="">Select house group</option>
												<c:forEach items="${housegroup}" var="h">
													<option value="${h.housegroupid}"
														<c:if test="${student.housegroup eq h.housegroupid }">selected</c:if>>${h.housegroupname }</option>
												</c:forEach>


										</select>
										</td>
										<td>
											<h6>
												<strong>Previous School</strong>
											</h6> <input type="text" class="form-control" name="oldschool"
											form="form" value="${student.oldschool}">
										</td>
										<td>
											<h6>
												<strong>Reason For Leaving</strong>
											</h6> <input type="text" class="form-control" name="reasonleav"
											form="form" value="${student.reasonleav}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Hobby</strong>
											</h6> <input type="text" class="form-control" name="hobby"
											form="form" value="${student.hobby}">
										</td>
										<td>
											<h6>
												<strong>Special Interest</strong>
											</h6> <select class="form-control" name="specialinterest"
											form="form">
												<option value="" >Select special
													interest</option>
												<c:forEach items="${interest}" var="i">
													<option value="${i.specialInterestId}" <c:if test="${student.specialinterest eq i.specialInterestId }">selected</c:if>>${i.specialInterestName}</option>
												</c:forEach>



										</select>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content6"
							aria-labelledby="profile-tab">
							<div class="col-md-6" style="height: 250px;">
							
								<img src="../studentImage?id=${student.studentid }" class="img-thumbnail">
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>function nepaliToEnglish(nepalidate,englishdate){
	var date = $(nepalidate).val();
	var dataString = {'nepalidate' : date};
	$.ajax({
		type : "POST",
		url : "../../nav/nepaliToEnglish",
		data : dataString,
		cache : false,
		success : function(html) {
		 	$(englishdate).val(html); 
		},
	error : function() {
		alert("error occured");
	}
	
	});
}
function englishToNepali(nepalidate,englishdate){
	var date = $(englishdate).val();
	var dataString = {
		'englishdate' : date
	};
	$.ajax({
		type : "POST",
		url : "../../nav/englishToNepali",
		data : dataString,
		cache : false,
		success : function(html) {
			$(nepalidate).val(html);
		},
		error : function() {
			alert("error occured");
		}
	});
}

$(document).ready(function()
		{
	$(".edistrict").change(function()
	{
	var id=$(this).val();
	var dataString = 'id='+ id;
	$.ajax
	({
	type: "POST",
	url: "../../nav/viewMuncipality",
	data: dataString,
	cache: false,
	success: function(html)
	{
	$(".evdcmun").html(html);
	} 
	});
});
	$(".evdcmun").change(function()
			{
			var id=$(this).val();
			var dataString = 'id='+ id;
			$.ajax
			({
			type: "POST",
			url: "../../nav/viewWardNo",
			data: dataString,
			cache: false,
			success: function(html)
			{
			$(".wardno").html(html);
			} 
			});
			});
	});
$(".delete").click(function(){
	return confirm('Delete Confirm?');
});
</script>
</body>
</html>

