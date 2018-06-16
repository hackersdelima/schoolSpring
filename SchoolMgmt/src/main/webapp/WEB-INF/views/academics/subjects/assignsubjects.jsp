<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../include.jsp"></jsp:include>
<spring:url value="/operation/assignsubjects" var="formUrl" />


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
				<form:form method="post" action="${formUrl }" id="form"
					style="width: 60%">
					<button type="submit" class="btn btn-success" form="form">
						<i class="fa fa-check"></i> Save
					</button>
					<table class="table">
						<tbody>
							<tr>
								<td>
									<h6>Class</h6> <select class="form-control" name="classid"
									form="form" id="class" required>
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
				</form:form>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>Assigned Subjects List</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
					<li><a class="close-link"><i class="fa fa-close"></i></a>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<table id="datatable"
					class="table jambo_table table-striped table-bordered"
					style="font-size: 95%;">
					<thead>
						<tr>
							<th>CLASS</th>
							<th>SUBJECTS</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${assignedsubjects}" var="map">
    <tr>
        <td>${map.key }</td>
        <td>${map.value }</td>
    </tr>
</c:forEach>
					</tbody>
					</table>
			</div>
		</div>
	</div>


	<jsp:include page="../../msgmodal.jsp"></jsp:include>
	<script>
$('#form').submit(function() {
    return confirm('CONFIRM SUBJECT SAVE?'); 
});
</script>
</body>
