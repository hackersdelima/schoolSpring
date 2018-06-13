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
				<h4>${sessionScope.systemdetail[2].settingsdescription }
					(${sessionScope.systemdetail[3].settingsdescription })</h4>
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

				<tr style="background-color: white; color: black">
					<th colspan="3" style="text-align: center">SUBJECT</th>
					<th colspan="2">FULL MARKS</th>
					<th colspan="2">PASS MARKS</th>
					<th colspan="2">OBTAINED MARKS</th>
					<th colspan="2">TOTAL</th>

					<th rowspan="2">REMARKS</th>
				</tr>
				<tr class="headings">
					<th>Name</th>
					<th>Code</th>
					<th>Type</th>

					<th>Th. Marks</th>
					<th>Pr. Marks</th>

					<th>Th. Marks</th>
					<th>Pr. Marks</th>

					<th>Th. Marks</th>
					<th>Pr. Marks</th>
					
					<th>Marks</th>
					<th>Grade</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${reportlist }" var="rep">
					<tr>
						<td>${rep.subjects.subjectname }</td>
						<td>${rep.subjects.subjectcode }</td>
						<td>${rep.subjects.subjecttype }</td>
						
						<td>${rep.subjects.fullmarks }</td>
						<td>${rep.subjects.fullmarks_pr }</td>
						
						<td>${rep.subjects.passmarks }</td>
						<td>${rep.subjects.passmarks_pr }</td>
						
						<td>${rep.subjects.thmarks }</td>
						<td>${rep.subjects.prmarks }</td>
						
						<td>${rep.subjects.totalmarks }</td>
						<td>${rep.subjects.totalgrade }</td>
						
						<td>${rep.subjects.remarks }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td>Result : <strong></strong></td>
					<td colspan="3">Total Obtained: <strong>${examSummary.total_obtained}</strong></td>
					<td colspan="3">Total: <strong>${examSummary.total}</strong></td>
				</tr>
				<tr>
					<td colspan="4">Percentage : <strong>${examSummary.percentage }%</strong></td>
					<td>Rank: <strong>NA</strong></td>
				</tr>
				<tr>
					<td colspan="3">Date of Issue : <strong>${examSummary.curdate }</strong></td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>