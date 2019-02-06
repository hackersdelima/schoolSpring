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
					<tr class="headings">
						<th>Classname</th>
						<th>Subjects Count</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${courselist }" var="c">
						<tr>
							<td><span class="badge badge-primary badge-pill">Class ${c.classname }</span></td>
							<td> <span class="badge badge-primary badge-pill">${c.subjectid }</span></td>
							<td><a
								href="<spring:url value="/operation/view/${c.gradeid }/classsubjects"></spring:url>">Detail</a></td>
						</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
