<jsp:include page="/includefile"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
</head>
<body class="background">
<div class="panel panel-default" style="width: 95%; margin: auto;">
<div class="panel-body ">
		
<form class="form-horizontal shareCertForm" id="form1" method="post"
				action="transaction.update">
					<table class="table">
						<tbody>
							<tr>
								<td><input type="submit" class="btn btn-success"
									value="Update"></td>
							</tr>
							<tr>
								<td>
									<input type="hidden"
									class="form-control sharecertmemberid" name="previousid" value="${tdetail.id }" >
									<h5>Transaction Id</h5> <input type="text"
									class="form-control sharecertmemberid" name="Id" data-validation="number" value="${tdetail.id }">
								</td>
								<td>
										<h5>Reference No</h5> <input type="text"
									class="form-control" name="refNo" value="${tdetail.refNo }" >
									</td>
								<td>
									<h5>Transaction Type</h5> <input type="text"
									class="form-control" name="transactionType" value="${tdetail.transactionType }">
								</td>
							</tr>
							<tr>
								<td>
									<h5>Value Date</h5> <input type="text"
									class="form-control" name="valueDate" value="${tdetail.valueDate }" >
								</td>
								<td>
									<h5>Booking Date</h5> <input type="text" class="form-control"
									name="bookingDate" value="${tdetail.bookingDate }">
								</td>
								<td>
									<h5>Debit Account Number</h5> <input type="text"
									class="form-control" name="debitAccountNumber" value="${tdetail.debitAccountNumber }">
								</td>
							</tr>
							<tr>
								
								<td>
									<h5>Debit Currency</h5> <input type="text"
									class="form-control" name="debitCurrency" value="${tdetail.debitCurrency }">
								</td>
								<td>
									<h5>Debit Narrative</h5> <input type="text"
									class="form-control" name="debitNarrative" value="${tdetail.debitNarrative }">
								</td>
								<td>
									<h5>Credit Account Number</h5> <input type="text"
									class="form-control" name="creditAccountNumber" value="${tdetail.creditAccountNumber }">
								</td>
							</tr>
							<tr>
								<td>
									<h5>Credit Currency</h5> <input type="text"
									class="form-control" name="creditCurrency" value="${tdetail.creditCurrency }">
								</td>
								<td>
									<h5>Credit Narative</h5> <input type="text"
									class="form-control" name="creditNarative" value="${tdetail.creditNarative }">
								</td>
									<td>
									<h5>Amount</h5> <input type="text"
									class="form-control" name="amount" value="${tdetail.amount }">
								</td>
							</tr>
							<tr>
								<td>
									<h5>Commission Code</h5> <input type="text"
									class="form-control" name="commissionCode" value="${tdetail.commissionCode }">
								</td>
								<td>
									<h5>Commission Type</h5> <input type="text"
									class="form-control" name="commissionType" value="${tdetail.commissionType }">
								</td>
								<td>
									<h5>Commission Amount</h5> <input type="text"
									class="form-control" name="commissionAmount" value="${tdetail.commissionAmount }">
								</td>
							</tr>
							<tr>
								<td>
									<h5>Cheque Number</h5> <input type="text"
									class="form-control" name="chequeNumber" value="${tdetail.chequeNumber }">
								</td>
								<td>
									<h5>Processing Date</h5> <input type="text"
									class="form-control" name="processingDate" value="${tdetail.processingDate }">
								</td>
								<td>
									<h5>Override</h5> <input type="text"
									class="form-control" name="Override" value="${tdetail.override }">
								</td>
							</tr>
							<tr>
								
								<td>
									<h5>Record Status</h5> <input type="text"
									class="form-control" name="recordStatus" value="${tdetail.recordStatus }">
								</td>
								<td>
									<h5>Branch Code</h5> <input type="text"
									class="form-control" name="branchCode" value="${tdetail.branchCode }">
								</td>
							</tr>
						</tbody>
					</table>
			</form>
		</div>
</div>
</body>
<script>
  $.validate({
    lang: 'en',
    modules : 'date,toggleDisabled',
	  disabledFormFilter : 'form.toggle-disabled',
	 showErrorDialogs : false

    });
</script>