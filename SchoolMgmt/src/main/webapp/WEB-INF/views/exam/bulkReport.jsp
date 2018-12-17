<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/student/studentName" var="studentNameUrl"/>
<spring:url value="/exam/jasper" var="formUrl"/>
<jsp:include page="../include.jsp"></jsp:include>
<html>
<body class="background">
<input type="hidden" value="${studentNameUrl }" id="url">
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
			<form:form action="${formUrl }" 
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
					<!-- <div class="col-md-3">
								<input type="text" class="form-control" id="studentname"
									placeholder="Std. Name" readonly> <br>
							</div> -->
						<div class="col-md-12">
						<div class="col-md-3">
								<h6>
									<strong>Exam*</strong>
								</h6>
								<select class="form-control" name="examid" required>
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
								<select class="form-control" name="classid" id="class" required>
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
								<select class="form-control" name="sectionid" id="section">
									<option value="">Select Section</option>
									<c:forEach items="${section }" var="sec">
									<option value="${sec.sectionname }">${sec.sectionname}</option>
									</c:forEach>
								</select>
							</div>
						
						</div>
					</div>
					<div id="markstable"></div>
				</form:form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$('form').submit(function() {
		return confirm("CONFIRM?");
	});
	 /* $("#validate").click(function() {
			var classname = $("#class").val();
			var section = $("#section").val();
			var rollno = $("#rollno").val();
			var url=$("#url").val();
			$.ajax({
				type : "POST",
				url : url,
				data : {"classname": classname, "section": section, "rollno":rollno},
				cache : false,
				success : function(html) {
					$("#studentname").val(html);
				}
			});
		}); */
	</script>

</body>
</html>
