<jsp:include page="../include.jsp"></jsp:include>
<html>
<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">General</a></li>
				<li class="breadcrumb-item active" aria-current="page">Exam</li>
				<li class="breadcrumb-item active" aria-current="page">Search
					Student Report</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-10 col-sm-10 col-xs-10">

		<div class="x_panel">
			<div class="x_title">
				<h2>REPORT SEARCH-BOX</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="specificStudentReport.view" >
				<table class="table">
					<tbody>
						<tr>

							<td><h6>Exam*</h6> <select class="form-control"
								name="examid"  required>
									<option value="" selected>Select exam</option>
								
							</select></td>
							<td><h6>Class*</h6> 	<select class="form-control" name="classname" id="class" required>
									<option value="">Select Class</option>
								
								</select></td>
							<td><h6>Section</h6>  	<select class="form-control" name="section" id="section">
									<option value="">Select Section</option>
								</select></td>
							<td><h6>Roll No*</h6> <input type="text"
								class="form-control" name="rollno" required></td>
							<!-- <td><h6>Student ID*</h6> <input type="text"
								class="form-control" name="studentid" form="form" required></td> -->

						</tr>
						<tr>
							<td>
								<button type="submit" class="btn btn-success" >
									<i class="fa fa-check"></i> Search
								</button>
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	<%if (request.getAttribute("msg") != null) {%>
	$('#myModal').modal('show');
<%}%>
	</script>

</body>
</html>
