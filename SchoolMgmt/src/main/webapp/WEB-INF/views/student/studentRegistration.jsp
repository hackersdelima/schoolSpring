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

				<form method="post"
					action="<spring:url value="/student/studentRegistration"></spring:url>"
					id="form"></form>
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
											id="studentname" form="form" required>
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
									

								</tbody>
							</table>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../msgmodal.jsp"></jsp:include>
	
	

</body>
</html>

