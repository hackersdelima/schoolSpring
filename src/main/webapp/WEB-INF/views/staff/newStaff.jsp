<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<tag:header title="STAFF REGISTRATION" />
<spring:url value="/staff/add" var="formUrl"></spring:url>
<form:form class="form-horizontal form-label-left input_mask"
	method="post" action="${formUrl }">
	<br />

	<div class="form-group">

		<div class="form-group">
			<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
				<button class="btn btn-info" type="button" id="validate">Validate</button>
				<button class="btn btn-primary" type="reset">Reset</button>
				<input type="submit" class="btn btn-success" value="Submit">
			</div>
		</div>
		<hr>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-xs-12">Staff
				Name</label>
			<div class="col-md-4 col-sm-4 col-xs-12">
				<input type="text" class="form-control" id="staffName"
					name="staffName" value="" required>
			</div>
		</div>
		<div class="form-group" id="cashWithdraw">
			<label class="control-label col-md-2 col-sm-2 col-xs-12">Staff
				Address</label>
			<div class="col-md-4 col-sm-4 col-xs-12">
				<input type="text" class="form-control" name="staffAddress" value="">
			</div>
		</div>
		<div class="form-group" id="cashDeposit">
			<label class="control-label col-md-2 col-sm-2 col-xs-12">
				Post</label>
			<div class="col-md-4 col-sm-4 col-xs-12">
				<input type="text" class="form-control" name="post" value=""
					required>

			</div>

		</div>
		<div class="form-group" id="cashDeposit">
			<label class="control-label col-md-2 col-sm-2 col-xs-12">
				Branch Code</label>
			<div class="col-md-4 col-sm-4 col-xs-12">

				<input type="text" class="form-control" name="branchCode"
					value="${sessionScope.userDetail.branch.branchId }" required>

			</div>

		</div>
	</div>
</form:form>

<tag:footer />
<script>
	$(".confirm").click(function(){
		return confirm("Confirm?");
	})
	$("form").submit(function(){
		return confirm("Confirm Submit?");
	});
</script>
