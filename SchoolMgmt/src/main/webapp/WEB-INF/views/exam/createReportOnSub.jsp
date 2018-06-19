<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include.jsp"></jsp:include>

<spring:url value="/exam/getClassStudents" var="getStudents"/>
<spring:url value="/exam/addSubMarks" var="formUrl"/>
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
<input type="hidden" value="${getStudents }" id="getClassStudents">
	<div class="col-md-12 col-sm-12 col-xs-12">

		<div class="x_panel">
			<div class="x_title">
				<h2>Create Student Exam Report</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form:form action="${formUrl }" method="post" 
					style="margin-top: 10px;" class="form" modelAttribute="examModel">
					<div role="tabpanel" class="tab-pane" aria-labelledby="profile-tab">
					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<input type="submit" class="btn btn-success" value="Submit">
						</div>
					</div><br>
					<div class="ln_solid"></div>
				
						<div class="col-md-12">
						<div class="col-md-3">
								<h6>
									<strong>Exam*</strong>
								</h6>
								<select class="form-control" name="examid" >
									<option value="">Select Exam</option>
									<c:forEach items="${examlist }" var="exam">
										<option value="${exam.examid }">${exam.examname }</option>
									</c:forEach>
									
								</select>
							</div>
							<div class="col-md-3">
								<h6>
									<strong>Class*</strong>
								</h6>
								<select class="form-control" name="classname" id="class" required>
									<option value="">Select Class</option>
									<c:forEach items="${classlist }" var="cl">
									<option value="${cl.classname }">${cl.classname }</option>
									</c:forEach>
									
									
								</select>
							</div>
							<div class="col-md-3">
								<h6>
									<strong>Section</strong>
								</h6>
								<select class="form-control" name="sectionname" id="section">
									<option value="">Select Section</option>
									<c:forEach items="${section }" var="sec">
									<option value="${sec.sectionname }">${sec.sectionname}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-3">
								<h6>
									<strong>Subject</strong>
								</h6>
								<select class="form-control" name="subjects.subjectid" id="subject">
									<option value="">Select Subject</option>

									<c:forEach items="${subject }" var="sub">
									<option value="${sub.subjectid }">${sub.subjectname}</option>

									</c:forEach>
								</select>
								
							</div>
						</div>
					</div>
					<br>
					<br>
					<div id="markstable"></div>
				</form:form>
				
			</div>
		</div>
	</div>
	
	<script>
	$('form').submit(function() {
		return confirm("CONFIRM?");
	});
	
		
		 $("#validate").click(function() {
			var classname = $("#class").val();
			var sectionname=$("#section").val();
			var subjectcode=$("#subject").val();
			var url=$("#getClassStudents").val();
			$.ajax({
				type : "POST",
				url : url,
				data : {"classname": classname,"sectionname": sectionname, "subjectcode": subjectcode},
				cache : false,
				success : function(html) {
					$("#markstable").html(html);
				}
			});
		});
		
	</script>
</body>
</html>