<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include.jsp"></jsp:include>
<c:forEach items="${reportlist }">
<html>
<head>

<style>
.borderless tfoot tr td {
	border: none
}

body {
	background: rgb(204, 204, 204);
}

page {
	background: white;
	display: block;
	margin: 0 auto;
	margin-bottom: 0.5cm;
	box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
}

page[size="A4"] {
	width: 21cm;
	height: 29.7cm;
}

@media print {
	body, page {
		margin: 0;
		box-shadow: 0;
	}
}

@page {
	size: auto; /* auto is the current printer page size */
	margin: 0mm; /* this affects the margin in the printer settings */
}
</style>


</head>






<body class="container">
	<page size="A4">
	<div id=printMe style="margin-left: 20px; margin-right: 20px;padding-top:15px;">
		<div class="col-md-12">
			<div class="col-md-4">
				<img class="img-circle" id="myImg"
					src="//124.41.193.91/images/araniko/Logo.jpg"
					style="width: 150px; height: 150px" />
			</div>
			<div class="col-md-8">
				<table class="table">
					<tr>
						<td><h1>${sessionScope.systemdetail[0].settingsdescription }</h1></td>
					</tr>
					<tr>
						<td>
							<h4>${sessionScope.systemdetail[2].settingsdescription }
								</h4>
						</td>
					</tr>
					<tr>
						<td><h4>
								${examtype }
							</h4></td>
					</tr>
				</table>
			</div>
		</div>

		<table class="table">
			<tbody>
				<tr>
					<td>Name of Student: <strong>${stdDetail.studentname }</strong></td>
					<td>Class: <strong>${stdDetail.admissionclass }</strong></td>
					<td>Section: <strong>${stdDetail.section }</strong></td>
				</tr>
				<tr>
					<td>Roll No: <strong>${stdDetail.rollno }</strong> 

						<td>Exam Date: <strong>${examSummary.startdate }</strong>
						</td>
						
					</tr>
				</tbody>
			</table>

		<div>

			<table class="table table-striped table-bordered borderless">
				<thead>

					<tr style="background-color: white; color: black">
						<th rowspan="2">S.N.</th>
						<th colspan="1" style="text-align: center">SUBJECT</th>
						<th colspan="2">FULL MARKS</th>
						<th colspan="2">PASS MARKS</th>
						<th colspan="2">OBTAINED MARKS</th>
						<th colspan="2">TOTAL</th>
						<th rowspan="2">REMARKS</th>
					</tr>
					<tr class="headings">
						<th>Name</th>

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
					<c:forEach items="${reportlist }" var="rep" varStatus="counter">

						<tr>
							<td>${counter.count}</td>
							<td>${rep.subjects.subjectname }</td>

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
						<td colspan="2">Result : <strong></strong></td>
						<td colspan="2">Full Marks: <strong>${examSummary.total}</strong></td>
						<td colspan="2"></td>
						<td colspan="2">Total Obtained: <strong>${examSummary.total_obtained}</strong></td>

					</tr>
					<tr>
						<td colspan="4">Percentage : <strong>${examSummary.percentage }%</strong></td>
						<td>Rank: <strong>NA</strong></td>
					</tr>
					<%-- <tr>
						<td colspan="3">Date of Issue : <strong>${examSummary.curdate }</strong></td>
					</tr> --%>
					
				</tfoot>
				
				
			</table>
			<div>
			<br>
			<br>
			  <h2><strong>..........................</strong></h2>
			  <h2>Head of Faculty</h2>
			  </div>
			  <div class="pull-right">
			
			
			  <h2 ><strong>..........................</strong></h2>
			  <h2 >  &nbsp&nbsp&nbsp&nbsp&nbspPrincipal</h2>
			  </div>
			 
			
			
			
		</div>
</div>
</page>


		<script>
			function printDiv(divName) {
				var printContents = document.getElementById(divName).innerHTML;
				var originalContents = document.body.innerHTML;
				document.body.innerHTML = printContents;
				window.print();
				document.body.innerHTML = originalContents;
			}
		</script>

</body>
</html>
</c:forEach>