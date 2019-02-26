<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="ATTENDANCE"/>
			<spring:url value="/student/studentName" var="studentNameUrl" />
<spring:url value="/exam/setMarks" var="setMarksUrl" />
<spring:url value="/exam/attendanceInExam" var="formUrl" />
				<form:form action="${formUrl }" style="margin-top: 10px;"
					class="form">
					<div role="tabpanel" class="tab-pane" aria-labelledby="profile-tab">
						<div class="form-group">
							<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
								<button class="btn btn-info" type="button" id="validate">Validate</button>
								<button class="btn btn-primary" type="reset">Reset</button>
								<input type="submit" class="btn btn-success" value="Submit">
							</div>
						</div>
						<br>
						<div class="ln_solid"></div>
						
						<div class="col-md-12">
							<div class="col-md-3">
								<h6>
									<strong>Exam*</strong>
								</h6>
								<select class="form-control" name="examid">
									<option value="">Select Exam</option>
									<c:forEach items="${examlist }" var="exam">
										<option value="${exam.examid }">${exam.examname }</option>
									</c:forEach>

								</select>
							</div>
							<div class="col-md-3">
								<h6>
									<strong>Total Days</strong>
								</h6>
								<input type="text" class="form-control" name="totalDays"
									id="rollno" placeholder="" pattern="[0-9]+" required> <br>
							</div>
						</div>
					</div>
					<div id="markstable"></div>
				</form:form>
			
<tag:footer/>
	<script>
		$('form').submit(function() {
			return confirm("CONFIRM?");
		});

		$("#validate").click(function() {
			var classname = $("#class").val();
			var section = $("#section").val();
			var rollno = $("#rollno").val();
			var url = $("#url").val();
			$.ajax({
				type : "POST",
				url : url,
				data : {
					"classname" : classname,
					"section" : section,
					"rollno" : rollno
				},
				cache : false,
				success : function(html) {
					$("#studentname").val(html);
				}
			});
		});
	</script>