<%@page import="com.controller.student.classes.StudentOperations"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
	if ((session.getAttribute("userdetail")) != null) {
		StudentOperations s = new StudentOperations();
		ResultSet exam = s.selectexam();
		ResultSet examtype = s.selectexamtype();
%>
<jsp:include page="/includefile"></jsp:include>
<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">General</a></li>
				<li class="breadcrumb-item active" aria-current="page">Exam</li>
				<li class="breadcrumb-item active" aria-current="page">Create Exam</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>CREATE EXAM</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
			<button type="submit" class="btn btn-success" form="form">
						<i class="fa fa-check"></i> Save
					</button>
				<form method="post" action="exam.add" id="form"></form>
				<table class="table">
					<tbody>
						<tr>
							<td><h6>Exam Name *</h6>
					<input type="text" class="form-control" name="examname" form="form"
						required> </td>
							<td><h6>Exam Type *</h6>
					<select class="form-control" name="examtype" form="form" required>
						<option value="" selected>Select exam type</option>
						<%
							while (examtype.next()) {
						%>
						<option value="<%=examtype.getString("examtypeid")%>"><%=examtype.getString("examtypename")%></option>
						<%
							}
						%>
					</select></td>
							<td><h6>Start Date *</h6>
					<input type="date" class="form-control" name="startdate"
						form="form" required></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>AVAILABLE EXAM DETAILS</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
			<table id="datatable"
					class="table jambo_table table-striped table-bordered"
					cellspacing="0" width="100%" id="table" style="font-size:95%">
						<thead>
							<tr>
								<th>S No.</th>
								<th>Exam Name</th>
								<th>Exam Type</th>
								<th>Start Date</th>
								<th><i class="fa fa-cog" aria-hidden="true"></i></th>
							</tr>
						</thead>
						<tbody>
							<%
								int sno = 1;
									while (exam.next()) {
							%>
							<tr>
								<td><%=sno%></td>
								<td><%=exam.getString("examname")%></td>
								<td><%=exam.getString("examtypename")%></td>
								<td><%=exam.getString("startdate")%></td>
								<td><a href=""><i class="fa fa-pencil-square-o"
										aria-hidden="true" style="color: blue;"></i></a>&nbsp;&nbsp;&nbsp;<a
									href="exam.del?id=<%=exam.getString("examid")%>" class="delete"><i
										class="fa fa-trash" aria-hidden="true" style="color: red;"></i></a>
								</td>
							</tr>
							<%
								sno++;
									}
							%>
						</tbody>
					</table>
			</div>
			</div>
			</div>
	
	<jsp:include page="/msgmodal"></jsp:include>
	<script>
		$(document).ready(function() {
	<%if (request.getAttribute("msg") != null) {%>
		$('#myModal').modal('show');
	<%}%>
		});
		$('#form').submit(function() {
			return confirm('CONFIRM SAVE?');
		});
		$('.delete').click(function() {
			return confirm('CONFIRM EXAM DELETE?');
		});
	</script>
</body>
<%}%>