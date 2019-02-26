<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="STUDENT ATTENDANCE LIST"/>
				<spring:url value="/exam/getStudentsforAttendance" var="getStudents"/>
<spring:url value="/exam/setStudentPresentdays" var="formUrl"/>
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
								<select class="form-control class" name="classid" id="classid" required>
									<option value="">Select Class</option>
									<c:forEach items="${classlist }" var="cl">
									<option value="${cl.classid }">${cl.classname }</option>
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
						</div>
					</div>
					
				
			<div class="x_panel">
			<div class="col-md-8" id="markstable"></div>
			<div class="x_content">
			</div>
			</div>
		</form:form>
	<input type="hidden" value="${getStudents}" id="getstudents">
	<tag:footer/>
	<script>
	$(document).ready(function() {
	
	$('form').submit(function() {
		return confirm("CONFIRM?");
	});
	
		
		 $("#validate").click(function() {
			var classid = $("#classid").val();
			var sectionname=$("#section").val();
			var url=$("#getstudents").val();
			$.ajax({
				type : "POST",
				url : url,
				data : {"classid": classid,"sectionname": sectionname},
				cache : false,
				success : function(html) {
					$("#markstable").html(html);
				}
			});
		});
	});
	</script>