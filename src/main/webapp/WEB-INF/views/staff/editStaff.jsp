<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../include.jsp"></jsp:include>
<spring:url value="/staff/update" var="formUrl"></spring:url>
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
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Staff</li>
				<li class="breadcrumb-item active" aria-current="page">Update
					Staff</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="col-md-8 col-xs-12">
			<div class="x_panel">
				<form:form class="form-horizontal form-label-left input_mask" method="post"
					action="${formUrl }">

					<div class="x_title">
						<h2>Update Staff</h2>
						<div class="col-md-4 col-sm-4 col-xs-12 pull-right"></div>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<br />

						<div class="form-group">

							<div class="form-group">
								<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
									<button class="btn btn-info" type="button" id="validate">Validate</button>
									<button class="btn btn-primary confirm" type="reset">Reset</button>
									<a class="btn btn-danger confirm"
										href="<spring:url value="/staff/delete/${staff.staffCode}"/>">Delete</a>
									<input type="submit" class="btn btn-success" value="Submit">
								</div>
							</div>
							<hr>
							<div class="form-group">
								<label class="control-label col-md-2 col-sm-2 col-xs-12">Staff
									Name</label>
								<div class="col-md-4 col-sm-4 col-xs-12">
									<input type="hidden" value="${staff.staffCode }"
										name="staffCode"> <input type="text"
										class="form-control" id="staffName" name="staffName"
										value="${staff.staffName }" value="" required>
								</div>
							</div>
							<div class="form-group" id="cashWithdraw">
								<label class="control-label col-md-2 col-sm-2 col-xs-12">Staff
									Address</label>
								<div class="col-md-4 col-sm-4 col-xs-12">
									<input type="text" class="form-control" name="staffAddress"
										value="${staff.staffAddress }">
								</div>
							</div>
							<div class="form-group" id="cashDeposit">
								<label class="control-label col-md-2 col-sm-2 col-xs-12">
									Post</label>
								<div class="col-md-4 col-sm-4 col-xs-12">
									<input type="text" class="form-control" name="post"
										value="${staff.post }" required>

								</div>

							</div>
							<div class="form-group" id="cashDeposit">
								<label class="control-label col-md-2 col-sm-2 col-xs-12">
									Branch Code</label>
								<div class="col-md-4 col-sm-4 col-xs-12">
									<input type="text" class="form-control" name="branchCode"
										value="${staff.branchCode }" required>

								</div>

							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
<script>
	$(".confirm").click(function(){
		return confirm("Confirm?");
	})
	$("form").submit(function(){
		return confirm("Confirm Submit?");
	});
</script>
</body>
</html>
