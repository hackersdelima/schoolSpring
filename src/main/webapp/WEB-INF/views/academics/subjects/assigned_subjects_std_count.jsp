<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../include.jsp"></jsp:include>

<html>
<head>
<style>
.tbltophead th {
	text-align: center;
}
table{
font-weight:bold;
color: black;}
</style>

</head>

<body class="background">
	<div class="x_panel">
		<div class="x_title">
			<h2>ASSIGNED SUBJECTS LIST</h2>
			<a href="<spring:url value="/nav/assignedsubjects"/>" class="btn btn-primary btn-sm">Back</a>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<table id="datatable"
				class="table jambo_table table-striped table-bordered"
				style="font-size: 95%;">
				<thead>
					<tr class="headings">
						<th>Student Name</th>
						<th>Class Name</th>
						<th>Roll Number</th>
						<th>Subject Count</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td></td>
							<td> </td>
							<td></td>
							<td> </td>
							<td><a
								href="<spring:url value="/operation/view//stdsubjects"></spring:url>">Detail</a></td>
						</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
