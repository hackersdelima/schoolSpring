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
color:black;
font-weight:bold;}
</style>

</head>

<body class="background">
	<div class="x_panel">
		<div class="x_title">
			<h2>ASSIGNED SUBJECTS : <b>Admission Number ${id }</b></h2>
			
		<a href="<spring:url value="/nav/v/assignedsubjectsstd"/>" class="btn btn-primary btn-sm">Back</a>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<table id="datatable"
				class="table jambo_table table-striped table-bordered"
				style="font-size: 95%;width:50%">
				<thead>
					<tr class="headings">
				
						<th>Subject Name</th>
							<th>Subject Code</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list }" var="c">
						<tr>
							
							<td> ${c.subjectname }</td>
							<td>${c.subjectCode }</td>
						</tr>
						</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
</body>
</html>
