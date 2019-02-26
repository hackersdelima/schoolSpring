<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="UPDATE ACCOUNT TYPE"/>
			<spring:url value="/accountType/update" var="formUrl"/>
				<form class="form-horizontal" method="post"
					action="${formUrl }">
					<div class="form-group">
						<div class="form-group">
							<div class="col-md-9 col-sm-9 col-xs-12 ">
							<input type="submit" class="btn btn-success cm" value="Update">
								<button class="btn btn-info" type="button" id="validate">Validate</button>
								<a class="btn btn-danger cm" href="<spring:url value="/accountType/delete/${id }"/>">Delete</a>
								<a class="btn btn-info" href="<spring:url value="/nav/accountType"/>">Go Back</a>
							</div>
						</div>
						<div class="ln_solid"></div>
						<div class="form-group">
							<div class="col-md-9 col-sm-9 col-xs-12">
								<input type="hidden" name="previousAccountType"
									value="${accountType.accountType }">
								<h5>Account Type</h5>
								<input type="text" class="form-control" name="accountType"
									value="${accountType.accountType }" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-9 col-sm-9 col-xs-12 ">
								<h5>Account Type Head</h5>
								<input type="text" class="form-control " name="accountTypeHead"
									value="${accountType.accountTypeHead}">

							</div>
						</div>
					</div>
				</form>
		<<tag:footer/>
	<script>
	$(".cm").click(function(){
		return confirm('Confirm?')
	});
	</script> 
