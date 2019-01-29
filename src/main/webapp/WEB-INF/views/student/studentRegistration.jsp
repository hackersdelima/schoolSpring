<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include.jsp"></jsp:include>

<html>
<head>
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
				<h2>STUDENT REGISTRATION</h2>

				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<spring:url value="/student/studentRegistration" var="url" />
				<form method="post" action="${url }" id="form"
					enctype="multipart/form-data"></form>
				<button type="submit" class="btn btn-success " form="form">
					<i class="fa fa-check"></i> SUBMIT
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
											</h6> <input type="text" class="form-control" name="legacyId"
											form="form">
										</td>
										<td>
											<h6>
												<strong>Student Name</strong>
											</h6> <input type="text" class="form-control" name="studentname"
											id="studentname" form="form"
											pattern="^[a-zA-Z ][a-zA-Z ]{1,30}"
											title="only alphabets are allowed" required>
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Sex</strong>
											</h6> <select class="form-control" name="sex" form="form">
												<option value="" selected>Select sex</option>
												<option value="m">Male</option>
												<option value="f">FeMale</option>
												<option value="o">Other</option>
										</select>
										</td>
										<td>
											<h6>
												<strong>Mother Language</strong>
											</h6> <select class="form-control" name="smotherlanguage"
											form="form">
												<option value="" selected>Select mother language</option>

												<c:forEach items="${language }" var="lan">
													<option value="${lan.languageid }">${lan.languagename }</option>
												</c:forEach>
										</select>
										</td>
										<td>
											<h6>
												<strong>Ethnic Group</strong>
											</h6> <select class="form-control" name="sethinicgroup"
											form="form">
												<option value="" selected>Select ethnic group</option>
												<c:forEach items="${caste }" var="caste">
													<option value="${caste.casteid }">${caste.castename }</option>
												</c:forEach>


										</select>
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Religion</strong>
											</h6> <select class="form-control" name="sReligion" form="form">
												<option value="" selected>Select religion</option>
												<option value="Hindu">Hindu</option>
												<option value="Muslim">Muslim</option>
												<option value="Buddhism">Buddhism</option>
												<option value="Christian">Christian</option>
										</select>
										</td>
										<td>
											<h6>
												<strong>Differently-able?</strong>
											</h6> <select class="form-control" name="differentlyabledYN"
											form="form">
												<option value="n">No</option>
												<option value="y">Yes</option>
										</select>
										</td>
										<td>
											<h5 style="color: blue">
												<strong>If Differently-able yes</strong>
												</h6>
												<select class="form-control" name="differentlyabledtype"
													form="form">
													<option value="" selected>Select disabled type</option>

													<c:forEach items="${disabledlist }" var="disabled">
														<option value="${disabled.id }">${disabled.typehead }</option>
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
											onblur="nepaliToEnglish('.dob','.doben')"
											placeholder="2051-07-25"
											pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])">
										</td>
										<td>
											<h6>
												<strong>DOB(YYYY-MM-DD) A.D.</strong>
											</h6> <input type="text" class="form-control doben" name="doben"
											maxlength="10" form="form" id="englishDate1"
											onblur="englishToNepali('.dob','.doben')"
											placeholder="1994-11-11"
											pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Admission Date(YYYY-MM-DD) B.S.</strong>
											</h6> <input type="text" class="form-control addate"
											name="admissiondate" maxlength="10" id="nepaliDate14"
											form="form" onblur="nepaliToEnglish('.addate','.addateen')"
											placeholder="2051-07-25"
											pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])"
											>
										</td>
										<td>
											<h6>
												<strong>Admission Date(YYYYMMDD) A.D.</strong>
											</h6> <input type="text" class="form-control addateen"
											name="admissiondateen" maxlength="10" form="form"
											id="englishDate14" placeholder="1994-11-11"
											onblur="englishToNepali('.addate','.addateen')"
											pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])"
											>
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
											name="birthcertificateno" form="form" pattern="[0-9]+"
											title="only numbers are allowed">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="birthcertificateissuedby" form="form">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Issued Date(YYYYMMDD) B.S.</strong>
											</h6> <input type="text" class="form-control isdate"
											name="birthcertificateissueddate" maxlength="10"
											id="nepaliDate2" form="form" placeholder="2051-07-25"
											onblur="nepaliToEnglish('.isdate','.isdateen')"
											pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])">
										</td>
										<td>
											<h6>
												<strong>Issued Date(YYYYMMDD) A.D.</strong>
											</h6> <input type="text" class="form-control isdateen"
											name="birthcertificateissueddateen" maxlength="10"
											form="form" id="englishDate2" placeholder="1994-11-11"
											onblur="englishToNepali('.isdate','.isdateen')"
											pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])">
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
												<option value="" selected>Select district</option>
												<c:forEach items="${dislist }" var="dis">
													<option value="${dis.districtCode }">${dis.districtName }</option>
												</c:forEach>


										</select>
										</td>
										<td>
											<h6>
												<strong>Municipality or Village Council</strong>
											</h6> <select class="form-control vdcmun" name="vdcMun"
											form="form">
												<option value="">Select muncipality or VDC</option>
										</select>
										</td>
										<td>
											<h6>
												<strong>Ward No.</strong>
											</h6> <select class="form-control wardno" name="wardNo"
											form="form">
												<option value="0" selected>Select ward no.</option>
										</select>
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Tole</strong>
											</h6> <input type="text" class="form-control" name="tole"
											form="form">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Temp. Address</strong>
											</h6> <input type="text" class="form-control" name="tempaddress"
											form="form">
										</td>

										<td>
											<h6>
												<strong>Image</strong>
											</h6> <input type="file" id="file" class="form-control" form="form"
											name="files" accept="image/*" >
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
											form="form">
										</td>
										<td>
											<h6>
												<strong>Address</strong>
											</h6> <input type="text" class="form-control" name="faddress"
											form="form">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Name of Office</strong>
											</h6> <input type="text" class="form-control" name="foffice"
											form="form">
										</td>
										<td>
											<h6>
												<strong>Office Position</strong>
											</h6> <input type="text" class="form-control" name="fposition"
											form="form">
										</td>
										<td>
											<h6>
												<strong>Expected Annual Income</strong>
											</h6> <input type="text" class="form-control" name="fincome"
											value="0" form="form">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Mobile No.</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="fmobile" form="form" value="0" pattern="[0-9]+">
										</td>
										<td>
											<h6>
												<strong>Telephone No.</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="ftelephone" form="form" value="0" pattern="[0-9]+">
										</td>
										<td>
											<h6>
												<strong>Email ID</strong>
											</h6> <input type="email" class="form-control" name="femail"
											form="form">
										</td>
										<td>
											<h6>
												<strong>Emergency Contact No.</strong>
											</h6> <input type="text" class="form-control" name="fephone"
											maxlength="10" form="form" value="0" pattern="[0-9]+">
										</td>
									</tr>

								</tbody>
							</table>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content3"
							aria-labelledby="profile-tab">
							<table class="table">
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
										form="form">
									</td>
									<td>
										<h6>
											<strong>Address</strong>
										</h6> <input type="text" class="form-control" name="maddress"
										form="form">
									</td>
								</tr>
								<tr>
									<td>
										<h6>
											<strong>Name of Office</strong>
										</h6> <input type="text" class="form-control" name="moffice"
										form="form">
									</td>
									<td>
										<h6>
											<strong>Office Position</strong>
										</h6> <input type="text" class="form-control" name="mposition"
										form="form">
									</td>
									<td>
										<h6>
											<strong>Expected Annual Income</strong>
										</h6> <input type="text" class="form-control" name="mincome"
										value="0" form="form">
									</td>
								</tr>
								<tr>
									<td>
										<h6>
											<strong>Mobile No.</strong>
										</h6> <input type="text" class="form-control" maxlength="10"
										name="mmobile" form="form" value="0" pattern="[0-9]+">
									</td>
									<td>
										<h6>
											<strong>Telephone No.</strong>
										</h6> <input type="text" class="form-control" maxlength="10"
										name="mtelephone" form="form" value="0" pattern="[0-9]+">
									</td>
									<td>
										<h6>
											<strong>Email ID</strong>
										</h6> <input type="email" class="form-control" name="memail"
										form="form">
									</td>
									<td>
										<h6>
											<strong>Emergency Contact No.</strong>
										</h6> <input type="text" class="form-control" maxlength="10"
										name="mephone" form="form" value="0" pattern="[0-9]+">
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
											form="form">
										</td>
										<td>
											<h6>
												<strong>Relation Type 1</strong>
											</h6> <select class="form-control" name="relationtype1"
											form="form">
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
											<h6>
												<strong>Address 1</strong>
											</h6> <input type="text" class="form-control" name="localadd1"
											form="form">
										</td>
										<td>
											<h6>
												<strong>Mobile No. 1</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="localmob1" form="form" value="0" pattern="[0-9]+">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Name 2</strong>
											</h6> <input type="text" class="form-control" name="local2"
											form="form">
										</td>
										<td>
											<h6>
												<strong>Relation Type 2</strong>
											</h6> <select class="form-control" name="relationtype2"
											form="form">
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
											<h6>
												<strong>Address 2</strong>
											</h6> <input type="text" class="form-control" name="localadd2"
											form="form">
										</td>
										<td>
											<h6>
												<strong>Mobile No. 2</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="localmob2" form="form" value="0" pattern="[0-9]+">
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
											form="form" required>
												<option selected value="">Select admission class</option>
												<c:forEach items="${classlist}" var="cl">
													<option value="${cl.classid}">${cl.classname }</option>
												</c:forEach>

										</select>
										</td>
										<td>
											<h6>
												<strong>Section</strong>
											</h6> <select class="form-control" name="section" form="form">
												<option selected value="">Select section</option>
												<c:forEach items="${section}" var="sec">
													<option value="${sec.sectionname}">${sec.sectionname }</option>
												</c:forEach>

										</select>
										</td>
										<td>
											<h6>
												<strong>Roll No.</strong>
											</h6> <input type="text" class="form-control" name="rollno"
											form="form" pattern="[0-9]+">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>House Group</strong>
											</h6> <select class="form-control" name="housegroup" form="form">
												<option value="" selected>Select house group</option>

												<c:forEach items="${housegroup}" var="h">
													<option value="${h.housegroupid}">${h.housegroupname }</option>
												</c:forEach>
										</select>
										</td>
										<td>
											<h6>
												<strong>Previous School</strong>
											</h6> <input type="text" class="form-control" name="oldschool"
											form="form">
										</td>
										<td>
											<h6>
												<strong>Reason For Leaving</strong>
											</h6> <input type="text" class="form-control" name="reasonleav"
											form="form">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Hobby</strong>
											</h6> <input type="text" class="form-control" name="hobby"
											form="form">
										</td>
										<td>
											<h6>
												<strong>Special Interest</strong>
											</h6> <select class="form-control" name="specialinterest"
											form="form">
												<option value="" selected>Select special interest</option>
												<c:forEach items="${interest}" var="i">
													<option value="${i.specialInterestId}">${i.specialInterestName}</option>
												</c:forEach>

										</select>
										</td>
									</tr>

								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../msgmodal.jsp"></jsp:include>
	<script>
		function nepaliToEnglish(nepalidate, englishdate) {
			var date = $(nepalidate).val();
			var dataString = {
				'nepalidate' : date
			};
			$.ajax({
				type : "POST",
				url : "nepaliToEnglish",
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
		function englishToNepali(nepalidate, englishdate) {
			var date = $(englishdate).val();
			var dataString = {
				'englishdate' : date
			};
			$.ajax({
				type : "POST",
				url : "englishToNepali",
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
	</script>
	
	


</body>
</html>

