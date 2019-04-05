<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<tag:header title="CREATE STUDENT EXAM REPORT" />
<input type="hidden" value="${getStudents }" id="getClassStudents">
<spring:url value="/exam/getClassStudents" var="getStudents" />
<spring:url value="/exam/addSubMarks" var="formUrl" />
<spring:url value="/exam/classSubject" var="classSubject"></spring:url>
<form:form action="${formUrl }" method="post" style="margin-top: 10px;"
	class="form" modelAttribute="examModel">
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
					<strong>Class*</strong>
				</h6>
				<select class="form-control class" name="classname" id="class"
					required>
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
			<div class="col-md-3">
				<h6>
					<strong>Subject</strong>
				</h6>
				<select class="form-control sub" name="subjects.subjectid"
					id="subject">
					<option value="">Select Subject</option>
				</select>

			</div>
		</div>
	</div>
	<br>
	<br>
	<div id="markstable"></div>
</form:form>
<tag:footer />
<script>
	$('form').submit(function() {
		return confirm("CONFIRM?");
	});
	
		var getclassstudentsUrl = '${getStudents }';
		 $("#validate").click(function() {
			var classname = $("#class").val();
			var sectionname=$("#section").val();
			var subjectid=$("#subject").val();
			var url=getclassstudentsUrl;
			$.ajax({
				type : "POST",
				url : url,
				data : {"classname": classname,"sectionname": sectionname, "subjectid": subjectid},
				cache : false,
				success : function(html) {
					$("#markstable").html(html);
				}
			});
		});
		
		 //for dynamic select
		var getclasssubjectsUrl  = '${classSubject}';
				$(".class").change(function()
				{
				var id=$(this).val();
				var dataString = 'id='+ id;
				$.ajax
				({
				type: "POST",
				url: getclasssubjectsUrl,
				data: dataString,
				cache: false,
				success: function(html)
				{
					
				$("#subject").html(html);
				} 
				});
		});
				
	</script>
