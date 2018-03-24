
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
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
				
				<form method="post" action="studentregistration" id="form"></form>
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
											</h6> <input type="text" class="form-control" name="LegacyId"
											form="form">
										</td>
										<td>
											<h6>
												<strong>Student Name</strong>
											</h6> <input type="text" class="form-control" name="studentname"
											id="studentname" form="form" required>
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
											</h6> <select class="form-control" name="Language" form="form">
												<option value="" selected>Select mother language</option>
											
											
										</select>
										</td>
										<td>
											<h6>
												<strong>Ethnic Group</strong>
											</h6> <select class="form-control" name="SCast" form="form">
												<option value="" selected>Select ethnic group</option>
												
												<option value=""></option>
											
										</select>
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Religion</strong>
											</h6> <select class="form-control" name="SReligion" form="form">
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
											</h6> <select class="form-control" name="DisabledYN" form="form">
												<option value="n">No</option>
												<option value="y">Yes</option>
										</select>
										</td>
										<td>
											<h5 style="color: blue">
												<strong>If Differently-able yes</strong>
												</h6>
												<select class="form-control" name="DisableType" form="form">
													<option value="" selected>Select disabled type</option>
													
													<option value=""></option>
													
												</select>
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>DOB(YYYY-MM-DD) B.S.</strong>
											</h6> <input type="text" class="form-control" name="dob"
											maxlength="10" id="nepaliDate1" form="form"
											placeholder="2051-07-25">
										</td>
										<td>
											<h6>
												<strong>DOB(YYYY-MM-DD) A.D.</strong>
											</h6> <input type="text" class="form-control" name="doben"
											maxlength="10" form="form" id="englishDate1"
											placeholder="1994-11-11">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Admission Date(YYYY-MM-DD) B.S.</strong>
											</h6> <input type="text" class="form-control" name="admissiondate"
											maxlength="10" id="nepaliDate14" form="form"
											placeholder="2051-07-25" required>
										</td>
										<td>
											<h6>
												<strong>Admission Date(YYYYMMDD) A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="admissiondateen" maxlength="10" form="form"
											id="englishDate14" placeholder="1994-11-11" required>
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
											name="birthcertificateno" form="form">
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
											</h6> <input type="text" class="form-control"
											name="birthcertificateissueddate" maxlength="10"
											id="nepaliDate2" form="form" placeholder="2051-07-25">
										</td>
										<td>
											<h6>
												<strong>Issued Date(YYYYMMDD) A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="birthcertificateissueddateen" maxlength="10"
											form="form" id="englishDate2" placeholder="1994-11-11">
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
											name="District" form="form">
												<option value="" selected>Select district</option>
												
												
										</select>
										</td>
										<td>
											<h6>
												<strong>Municipality or Village Council</strong>
											</h6> <select class="form-control vdcmun" name="VdcMun"
											form="form">
												<option value="" selected>Select muncipality or VDC</option>
										</select>
										</td>
										<td>
											<h6>
												<strong>Ward No.</strong>
											</h6> <select class="form-control wardno" name="WardNo"
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
											name="fmobile" form="form" value="0">
										</td>
										<td>
											<h6>
												<strong>Telephone No.</strong>
											</h6> <input type="text" class="form-control" maxlength="10"
											name="ftelephone" form="form" value="0">
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
											maxlength="10" form="form" value="0">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Citizenship No.</strong>
											</h6> <input type="text" class="form-control"
											name="fcitizenshipno" form="form">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="fcitizenshipissuedby" form="form">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="fcitizenshipissueddate" maxlength="10" id="nepaliDate3"
											form="form" placeholder="2051-07-25">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="fcitizenshipissueddateen" maxlength="10" form="form"
											id="englishDate3" placeholder="1994-11-11">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>License No.</strong>
											</h6> <input type="text" class="form-control" name="flicenseno"
											form="form">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="flicenseissuedby" form="form">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="flicenseissueddate" maxlength="10" id="nepaliDate4"
											form="form" placeholder="2051-07-25">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="flicenseissueddateen" maxlength="10" form="form"
											id="englishDate4" placeholder="1994-11-11">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Official Identity No.</strong>
											</h6> <input type="text" class="form-control" name="fofficialidno"
											form="form">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="fofficialidissuedby" form="form">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="fofficialidissueddate" maxlength="10" id="nepaliDate5"
											form="form" placeholder="2051-07-25">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="fofficialidissueddateen" maxlength="10" form="form"
											id="englishDate5" placeholder="1994-11-11">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Voter ID No.</strong>
											</h6> <input type="text" class="form-control" name="fvoteridno"
											form="form">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="fvoteridissuedby" form="form">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="fvoteridissueddate" maxlength="10" id="nepaliDate6"
											form="form" placeholder="2051-07-25">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="fvoteridissueddateen" maxlength="10" form="form"
											id="englishDate6" placeholder="1994-11-11">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>Passport No.</strong>
											</h6> <input type="text" class="form-control" name="fpassportno"
											form="form">
										</td>
										<td>
											<h6>
												<strong>Issued By</strong>
											</h6> <input type="text" class="form-control"
											name="fpassportissuedby" form="form">
										</td>
										<td>
											<h6>
												<strong>Issued Date B.S.</strong>
											</h6> <input type="text" class="form-control"
											name="fpassportissueddate" maxlength="10" id="nepaliDate7"
											form="form" placeholder="2051-07-25">
										</td>
										<td>
											<h6>
												<strong>Issued Date A.D.</strong>
											</h6> <input type="text" class="form-control"
											name="fpassportissueddateen" maxlength="10" form="form"
											id="englishDate7" placeholder="1994-11-11">
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
										name="mmobile" form="form" value="0">
									</td>
									<td>
										<h6>
											<strong>Telephone No.</strong>
										</h6> <input type="text" class="form-control" maxlength="10"
										name="mtelephone" form="form" value="0">
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
										name="mephone" form="form" value="0">
									</td>
								</tr>
								<tr>
									<td>
										<h6>
											<strong>Citizenship No.</strong>
										</h6> <input type="text" class="form-control" name="mcitizenshipno"
										form="form">
									</td>
									<td>
										<h6>
											<strong>Issued By</strong>
										</h6> <input type="text" class="form-control"
										name="mcitizenshipissuedby" form="form">
									</td>
									<td>
										<h6>
											<strong>Issued Date B.S.</strong>
										</h6> <input type="text" class="form-control"
										name="mcitizenshipissueddate" maxlength="10" id="nepaliDate8"
										form="form" placeholder="2051-07-25">
									</td>
									<td>
										<h6>
											<strong>Issued Date A.D.</strong>
										</h6> <input type="text" class="form-control"
										name="mcitizenshipissueddateen" maxlength="10" form="form"
										id="englishDate8" placeholder="1994-11-11">
									</td>
								</tr>
								<tr>
									<td>
										<h6>
											<strong>License No.</strong>
										</h6> <input type="text" class="form-control" name="mlicenseno"
										form="form">
									</td>
									<td>
										<h6>
											<strong>Issued By</strong>
										</h6> <input type="text" class="form-control"
										name="mlicenseissuedby" form="form">
									</td>
									<td>
										<h6>
											<strong>Issued Date B.S.</strong>
										</h6> <input type="text" class="form-control"
										name="mlicenseissueddate" maxlength="10" id="nepaliDate9"
										form="form" placeholder="2051-07-25">
									</td>
									<td>
										<h6>
											<strong>Issued Date A.D.</strong>
										</h6> <input type="text" class="form-control"
										name="mlicenseissueddateen" maxlength="10" form="form"
										id="englishDate9" placeholder="1994-11-11">
									</td>
								</tr>
								<tr>
									<td>
										<h6>
											<strong>Official Identity No.</strong>
										</h6> <input type="text" class="form-control" name="mofficialidno"
										form="form">
									</td>
									<td>
										<h6>
											<strong>Issued By</strong>
										</h6> <input type="text" class="form-control"
										name="mofficialidissuedby" form="form">
									</td>
									<td>
										<h6>
											<strong>Issued Date B.S.</strong>
										</h6> <input type="text" class="form-control"
										name="mofficialidissueddate" maxlength="10" id="nepaliDate10"
										form="form" placeholder="2051-07-25">
									</td>
									<td>
										<h6>
											<strong>Issued Date A.D.</strong>
										</h6> <input type="text" class="form-control"
										name="mofficialidissueddateen" maxlength="10" form="form"
										id="englishDate10" placeholder="1994-11-11">
									</td>
								</tr>
								<tr>
									<td>
										<h6>
											<strong>Voter ID No.</strong>
										</h6> <input type="text" class="form-control" name="mvoteridno"
										form="form">
									</td>
									<td>
										<h6>
											<strong>Issued By</strong>
										</h6> <input type="text" class="form-control"
										name="mvoteridissuedby" form="form">
									</td>
									<td>
										<h6>
											<strong>Issued Date B.S.</strong>
										</h6> <input type="text" class="form-control"
										name="mvoteridissueddate" maxlength="10" id="nepaliDate11"
										form="form" placeholder="2051-07-25">
									</td>
									<td>
										<h6>
											<strong>Issued Date A.D.</strong>
										</h6> <input type="text" class="form-control"
										name="mvoteridissueddateen" maxlength="10" form="form"
										id="englishDate11" placeholder="1994-11-11">
									</td>
								</tr>
								<tr>
									<td>
										<h6>
											<strong>Passport No.</strong>
										</h6> <input type="text" class="form-control" name="mpassportno"
										form="form">
									</td>
									<td>
										<h6>
											<strong>Issued By</strong>
										</h6> <input type="text" class="form-control"
										name="mpassportissuedby" form="form">
									</td>
									<td>
										<h6>
											<strong>Issued Date B.S.</strong>
										</h6> <input type="text" class="form-control"
										name="mpassportissueddate" maxlength="10" id="nepaliDate12"
										form="form" placeholder="2051-07-25">
									</td>
									<td>
										<h6>
											<strong>Issued Date A.D.</strong>
										</h6> <input type="text" class="form-control"
										name="mpassportissueddateen" maxlength="10" form="form"
										id="englishDate12" placeholder="1994-11-11">
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
											name="localmob1" form="form" value="0">
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
											name="localmob2" form="form" value="0">
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
												
										</select>
										</td>
										<td>
											<h6>
												<strong>Section</strong>
											</h6> <select class="form-control" name="section" form="form">
												<option selected value="">Select section</option>
												
										</select>
										</td>
										<td>
											<h6>
												<strong>Roll No.</strong>
											</h6> <input type="text" class="form-control" name="rollno"
											form="form">
										</td>
									</tr>
									<tr>
										<td>
											<h6>
												<strong>House Group</strong>
											</h6> <select class="form-control" name="housegroup" form="form">
												<option value="" selected>Select house group</option>
												
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



	
	<script>
		
	
	</script>
</body>
</html>

