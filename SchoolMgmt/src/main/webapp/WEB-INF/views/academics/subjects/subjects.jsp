<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../include.jsp"></jsp:include>
<spring:url value="/operation/addsubject" var="formUrl"/>
<html>
	<head>
		<style>
		.tbltophead th{
		text-align: center;}
		</style>
	
	</head>

<body class="background">

	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Settings</li>
				<li class="breadcrumb-item active" aria-current="page">Academic</li>
				<li class="breadcrumb-item active" aria-current="page">Subjects</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>ADD NEW SUBJECT</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>

				<div class="clearfix"></div>

			</div>
			<div class="x_content">
				<form:form action="${formUrl }" id="form">
					<button type="submit" class="btn btn-success" form="form">
						<i class="fa fa-check"></i> Save
					</button>

					<table class="table">
						<tbody>
							<tr>
								<td><h6>Subject Code *</h6> <input type="text"
									class="form-control" name="subjectcode" form="form" required></td>
								<td><h6>Subject Name *</h6> <input type="text"
									class="form-control" name="subjectname" form="form" required></td>
								<td><h6>Subject Type *</h6> <select class="form-control"
									name="subjecttype" form="form" required>
										<option value="" selected>Select subject type</option>
										<option value="common">Common</option>
										<option value="optional">Optional</option>
								</select></td>
								<td><h6>Th Full Marks*</h6> <input type="text"
									class="form-control" name="fullmarks" form="form" required></td>
								<td><h6>Pr Full Marks*</h6> <input type="text"
									class="form-control" name="fullmarks_pr" form="form" required></td>
								<td><h6>Th Pass Marks*</h6> <input type="text"
									class="form-control" name="passmarks" form="form" required></td>
								<td><h6>Pr Pass Marks*</h6> <input type="text"
									class="form-control" name="passmarks_pr" form="form" required></td>
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
				<h2>AVAILABLE SUBJECTS LIST</h2>
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
					<tr class="tbltophead">
						<th colspan="3">SUBJECT</th>
						<th colspan="2">FULL MARKS</th>
						<th colspan="2">PASSMARKS</th>
						<th rowspan="2">ACTION</th>
						
					
					</tr>
						<tr class="headings">
							<th>Subject Code</th>
							<th>Subject Name</th>
							<th>Subject Type</th>
							
							<th>Theory</th>
							<th>Practical</th>
							
							<th>Theory</th>
							<th>Practical</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${subject }" var="sub">
						<tr>
							<td>${sub.subjectCode }</td>
							<td>${sub.subjectname }</td>
							<td>${sub.subjecttype }</td>
							
							<td>${sub.subjects.fullmarks }</td>
							<td>${sub.subjects.fullmarks_pr }</td>
							
							<td>${sub.subjects.passmarks }</td>
							<td>${sub.subjects.passmarks_pr }</td>
							
							<td>${msg }</td>
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
		$('.delete').click(function() {
			return confirm('CONFIRM SUBJECT DELETE?');
		});
		
	</script>
	</body>
	</html>