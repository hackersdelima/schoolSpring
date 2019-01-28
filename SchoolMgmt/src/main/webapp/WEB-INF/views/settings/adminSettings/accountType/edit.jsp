<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../../include.jsp"></jsp:include>

<html>
<head>
<style>
h5 {
	font-size: 80%;
	font-weight: bold;
}
</style>
</head>
<body class="background">
	<div class="col-md-6 col-sm-6 col-xs-6">
		<div class="x_panel">
			<div class="x_title">
				<h2>UPDATE ACCOUNT TYPE</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
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
					<%-- 	<div class="form-group">
							<div class="col-md-9 col-sm-9 col-xs-12 ">
								<h5>Dr/Cr</h5>
								<select name="drcr" class="form-control" required>
									<option value="dr" <c:if test="${accountType.drcr eq 'dr' }">selected</c:if>>Dr.</option>
									<option value="cr" <c:if test="${accountType.drcr eq 'cr' }">selected</c:if>>Cr.</option>
								</select>
							</div>
						</div> --%>

					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	$(".cm").click(function(){
		return confirm('Confirm?')
	});
	</script> 
</body>
</html>