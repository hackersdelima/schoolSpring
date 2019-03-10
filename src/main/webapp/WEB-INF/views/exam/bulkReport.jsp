<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<tag:header title="REPORT SEARCH-BOX" />
<spring:url value="/student/studentName" var="studentNameUrl" />
<spring:url value="/exam/jasper" var="formUrl" />
<form:form action="${formUrl }" style="margin-top: 10px;" class="form">
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
						<option value="${cl.classid }">${cl.classname }</option>
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
<tag:footer />
<div class="panel panel-default">
	<div class="panel-heading">
	<h4>CONSOLIDATE MARKS</h4></div>
	<div class="panel-body">
		<spring:url value="/exam/consolidate/bulkreport" var="formUrl" />
		<form:form action="${formUrl }" style="margin-top: 10px;" class="form">
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
							<strong>Academic Session</strong>
						</h6>
						<select class="form-control" name="academicdate" id="academicdate" required>
							<option value="">Select Academic Date</option>
						<c:forEach items="${academicdates }" var="a">
							<option value="${a.id }" <c:if test="${a.id eq g.academicdates.id }">selected</c:if>>${a.academicdate } (${a.academicdateen })</option>
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
								<option value="${cl.classid }">${cl.classname }</option>
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
		</form:form>
	</div>
</div>

<script type="text/javascript">
	$('form').submit(function() {
		return confirm("CONFIRM?");
	});
	</script>
