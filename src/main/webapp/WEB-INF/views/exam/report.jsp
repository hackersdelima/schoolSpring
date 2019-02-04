<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<jsp:include page="../include.jsp"></jsp:include>

<html>
<head>
<body class="background">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>Actions</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<a href="<spring:url value="/exam/edit/marks?id=${stdDetail.studentid }&examid=${examid }"/>" class="btn btn-success">Edit Marks</a>
			</div>
		</div>
		<div class="x_panel">
			<div class="x_title">
				<h2>STUDENT DETAIL</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<table
					class="table jambo_table table-striped table-bordered display"
					style="color: black; font-weight: bold">
					<tbody>
						<tr>
							<td>Exam: ${examtype }</td>
							<td>Exam Date: ${examdate }</td>
							<td></td>
							<td></td>

						</tr>
						<tr>

							<td>Name: ${stdDetail.studentname }</td>
							<td>Class: ${stdDetail.admissionclass }</td>
							<td>Section: ${stdDetail.section}</td>
							<td>Roll No: ${stdDetail.rollno }</td>
						</tr>
						<tr>

							<td>Gender: <c:if test="${stdDetail.sex eq 'f' }">Female</c:if>
								<c:if test="${stdDetail.sex eq 'm' }">Male</c:if></td>
							<td>Father Name: ${stdDetail.fathername }</td>
							<td>DOB (B.S.): ${stdDetail.dob }</td>
							<td>DOB (A.D.): ${stdDetail.doben }</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
		<div class="x_panel">
			<div class="x_title">
				<h2>MARKS DETAIL</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<table
					class="table jambo_table table-striped table-bordered display"
					style="color: black; font-weight: bold">
					<thead>
						<tr>
							<th rowspan="2">Subject</th>
							<th colspan="2">Full Marks</th>
							<th colspan="2">Pass Marks</th>
							<th colspan="2">Obtained Marks</th>
							<th rowspan="2">Total Marks</th>
							<th rowspan="2">Total Grade</th>
						</tr>
						<tr>
							<th colspan="1">Th marks</th>
							<th colspan="1">Pr marks</th>
							<th colspan="1">Th marks</th>
							<th colspan="1">Pr marks</th>
							<th colspan="1">Th marks</th>
							<th colspan="1">Pr marks</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reportlist }" var="r">
							<tr>
								<td>${r.subjects.subjectname }</td>
								<td colspan="1">${r.subjects.fullmarks }</td>
								<td colspan="1">${r.subjects.fullmarks_pr }</td>
								<td colspan="1">${r.subjects.passmarks }</td>
								<td colspan="1">${r.subjects.passmarks_pr }</td>
								<td colspan="1">${r.subjects.thmarks }</td>
								<td colspan="1">${r.subjects.prmarks }</td>
								<td>${r.subjects.totalmarks }</td>
								<td>${r.subjects.totalgrade }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
		<div class="x_panel">
			<div class="x_title">
				<h2>MARKS SUMMARY</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<table
					class="table jambo_table table-striped table-bordered display"
					style="color: black; font-weight: bold">
					<tbody>
						<tr>
							<td>Full Marks: ${examSummary.total }</td>
							<td>Obtained Marks: ${examSummary.total_obtained }</td>
							<td>Total Days: ${examSummary.totaldays }</td>
							<td>Present Days: ${examSummary.presentdays }</td>
						</tr>
						<tr>
							<td>Percentage: ${examSummary.percentage }</td>
							<td>Final Grade: ${examSummary.finalgrade }</td>
							<td>Result: ${examSummary.finalresult }</td>
							<td>Final Gpa: ${examSummary.finalgpa }</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
	</div>



</body>
</html>
