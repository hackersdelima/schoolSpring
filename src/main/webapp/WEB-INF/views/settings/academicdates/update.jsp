<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="ACADEMIC DATES SETTINGS"/>
<p style="color:red">${msg }</p>
				<spring:url value="/academicdates/update/${a.id }" var="formUrl"/>
						<form class="form-horizontal form-label-left input_mask" method="post" action="${formUrl }" >
					<div class="form-group">
						
					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
						<a class="btn btn-info" href="<spring:url value="/academicdates/dates_list"/>">Back</a>
							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<input type="submit" class="btn btn-success" value="Update">
						</div>
					</div>
					<div class="ln_solid"></div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Date (NP)
						</label>
						<div class="col-md-3 col-sm-3 col-xs-12">
							<input type="text"
									class="form-control " name="academicdate" value="${a.academicdate }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2 col-sm-2 col-xs-12">Date (EN)
						</label>
						<div class="col-md-3 col-sm-3 col-xs-12">
							<input type="text"
									class="form-control " name="academicdateen" value="${a.academicdateen }">
						</div>
					</div>
			</form>
	<tag:footer/>