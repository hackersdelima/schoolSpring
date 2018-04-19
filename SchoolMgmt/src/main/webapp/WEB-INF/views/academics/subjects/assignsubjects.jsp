<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@page import="com.controller.student.classes.StudentOperations"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%
	if ((session.getAttribute("userdetail")) != null) {
		StudentOperations s = new StudentOperations();
		ResultSet subjects = s.selectsubject();
		ResultSet section = s.getsection();
		ResultSet classlist = s.selectclass();
%> --%>

<jsp:include page="../../include.jsp"></jsp:include>
<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Academic</li>
				<li class="breadcrumb-item active" aria-current="page">Subjects</li>
				<li class="breadcrumb-item active" aria-current="page">Assign
					Subjects</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>ASSIGN SUBJECTS</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="assignsubjects" id="form"
					style="width: 60%">
					<button type="submit" class="btn btn-success" form="form">
						<i class="fa fa-check"></i> Save
					</button>
					<table class="table">
						<tbody>
							<tr>
								<td>
									<h6>Class</h6> <select class="form-control" name="classid" form="form"
									id="class" required>
										<option value="">Select Class</option>
										<c:forEach items="${classlist }" var="c">
											<option value="${c.classid }">${c.classname }</option>
										</c:forEach>
								</select>
								</td>
								<!-- <td><h6>Student Admission No. *</h6>
				<input type="text" class="form-control" name="studentid" form="form"
					required></td> -->
								<td><h6>Subjects</h6> <select multiple class="form-control"
									name="subjectid" form="form">
									<c:forEach items="${subjectlist }" var="s">
									<option value="${s.subjectid }">${s.subjectCode }-${s.subjectname }</option>
									</c:forEach>
								</select></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="../../msgmodal.jsp"></jsp:include>
	<script>
	<%if (request.getAttribute("msg") != null) {%>
	   $('#myModal').modal('show');
	   <%}%>
$('#form').submit(function() {
    return confirm('CONFIRM SUBJECT SAVE?'); 
});
</script>
</body>
