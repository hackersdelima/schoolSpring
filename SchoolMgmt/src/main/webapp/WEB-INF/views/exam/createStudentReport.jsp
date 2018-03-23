<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
	ResultSet section = (ResultSet) request.getAttribute("sectionlist");
	ResultSet classlist = (ResultSet) request.getAttribute("classlist");
	ResultSet examlist = (ResultSet) request.getAttribute("examlist");
%>
<jsp:include page="/includefile"></jsp:include>
<html>
<head>
</head>
<body class="background">
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>Create Student Exam Report</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form action="studentMarks.add" method="post"
					style="width: 80%; margin-top: 10px;" class="form">
					<div role="tabpanel" class="tab-pane" aria-labelledby="profile-tab">
					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<input type="submit" class="btn btn-success" value="Submit">
						</div>
					</div><br>
					<div class="ln_solid"></div>
						<div class="col-md-12">
						<div class="col-md-3">
								<h6>
									<strong>Exam*</strong>
								</h6>
								<select class="form-control" name="examid" required>
									<option value="">Select Exam</option>
									<%
										while (examlist.next()) {
									%>
									<option value="<%=examlist.getString("examid")%>"><%=examlist.getString("examname")%></option>
									<%
										}
									%>
								</select>
							</div>
							<div class="col-md-3">
								<h6>
									<strong>Class*</strong>
								</h6>
								<select class="form-control" name="classid" id="class" required>
									<option value="">Select Class</option>
									<%
										while (classlist.next()) {
									%>
									<option value="<%=classlist.getString("classid")%>"><%=classlist.getString("classname")%></option>
									<%
										}
									%>
								</select>
							</div>
							<div class="col-md-3">
								<h6>
									<strong>Section</strong>
								</h6>
								<select class="form-control" name="sectionid" required>
									<option value="">Select Section</option>
									<%
										while (section.next()) {
									%>
									<option value="<%=section.getString("sectionid")%>"><%=section.getString("sectionname")%></option>
									<%
										}
									%>
								</select>
							</div>
							<div class="col-md-3">
								<h6>
									<strong>Roll No</strong>
								</h6>
								<input type="text" class="form-control" name="rollno"
									placeholder="" required> <br>
							</div>
						</div>

					</div>
					<div id="markstable"></div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	$('form').submit(function() {
		return confirm("CONFIRM?");
	});
	
		$("#class").change(function() {
			var id = $(this).val();
			var dataString = 'id=' + id;

			$.ajax({
				type : "POST",
				url : "getMarksInputTable.click",
				data : dataString,
				cache : false,
				success : function(html) {
					$("#markstable").html(html);
				}
			});

		});
	</script>
</body>
</html>