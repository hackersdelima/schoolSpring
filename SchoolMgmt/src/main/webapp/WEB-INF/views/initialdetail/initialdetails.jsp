<%@page import="com.controller.student.classes.StudentOperations"%>
<%@page import="java.sql.*"%>
<%
	if (session.getAttribute("userdetail") != null) {
%>
<%
	StudentOperations s = new StudentOperations();
		ResultSet language = s.getlanguage();
		ResultSet section = s.getsection();
		ResultSet housegroup = s.gethousegroup();
		ResultSet caste = s.getcaste();
		ResultSet specialinterest = s.getspecialinterest();
		ResultSet classlist = s.selectclass();
		ResultSet examtype = s.selectexamtype();
%>
<jsp:include page="/includefile"></jsp:include>
<html>
<head></head>
<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Settings</li>
				<li class="breadcrumb-item active" aria-current="page">Set
					Initial Details</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>ADD INITIAL DETAILS</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
						<li role="presentation" class="active"><a
							href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
							aria-expanded="true">Language</a></li>
						<li role="presentation" class=""><a href="#tab_content2"
							role="tab" id="profile-tab" data-toggle="tab"
							aria-expanded="false">Section</a></li>
						<li role="presentation" class=""><a href="#tab_content3"
							role="tab" id="profile-tab2" data-toggle="tab"
							aria-expanded="false">House Group</a></li>
						<li role="presentation" class=""><a href="#tab_content4"
							role="tab" id="profile-tab3" data-toggle="tab"
							aria-expanded="false">Ethnic Group</a></li>
						<li role="presentation" class=""><a href="#tab_content5"
							role="tab" id="profile-tab4" data-toggle="tab"
							aria-expanded="false">Special Interest</a></li>
						<li role="presentation" class=""><a href="#tab_content6"
							role="tab" id="profile-tab4" data-toggle="tab"
							aria-expanded="false">Academic Classes</a></li>
						<li role="presentation" class=""><a href="#tab_content7"
							role="tab" id="profile-tab5" data-toggle="tab"
							aria-expanded="false">Exam Type</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade active in"
							id="tab_content1" aria-labelledby="home-tab">
							<form action="initialdetailadd" method="post"
								style="width: 20%; margin-top: 10px;" class="form">
								<h6>
									<strong>Language Name:</strong>
								</h6>
								<input type="text" class="form-control" name="languagename"
									placeholder="Language name..." required> <br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content2"
							aria-labelledby="profile-tab">
							<form action="initialdetailadd" method="post"
								style="width: 20%; margin-top: 10px;" class="form">
								<h6>
									<strong>Section Name:</strong>
								</h6>
								<input type="text" class="form-control" name="sectionname"
									placeholder="Section name..." required> <br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content3"
							aria-labelledby="profile-tab">
							<form action="initialdetailadd" method="post"
								style="width: 20%; margin-top: 10px;" class="form">
								<h6>
									<strong>House Group Name:</strong>
								</h6>
								<input type="text" class="form-control" name="housegroupname"
									placeholder="House Group name..." required> <br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content4"
							aria-labelledby="profile-tab">
							<form action="initialdetailadd" method="post"
								style="width: 20%; margin-top: 10px;" class="form">
								<h6>
									<strong>Ethnic Group Name:</strong>
								</h6>
								<input type="text" class="form-control" name="castename"
									placeholder="Ethnic group name..." required> <br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content5"
							aria-labelledby="profile-tab">
							<form action="initialdetailadd" method="post"
								style="width: 20%; margin-top: 10px;" class="form">
								<h6>
									<strong>Special Interest Name:</strong>
								</h6>
								<input type="text" class="form-control"
									name="specialinterestname"
									placeholder="Special interest name..." required> <br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content6"
							aria-labelledby="profile-tab">
							<form action="initialdetailadd" method="post"
								style="width: 20%; margin-top: 10px;" class="form">
								<h6>
									<strong>Academic Class Name:</strong>
								</h6>
								<input type="text" class="form-control" name="classname"
									placeholder="Academic class name..." required> <br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tab_content7"
							aria-labelledby="profile-tab">
							<form action="examtype.add" method="post"
								style="width: 20%; margin-top: 10px;" class="form"
								id="examtypeform">
								<h6>
									<strong>Exam Type Name:</strong>
								</h6>
								<input type="text" class="form-control" name="examtypename"
									placeholder="Exam type name..." required><br>
								<h6>
									<strong>Exam Type Description:</strong>
								</h6>
								<textarea class="form-control" name="description"
									form="examtypeform" value="" rows="5"></textarea>
								<br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>AVAILABLE INITIAL DETAILS</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
					<li><a class="close-link"><i class="fa fa-close"></i></a>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<table class="table jambo_table table-striped table-bordered"
					style="font-size: 95%;">
					<thead>
						<tr>
							<th>Languages</th>
							<th>Sections</th>
							<th>House Groups</th>
							<th>Ethnic Groups</th>
							<th>Special Interests</th>
							<th>Admission Class</th>
							<th>Exam Type</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<ol>
									<%
										while (language.next()) {
									%>
									<li><i class="fa fa-trash-o" aria-hidden="true"
										style="color: red"></i> <%=language.getString("languagename")%>
									</li>
									<%
										}
									%>
								</ol>
							</td>
							<td>
								<ol>
									<%
										while (section.next()) {
									%>
									<li><i class="fa fa-trash-o" aria-hidden="true"
										style="color: red"></i> <%=section.getString("sectionname")%></li>
									<%
										}
									%>
								</ol>
							</td>
							<td>
								<ol>
									<%
										while (housegroup.next()) {
									%>
									<li><i class="fa fa-trash-o" aria-hidden="true"
										style="color: red"></i> <%=housegroup.getString("housegroupname")%></li>
									<%
										}
									%>
								</ol>
							</td>
							<td>
								<ol>
									<%
										while (caste.next()) {
									%>
									<li><i class="fa fa-trash-o" aria-hidden="true"
										style="color: red"></i> <%=caste.getString("castename")%></li>
									<%
										}
									%>
								</ol>
							</td>
							<td>
								<ol>
									<%
										while (specialinterest.next()) {
									%>
									<li><i class="fa fa-trash-o" aria-hidden="true"
										style="color: red"></i> <%=specialinterest.getString("specialinterestname")%></li>
									<%
										}
									%>
								</ol>
							</td>
							<td>
								<ol>
									<%
										while (classlist.next()) {
									%>
									<li><i class="fa fa-trash-o" aria-hidden="true"
										style="color: red"></i> <%=classlist.getString("classname")%></li>
									<%
										}
									%>
								</ol>
							</td>
							<td>
								<ol>
									<%
										while (examtype.next()) {
									%>
									<li><i class="fa fa-trash-o" aria-hidden="true"
										style="color: red"></i> <a href="" data-toggle="tooltip"
										title="<%=examtype.getString("description")%>"
										style="color: black;"><%=examtype.getString("examtypename")%></a></li>
									<%
										}
									%>
								</ol>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<jsp:include page="/msgmodal"></jsp:include>
	<script>
		
	<%if (request.getAttribute("msg") != null) {%>
		$('#myModal').modal('show');
	<%}%>
		$('.form').submit(function() {
			return confirm('CONFIRM SUBMIT?');
		});
		$('[data-toggle="tooltip"]').tooltip();
	</script>
</body>
</html>
<%}%>