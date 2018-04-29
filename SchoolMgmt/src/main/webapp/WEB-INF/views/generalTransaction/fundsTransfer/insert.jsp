<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<spring:url value="/fundTransfer/add" var="formUrl"></spring:url>
<jsp:include page="../../include.jsp"></jsp:include>

<html>
<head>
<style>
h5 {
	font-size: 80%;
	font-weight: bold;
}
</style>
</head>
<body class="hiddenscroll bgcolor background">

	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Transaction</li>
				<li class="breadcrumb-item active" aria-current="page">Add
					Transaction</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="col-md-12 col-xs-12">
		<form:form class="form-horizontal form-label-left input_mask"
				action="${formUrl }">
			<div class="x_panel">
				<div class="x_title">
					<h2>New Transaction</h2>
					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
							<button class="btn btn-info" type="button" id="validate">Validate</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<input type="submit" class="btn btn-success" value="Submit">
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
				<br>
					<table class="table">
						<tbody>
							<tr>
								<td>
									<h5>Transaction Id</h5> <input type="text"
									class="form-control sharecertmemberid"
									name="transactionId" value="${tid }">
								</td>
								<td>
									<h5>Reference No</h5> <input type="text" class="form-control"
									name="refNo" value="" data-validation="number"
									data-validation-error-msg=" " data-validation-optional="true">
								</td>
								<td>
									<h5>Transaction Type</h5> <input type="text"
									class="form-control" name="transactionType" value="">
								</td>
								<td>
									<h5>Value Date</h5> <input type="text" class="form-control"
									name="valueDate" value="" >
								</td>
							</tr>
							<tr>
								
								<td>
									<h5>Booking Date</h5> <input type="text" class="form-control"
									name="bookingDate">
								</td>
								<td>
									<h5>Debit Account Number</h5> <input type="text"
									class="form-control" name="debitAccountNumber" value=""
									data-validation="number" data-validation-error-msg=" "
									data-validation-optional="true">
								</td>
								<td>
									<h5>Debit Currency</h5> <input type="text" class="form-control"
									name="debitCurrency" value="" data-validation="number"
									data-validation-error-msg=" " data-validation-optional="true">
								</td>
								<td>
									<h5>Debit Narrative</h5> <input type="text"
									class="form-control" name="debitNarrative" value=""
									data-validation="number" data-validation-error-msg=" "
									data-validation-optional="true">
								</td>
							</tr>
							<tr>
							<td>
									<h5>Credit Account Number</h5> <input type="text"
									class="form-control" name="creditAccountNumber" value=""
									data-validation="number" data-validation-error-msg=" "
									data-validation-optional="true">
								</td>
								<td>
									<h5>Credit Currency</h5> <input type="text"
									class="form-control" name="creditCurrency" value=""
									data-validation="number" data-validation-error-msg=" "
									data-validation-optional="true">
								</td>
								<td>
									<h5>Credit Narative</h5> <input type="text"
									class="form-control" name="creditNarative" value=""
									data-validation="number" data-validation-error-msg=" "
									data-validation-optional="true">
								</td>
								<td>
									<h5>Amount</h5> <input type="text" class="form-control"
									name="amount" value="0" data-validation="number"
									data-validation-error-msg=" " data-validation-optional="true">
								</td>
							</tr>
							<tr>
								<td>
									<h5>Commission Code</h5> <input type="text"
									class="form-control" name="commissionCode" value="">
								</td>
								<td>
									<h5>Commission Type</h5> <input type="text"
									class="form-control" name="commissionType" value="">
								</td>
								<td>
									<h5>Commission Amount</h5> <input type="text"
									class="form-control" name="commissionAmount" value="0"
									data-validation="number" data-validation-error-msg=" "
									data-validation-optional="true">
								</td>
								<td>
									<h5>Cheque Number</h5> <input type="text" class="form-control"
									name="chequeNumber" value="" data-validation="number"
									data-validation-error-msg=" " data-validation-optional="true">
								</td>
							</tr>
							<tr>
								
								<td>
									<h5>Processing Date</h5> <input type="text"
									class="form-control" name="processingDate" value=""
									data-validation="date" data-validation-error-msg=" "
									data-validation-optional="true">
								</td>
								<td>
									<h5>Override</h5> <input type="text" class="form-control"
									name="Override" value="">
								</td>
								<td>
									<h5>Record Status</h5> <input type="text" class="form-control"
									name="recordStatus" value="">
								</td>
								<td>
									<h5>Branch Code</h5> <input type="text" class="form-control"
									name="branchCode" value="">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</form:form>
		</div>
	</div>
</body>
</html>
