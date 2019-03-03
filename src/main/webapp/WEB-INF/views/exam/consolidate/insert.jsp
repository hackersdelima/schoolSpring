<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="SET CONSOLIDATE MARKS"/>
				<spring:url value="/consolidate/set" var="formUrl"/>
						<form:form class="form-horizontal form-label-left input_mask"
				action="${formUrl }">
					<br />

					<div class="form-group">
						
					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<input type="submit" class="btn btn-success" value="Submit">
						</div>
					</div>
					<div class="ln_solid"></div>
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Exam Name</label>
						<div class="col-md-3 col-sm-3 col-xs-12">
							 <select id="examid"
									class="form-control" name="examid" required>
									<option value="">Select Exam</option>
									<c:forEach items="${examlist }" var="e">
									<option value="${e.examid }">${e.examname }</option>
									</c:forEach>
									</select>
						</div>
						
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Theory %
						</label>
						<div class="col-md-2 col-sm-2 col-xs-12">
							<input type="text"
									class="form-control" name="theoryper">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Practical %
						</label>
						<div class="col-md-2 col-sm-2 col-xs-12">
							<input type="text"
									class="form-control" name="practicalper">
						</div>
					</div>
			</form:form>
	<tag:footer/>


