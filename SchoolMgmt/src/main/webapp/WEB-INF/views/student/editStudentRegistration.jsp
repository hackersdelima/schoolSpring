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

				<form method="get" action="<spring:url value="/student/updateStudent"></spring:url>" id="form"></form>
				<button type="submit" class="btn btn-success " form="form">
					<i class="fa fa-check"></i> Update
				</button>
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
											</h6> <input type="hidden" name="studentId"
											value="${student.studentid}" form="form"> <input
											type="text" class="form-control" name="LegacyId" form="form"
											value="${student.legacyId}">
										</td>
										<td>
											<h6>
												<strong>Student Name</strong>
											</h6> <input type="text" class="form-control" name="studentname"
											id="studentname" form="form" value="${student.studentname}">
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
											</h6> <input type="text" class="form-control" name="dob"
											maxlength="10" id="nepaliDate1" form="form"
											placeholder="2051-07-25" value="${student.dob}">
										</td>
										<td>
											<h6>
												<strong>DOB(YYYY-MM-DD) A.D.</strong>
											</h6> <input type="text" class="form-control" name="doben"
											maxlength="10" form="form" id="englishDate1"
											placeholder="1994-11-11" value="${student.doben}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Admission Date(YYYY-MM-DD) B.S.</strong>
											</h6> <input type="text" class="form-control" name="admissiondate"
											maxlength="10" id="nepaliDate14" form="form"
											placeholder="2051-07-25" value="${student.admissiondate}">
										</td>
										<td>
											<h6>
												<strong>Admission Date(YYYYMMDD) A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="admissiondateen" maxlength="10" form="form"
											id="englishDate14" placeholder="1994-11-11"
											value="${student.admissiondateen}">
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
											value="${student.birthcertificateno}">
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
											</h6> <input type="text" class="form-control"
											name="birthcertificateissueddate" maxlength="10"
											id="nepaliDate2" form="form" placeholder="2051-07-25"
											value="${student.birthcertificateissueddate}">
										</td>
										<td>
											<h6>
												<strong>Issued Date(YYYYMMDD) A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="birthcertificateissueddateen" maxlength="10"
											form="form" id="englishDate2" placeholder="1994-11-11"
											value="${student.birthcertificateissueddateen}">
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
											</h6> <select class="form-control selectpicker district"
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
											</h6> <select class="form-control vdcmun" name="vdcMun"
											form="form">
												<option value="" selected="">Select muncipality or
													VDC</option>
										</select>
										</td>
										<td>
											<h6>
												<strong>Ward No.</strong>
											</h6> <select class="form-control wardno" name="wardNo"
											form="form">
												<option value="0" selected="">Select ward no.</option>
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
											name="fmobile" form="form" value="${student.fmobile}">
										</td>
										<td>
											<h6>
												<strong>Telephone No.</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="ftelephone" form="form" value="${student.ftelephone}">
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
											maxlength="10" form="form" value="${student.fephone}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Citizenship No.</strong>
											</h6> <input type="text" class="form-control"
											name="fcitizenshipno" form="form"
											value="${student.fcitizenshipno}">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="fcitizenshipissuedby" form="form"
											value="${student.fcitizenshipissuedby}">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="fcitizenshipissueddate" maxlength="10" id="nepaliDate3"
											form="form" placeholder="2051-07-25"
											value="${student.fcitizenshipissueddate}">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="fcitizenshipissueddateen" maxlength="10" form="form"
											id="englishDate3" placeholder="1994-11-11"
											value="${student.fcitizenshipissueddateen}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>License No.</strong>
											</h6> <input type="text" class="form-control" name="flicenseno"
											form="form" value="${student.flicenseno}">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="flicenseissuedby" form="form"
											value="${student.flicenseissuedby}">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="flicenseissueddate" maxlength="10" id="nepaliDate4"
											form="form" placeholder="2051-07-25"
											value="${student.flicenseissueddate}">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="flicenseissueddateen" maxlength="10" form="form"
											id="englishDate4" placeholder="1994-11-11"
											value="${student.flicenseissueddateen}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Official Identity No.</strong>
											</h6> <input type="text" class="form-control" name="fofficialidno"
											form="form" value="${student.fofficialidno}">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="fofficialidissuedby" form="form"
											value="${student.fofficialidissuedby}">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="fofficialidissueddate" maxlength="10" id="nepaliDate5"
											form="form" placeholder="2051-07-25"
											value="${student.fofficialidissueddate}">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="fofficialidissueddateen" maxlength="10" form="form"
											id="englishDate5" placeholder="1994-11-11"
											value="${student.fofficialidissueddateen}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Voter ID No.</strong>
											</h6> <input type="text" class="form-control" name="fvoteridno"
											form="form" value="${student.fvoteridno}">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="fvoteridissuedby" form="form"
											value="${student.fvoteridissuedby}">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="fvoteridissueddate" maxlength="10" id="nepaliDate6"
											form="form" placeholder="2051-07-25"
											value="${student.fvoteridissueddate}">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="fvoteridissueddateen" maxlength="10" form="form"
											id="englishDate6" placeholder="1994-11-11"
											value="${student.fvoteridissueddateen}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Passport No.</strong>
											</h6> <input type="text" class="form-control" name="fpassportno"
											form="form" value="${student.fpassportno}">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="fpassportissuedby" form="form"
											value="${student.fpassportissuedby}">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="fpassportissueddate" maxlength="10" id="nepaliDate7"
											form="form" placeholder="2051-07-25"
											value="${student.fpassportissueddate}">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="fpassportissueddateen" maxlength="10" form="form"
											id="englishDate7" placeholder="1994-11-11"
											value="${student.fpassportissueddateen}">
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
									<tr>
										<td>
											<h6>
												<strong>Citizenship No.</strong>
											</h6> <input type="text" class="form-control"
											name="mcitizenshipno" form="form"
											value="${student.mcitizenshipno}">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="mcitizenshipissuedby" form="form"
											value="${student.mcitizenshipissuedby}">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="mcitizenshipissueddate" maxlength="10" id="nepaliDate8"
											form="form" placeholder="2051-07-25"
											value="${student.mcitizenshipissueddate}">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="mcitizenshipissueddateen" maxlength="10" form="form"
											id="englishDate8" placeholder="1994-11-11"
											value="${student.mcitizenshipissueddateen}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>License No.</strong>
											</h6> <input type="text" class="form-control" name="mlicenseno"
											form="form" value="${student.mlicenseno}">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="mlicenseissuedby" form="form"
											value="${student.mlicenseissuedby}">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="mlicenseissueddate" maxlength="10" id="nepaliDate9"
											form="form" placeholder="2051-07-25"
											value="${student.mlicenseissueddate}">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="mlicenseissueddateen" maxlength="10" form="form"
											id="englishDate9" placeholder="1994-11-11"
											value="${student.mlicenseissueddateen}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Official Identity No.</strong>
											</h6> <input type="text" class="form-control" name="mofficialidno"
											form="form" value="${student.mofficialidno}">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="mofficialidissuedby" form="form"
											value="${student.mofficialidissuedby}">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="mofficialidissueddate" maxlength="10" id="nepaliDate10"
											form="form" placeholder="2051-07-25"
											value="${student.mofficialidissueddate}">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="mofficialidissueddateen" maxlength="10" form="form"
											id="englishDate10" placeholder="1994-11-11"
											value="${student.mofficialidissueddateen}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Voter ID No.</strong>
											</h6> <input type="text" class="form-control" name="mvoteridno"
											form="form" value="${student.mvoteridno}">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="mvoteridissuedby" form="form"
											value="${student.mvoteridissuedby}">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="mvoteridissueddate" maxlength="10" id="nepaliDate11"
											form="form" placeholder="2051-07-25"
											value="${student.mvoteridissueddate}">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="mvoteridissueddateen" maxlength="10" form="form"
											id="englishDate11" placeholder="1994-11-11"
											value="${student.mvoteridissueddateen}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Passport No.</strong>
											</h6> <input type="text" class="form-control" name="mpassportno"
											form="form" value="${student.mpassportno}">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="mpassportissuedby" form="form"
											value="${student.mpassportissuedby}">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="mpassportissueddate" maxlength="10" id="nepaliDate12"
											form="form" placeholder="2051-07-25"
											value="${student.mpassportissueddate}">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="mpassportissueddateen" maxlength="10" form="form"
											id="englishDate12" placeholder="1994-11-11"
											value="${student.mpassportissueddateen}">
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
											form="form" value="${student.local1}">
										</td>
										<td>
											<h6>
												<strong>Relation Type 1</strong>
											</h6> <select class="form-control" name="relationtype1"
											form="form">
												<option value="" selected="">Select relation type</option>
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
											form="form" value="${student.localadd1}">
										</td>
										<td>
											<h6>
												<strong>Mobile No. 1</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="localmob1" form="form" value="${student.localmob1}">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Name 2</strong>
											</h6> <input type="text" class="form-control" name="local2"
											form="form" value="${student.local2}">
										</td>
										<td>
											<h6>
												<strong>Relation Type 2</strong>
											</h6> <select class="form-control" name="relationtype2"
											form="form">
												<option selected="" value="">Select relation type</option>
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
												<strong>Address 2</strong>
											</h6> <input type="text" class="form-control" name="localadd2"
											form="form" value="${student.localadd2}">
										</td>
										<td>
											<h6>
												<strong>Mobile No. 2</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="localmob2" form="form" value="${student.localmob2}">
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
													<option value="${cl.classid}"
														<c:if test="${student.admissionclass eq cl.classid }">selected</c:if>>${cl.classname }</option>

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
								<img src="${image }" class="img-thumbnail">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

