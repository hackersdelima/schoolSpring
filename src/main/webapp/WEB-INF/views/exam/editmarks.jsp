<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>

<jsp:include page="../include.jsp"></jsp:include>
<body class="background">
<spring:url value="/exam/edit/updatemarks" var="formurl" />
<form method="post" action="${formurl }">
<div class="x_panel">
			<div class="x_title">
				<h2>Actions</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<input type="submit" class="btn btn-success" value="Update Marks">
			</div>
		</div>
	<div class="x_panel">
		<div class="x_title">
			<h2>STUDENT DETAIL</h2>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<table class="table jambo_table table-striped table-bordered display"
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
								<td><input type="hidden" value="${r.exammarksid }" name="exammarksid">${r.subjects.subjectname }</td>
								<td colspan="1">${r.subjects.fullmarks }</td>
								<td colspan="1">${r.subjects.fullmarks_pr }</td>
								<td colspan="1">${r.subjects.passmarks }</td>
								<td colspan="1">${r.subjects.passmarks_pr }</td>
								<td colspan="1"><input type="text" name="thmarks" class="form-control" value="${r.subjects.thmarks }"></td>
								<td colspan="1"><input type="text" name="prmarks" class="form-control" value="${r.subjects.prmarks }"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
		</form>
</body>
