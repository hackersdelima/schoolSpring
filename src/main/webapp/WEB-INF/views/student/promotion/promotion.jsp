<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="STUDENT PROMOTION"/>
			<spring:url value="/student/promote" var="formUrl"/>
				<form method="post" action="${formUrl }">
					<div>
						<button type="submit" class="btn btn-success">
							<i class="fa fa-check"></i> Promote
						</button>
					</div>
					<div class="col-md-12">
						<div class="col-md-4">
							<div class="col-md-12">
								<h6>Current Class</h6>
								<select class="form-control" name="currentclass"
									id="currentclass">
									<option value="">Select Class</option>
									<c:forEach items="${classlist }" var="c">
										<option value="${c.classid }">${c.classname }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-12">

								<h6>Promote to Class</h6>
								<select class="form-control" name="promotetoclass">
									<option value="">Select Class</option>
									<c:forEach items="${classlist }" var="c">
										<option value="${c.classid }">${c.classname }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-12">

								<h6>Status</h6>
								<select class="form-control" name="status">
									<option value="">Select Status</option>
									<c:forEach items="${status }" var="s">
										<option value="${s.id }">${s.name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-md-8" id="studentstbl">
						</div>
					</div>
				</form>
	<spring:url value="/nav/v/getClassStudents" var="getStudentsUrl" />
	
<tag:footer/>
<script type="text/javascript">
	$("#currentclass").change(function() {
		var classid = $(this).val();
		var url='${getStudentsUrl}';
		$.ajax({
			type : "POST",
			url : url,
			data : {"classid": classid},
			cache : false,
			success : function(html) {
				$("#studentstbl").html(html);
			}
		});
	});
	
	$(form).submit(function(){
		return confirm('Promotion Confirm?');
	});
	</script>