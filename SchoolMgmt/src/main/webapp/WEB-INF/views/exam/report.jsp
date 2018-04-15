<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include.jsp"></jsp:include>
<html>
<head>

<style>
.borderless tfoot tr td {
	border: none
}
</style>
</head>
<body class="container background">
	<div>
		<table class="table">
			<caption style="text-align: center">
				<h2>${sessionScope.systemdetail[0].settingsdescription }</h2>
				<h4>${sessionScope.systemdetail[2].settingsdescription } (${sessionScope.systemdetail[3].settingsdescription })</h4>
				<h4>
					<strong>${examname }(${sessionScope.systemdetail[5].settingsdescription })</strong>
				</h4>
			</caption>
			<tbody>
				<tr>
					<td>Name of Student: <strong>${stdDetail.studentname }</strong></td>
					<td>Class: <strong>${stdDetail.admissionclass }</strong></td>
					<td>Section: <strong>${stdDetail.section }</strong></td>
				</tr>
				<tr>
					<td>Roll No: <strong>${stdDetail.rollno }</strong>
					<td>
					<td>Admission No: <strong>${stdDetail.studentid }</strong></td>

					<td></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div>

		<table class="table table-striped table-bordered borderless">
			<thead>

				<tr>
					<th>Subject Name</th>
					<th>Subject Code</th>
					<th>Subject Type</th>
					<th>Th. Marks</th>
					<th>Pr. Marks</th>
					<th>Total Marks</th>
					<th>Grade</th>
					<th>Remarks</th>
				</tr>

			</thead>
			<tbody>
				<c:forEach items="${reportlist }" var="rep">
					<tr>
						<td>${rep.subjectname }</td>
						<td>${rep.subjectcode }</td>
						<td>${rep.subjecttype }</td>
						<td>${rep.thmarks }/75</td>
						<td>${rep.prmarks }/25</td>
						<td>${rep.totalmarks }/100</td>
						<td>${rep.totalgrade }</td>
						<td>${rep.remarks }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td>Result : <strong>Pass</strong></td>
					<td>Total: <strong>500/1000</strong></td>
				</tr>
				<tr>
					<td>Percentage : <strong>50.32%</strong></td>
					<td>Rank: <strong>NA</strong></td>
				</tr>
				<tr>
					<td>Date of Issue : <strong>2018-11-01</strong></td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>