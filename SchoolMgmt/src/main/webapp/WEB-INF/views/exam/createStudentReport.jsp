<jsp:include page="../include.jsp"></jsp:include>
<html>
<head>
<style>
.workform input{
	border:none;
	width: 100%;
	}
	</style>
</head>
<body class="background">
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>Create Student Exam Report</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form action="studentMarks.add" method="post"
					style="margin-top: 10px;" class="form">
					<div role="tabpanel" class="tab-pane" aria-labelledby="profile-tab">
					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<input type="submit" class="btn btn-success" value="Submit">
						</div>
					</div><br>
					<div class="ln_solid"></div>
					<div class="col-md-3">
								<input type="text" class="form-control" id="studentname"
									placeholder="Std. Name" readonly> <br>
							</div>
						<div class="col-md-12">
						<div class="col-md-3">
								<h6>
									<strong>Exam*</strong>
								</h6>
								<select class="form-control" name="examid" required>
									<option value="">Select Exam</option>
								</select>
							</div>
							<div class="col-md-3">
								<h6>
									<strong>Class*</strong>
								</h6>
								<select class="form-control" name="classid" id="class" required>
									<option value="">Select Class</option>
									
									
								</select>
							</div>
							<div class="col-md-3">
								<h6>
									<strong>Section</strong>
								</h6>
								<select class="form-control" name="sectionid" id="section">
									<option value="">Select Section</option>
								</select>
							</div>
							<div class="col-md-3">
								<h6>
									<strong>Roll No</strong>
								</h6>
								<input type="text" class="form-control" name="rollno" id="rollno"
									placeholder="" required>
									<br>
							</div>
						</div>
					</div>
					<div id="markstable"></div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	$('form').submit(function() {
		return confirm("CONFIRM?");
	});
		$("#class").change(function() {
			var id = $(this).val();
			var dataString = 'id=' + id;

			$.ajax({
				type : "POST",
				url : "getMarksInputTable.click",
				data : dataString,
				cache : false,
				success : function(html) {
					$("#markstable").html(html);
				}
			});
		});
		$("#validate").click(function() {
			var classname = $("#class").val();
			var section = $("#section").val();
			var rollno = $("#rollno").val();
			$.ajax({
				type : "POST",
				url : "getstudentname.click",
				data : {"classname": classname, "section": section, "rollno":rollno},
				cache : false,
				success : function(html) {
					$("#studentname").val(html);
				}
			});
		});
	</script>
</body>
</html>